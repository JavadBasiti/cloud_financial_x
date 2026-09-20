import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../domain/cost_center.dart';
import '../../domain/hesab.dart';
import '../../domain/journal.dart';
import '../../domain/journal_row.dart';
import '../../domain/services/cost_center_service.dart';
import '../../domain/services/hesab_service.dart';
import '../../domain/services/journal_service.dart';
import '../common/form_mod.dart';
import '../common/format_utils.dart';
import 'journal_form_controller.dart';
import 'journal_row_dialog.dart';

/// صفحهٔ مدیریت اسناد حسابداری مرکب (Journal / سند دوبل)
///
/// این صفحه کل چرخهٔ CRUD یک سند را پوشش می‌دهد:
/// - نمایش لیست اسناد و ردیف‌های آنها (به صورت واکنشی از پایگاه‌داده محلی)
/// - ایجاد سند جدید به همراه ردیف‌ها (ذخیرهٔ اتمی)
/// - ویرایش سند و ردیف‌ها (افزودن/ویرایش/حذف ردیف)
/// - حذف نرم سند به همراه ردیف‌ها
/// - امضا/لغو امضای سند (سند امضاشده قابل ویرایش نیست)
///
/// معماری:
/// UI ← JournalFormController / JournalRowFormController ← JournalService ←
/// JournalRepository ← Drift + SyncQueue
class CompoundDocumentPage extends StatefulWidget {
  const CompoundDocumentPage({super.key});

  @override
  State<CompoundDocumentPage> createState() => _CompoundDocumentPageState();
}

class _CompoundDocumentPageState extends State<CompoundDocumentPage> {
  late final JournalService _journalService;

  StreamSubscription<List<Hesab>>? _hesabSubscription;
  StreamSubscription<List<CostCenter>>? _costCenterSubscription;

  List<Hesab> _hesabs = const [];
  List<CostCenter> _costCenters = const [];

  /// وضعیت فرم ایجاد/ویرایش سند
  bool _isFormOpen = false;
  bool _isSaving = false;
  FormMode _formMode = FormMode.create;
  JournalFormController? _form;

  /// ردیف‌های در حال ویرایش سند (پیش‌نویس محلی تا لحظهٔ ذخیره)
  final List<JournalRow> _rows = [];

  /// شناسهٔ سندی که جزئیات آن در لیست باز شده است
  String? _expandedJournalId;

  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _referenceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _journalService = context.read<JournalService>();

    _hesabSubscription = context.read<HesabService>().watchHesabs().listen((items) {
      if (mounted) setState(() => _hesabs = items);
    });
    _costCenterSubscription =
        context.read<CostCenterService>().watchCostCenters().listen((items) {
      if (mounted) setState(() => _costCenters = items);
    });
  }

  @override
  void dispose() {
    _hesabSubscription?.cancel();
    _costCenterSubscription?.cancel();
    _descriptionController.dispose();
    _referenceController.dispose();
    _form?.dispose();
    super.dispose();
  }

  // --------------------------------------------------------------------------
  // کمک‌متدها
  // --------------------------------------------------------------------------

  Hesab? _hesabById(String id) {
    for (final hesab in _hesabs) {
      if (hesab.id == id) return hesab;
    }
    return null;
  }

  CostCenter? _costCenterById(String id) {
    for (final costCenter in _costCenters) {
      if (costCenter.id == id) return costCenter;
    }
    return null;
  }

  String _hesabCode(String id) => _hesabById(id)?.code ?? '----';

  String _hesabTitle(String id) => _hesabById(id)?.descF ?? 'سرفصل نامشخص';

  void _showMessage(String message, {Color? color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(fontSize: 12)),
        backgroundColor: color,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  // --------------------------------------------------------------------------
  // مدیریت فرم سند
  // --------------------------------------------------------------------------

  Future<void> _openCreateForm() async {
    var suggestedNumber = 0;
    try {
      suggestedNumber = await _journalService.nextReferenceNumber();
    } catch (_) {
      suggestedNumber = 0;
    }
    if (!mounted) return;

    final controller = JournalFormController();
    if (suggestedNumber > 0) controller.setReferenceNumber(suggestedNumber);

    setState(() {
      _form?.dispose();
      _form = controller;
      _formMode = FormMode.create;
      _rows.clear();
      _isFormOpen = true;
      _descriptionController.text = '';
      _referenceController.text = suggestedNumber > 0 ? '$suggestedNumber' : '';
    });
  }

  Future<void> _openEditForm(Journal journal) async {
    if (journal.signed) {
      _showMessage(
        'سند امضا شده قابل ویرایش نیست؛ ابتدا امضای سند را بردارید.',
        color: Colors.orange.shade700,
      );
      return;
    }

    List<JournalRow> rows;
    try {
      rows = await _journalService.getJournalRowsByJournalId(journal.id);
    } catch (e) {
      if (!mounted) return;
      _showMessage('خطا در بارگذاری ردیف‌های سند: $e', color: Colors.red);
      return;
    }
    if (!mounted) return;

    final controller = JournalFormController(journal: journal);

    setState(() {
      _form?.dispose();
      _form = controller;
      _formMode = FormMode.edit;
      _rows
        ..clear()
        ..addAll(rows);
      _isFormOpen = true;
      _descriptionController.text = journal.description;
      _referenceController.text =
          (journal.referenceNumber ?? 0) == 0 ? '' : '${journal.referenceNumber}';
    });
  }

  void _closeForm() {
    setState(() {
      _isFormOpen = false;
      _isSaving = false;
      _rows.clear();
      _form?.dispose();
      _form = null;
    });
  }

  Future<void> _addRow() async {
    final form = _form;
    if (form == null) return;

    final row = await showJournalRowDialog(
      context: context,
      journalId: form.journalId,
      noSnd: form.referenceNumber.value,
      date: form.date.value,
      rowF: _rows.length + 1,
      currencyCode: form.currencyCode.value,
      hesabs: _hesabs,
      costCenters: _costCenters,
    );

    if (row != null && mounted) {
      setState(() => _rows.add(row));
    }
  }

  Future<void> _editRow(int index) async {
    final form = _form;
    if (form == null) return;

    final existing = _rows[index];
    if (existing.isAuto) {
      _showMessage(
        'این ردیف به صورت خودکار تولید شده و قابل ویرایش دستی نیست.',
        color: Colors.orange.shade700,
      );
      return;
    }

    final row = await showJournalRowDialog(
      context: context,
      journalId: form.journalId,
      noSnd: form.referenceNumber.value,
      date: form.date.value,
      rowF: index + 1,
      currencyCode: form.currencyCode.value,
      hesabs: _hesabs,
      costCenters: _costCenters,
      row: existing,
    );

    if (row != null && mounted) {
      setState(() => _rows[index] = row);
    }
  }

  void _removeRow(int index) {
    final existing = _rows[index];
    if (existing.isAuto) {
      _showMessage(
        'ردیف خودکار قابل حذف دستی نیست.',
        color: Colors.orange.shade700,
      );
      return;
    }
    setState(() => _rows.removeAt(index));
  }

  Future<void> _saveJournal() async {
    final form = _form;
    if (form == null) return;

    setState(() => _isSaving = true);

    if (!form.validateAll(now: DateTime.now())) {
      setState(() => _isSaving = false);
      _showMessage(
        'لطفاً خطاهای فرم سند را برطرف کنید',
        color: Colors.orange.shade800,
      );
      return;
    }

    try {
      final journal = form.buildJournal(now: DateTime.now());
      await _journalService.saveJournalWithRows(
        journal: journal,
        rows: List<JournalRow>.of(_rows),
        mode: _formMode,
        now: DateTime.now(),
      );

      if (!mounted) return;
      final isCreate = _formMode == FormMode.create;
      _closeForm();
      _showMessage(
        isCreate ? 'سند با موفقیت ثبت شد' : 'سند با موفقیت به‌روزرسانی شد',
        color: Colors.green.shade600,
      );
    } on JournalValidationException catch (e) {
      if (!mounted) return;
      setState(() => _isSaving = false);
      _showMessage(e.message, color: Colors.orange.shade800);
    } catch (e) {
      if (!mounted) return;
      setState(() => _isSaving = false);
      _showMessage('خطا در ذخیره سند: $e', color: Colors.red);
    }
  }

  Future<void> _deleteJournal(Journal journal) async {
    if (journal.signed) {
      _showMessage(
        'سند امضا شده قابل حذف نیست؛ ابتدا امضای سند را بردارید.',
        color: Colors.orange.shade700,
      );
      return;
    }

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('تأیید حذف سند', style: TextStyle(fontSize: 14)),
        content: Text(
          'سند شماره ${journal.referenceNumber ?? '-'} به همراه تمام ردیف‌های آن حذف می‌شود. ادامه می‌دهید؟',
          style: const TextStyle(fontSize: 12),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('خیر'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: const Text('بله، حذف شود'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;
    if (!mounted) return;

    try {
      await _journalService.deleteJournal(journal, now: DateTime.now());
      if (!mounted) return;
      _showMessage('سند حذف شد', color: Colors.green.shade600);
    } catch (e) {
      if (!mounted) return;
      _showMessage('خطا در حذف سند: $e', color: Colors.red);
    }
  }

  Future<void> _toggleSign(Journal journal, List<JournalRow> rows) async {
    if (!journal.signed) {
      final errors = _journalService.validateJournal(journal, rows);
      if (errors.isNotEmpty) {
        _showMessage(
          'امضای سند ممکن نیست:\n${errors.join('\n')}',
          color: Colors.orange.shade800,
        );
        return;
      }
    }

    try {
      await _journalService.setSigned(journal, !journal.signed, now: DateTime.now());
      if (!mounted) return;
      _showMessage(
        journal.signed ? 'امضای سند برداشته شد' : 'سند امضا شد',
        color: Colors.green.shade600,
      );
    } catch (e) {
      if (!mounted) return;
      _showMessage('خطا در تغییر وضعیت امضا: $e', color: Colors.red);
    }
  }

  // --------------------------------------------------------------------------
  // ساخت رابط کاربری
  // --------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF7C3AED), Color(0xFF2563EB)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: _isFormOpen ? _buildFormView() : _buildListView(),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: _isFormOpen
          ? null
          : FloatingActionButton(
              onPressed: _openCreateForm,
              backgroundColor: Colors.green.shade600,
              child: const Icon(Icons.add, color: Colors.white),
            ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
                onPressed: () {
                  if (_isFormOpen) {
                    _closeForm();
                  } else {
                    context.go('/dashboard');
                  }
                },
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.description_outlined,
                  color: Color(0xFF7C3AED),
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _isFormOpen
                          ? (_formMode == FormMode.create
                              ? 'ایجاد سند مرکب جدید'
                              : 'ویرایش سند مرکب')
                          : 'مدیریت اسناد مرکب',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      _isFormOpen
                          ? (_formMode == FormMode.create
                              ? 'Create New Compound Document'
                              : 'Edit Compound Document')
                          : 'Compound Documents Management',
                      style: const TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            _isFormOpen
                ? 'ثبت عملیات مالی با چندین حساب (حسابداری دوبل)'
                : 'مدیریت و کنترل اسناد حسابداری مرکب',
            style: const TextStyle(color: Colors.white70, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // --------------------------- نمای لیست اسناد ------------------------------

  Widget _buildListView() {
    return StreamBuilder<List<Journal>>(
      stream: _journalService.watchJournals(),
      builder: (context, journalSnapshot) {
        if (journalSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (journalSnapshot.hasError) {
          return Center(
            child: Text(
              'خطا در بارگذاری اسناد: ${journalSnapshot.error}',
              style: const TextStyle(fontSize: 12),
            ),
          );
        }

        final journals = List<Journal>.of(journalSnapshot.data ?? const [])
          ..sort((a, b) {
            final byDate = b.date.compareTo(a.date);
            if (byDate != 0) return byDate;
            return (b.referenceNumber ?? 0).compareTo(a.referenceNumber ?? 0);
          });

        return StreamBuilder<List<JournalRow>>(
          stream: _journalService.watchJournalRows(),
          builder: (context, rowSnapshot) {
            final grouped = <String, List<JournalRow>>{};
            for (final row in rowSnapshot.data ?? const <JournalRow>[]) {
              grouped.putIfAbsent(row.journalId, () => <JournalRow>[]).add(row);
            }
            for (final rows in grouped.values) {
              rows.sort((a, b) => a.rowF.compareTo(b.rowF));
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildSummaryCards(journals, grouped),
                  const SizedBox(height: 16),
                  _buildDocumentsList(journals, grouped),
                  const SizedBox(height: 72),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildSummaryCards(
    List<Journal> journals,
    Map<String, List<JournalRow>> grouped,
  ) {
    final signedCount = journals.where((j) => j.signed).length;
    final draftCount = journals.length - signedCount;
    final totalAmount = journals.fold<double>(
      0,
      (sum, j) => sum + _journalService.calculateBalance(grouped[j.id] ?? const []).total,
    );

    return Row(
      children: [
        Expanded(
          child: _buildSummaryCard(
            '${journals.length}',
            'کل اسناد',
            Colors.blue.shade600,
            Colors.blue.shade50,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildSummaryCard(
            '$signedCount',
            'امضا شده',
            Colors.green.shade600,
            Colors.green.shade50,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildSummaryCard(
            '$draftCount',
            'پیش‌نویس',
            Colors.orange.shade600,
            Colors.orange.shade50,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildSummaryCard(
            formatMoney(totalAmount),
            'گردش کل',
            Colors.purple.shade600,
            Colors.purple.shade50,
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryCard(String count, String label, Color textColor, Color bgColor) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            FittedBox(
              child: Text(
                count,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(label, style: TextStyle(fontSize: 11, color: textColor)),
          ],
        ),
      ),
    );
  }

  Widget _buildDocumentsList(
    List<Journal> journals,
    Map<String, List<JournalRow>> grouped,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.description_outlined, size: 16),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'فهرست اسناد حسابداری',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
                TextButton(
                  onPressed: () => _showMessage('گزارش‌گیری در فاز گزارش‌ها اضافه می‌شود'),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.print_outlined, size: 14),
                      SizedBox(width: 4),
                      Text('چاپ گزارش', style: TextStyle(fontSize: 10)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (journals.isEmpty)
              Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Icon(Icons.note_add_outlined, size: 32, color: Colors.grey.shade400),
                    const SizedBox(height: 8),
                    Text(
                      'هنوز سندی ثبت نشده است',
                      style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'برای ثبت اولین سند روی دکمهٔ + بزنید',
                      style: TextStyle(fontSize: 10, color: Colors.grey.shade500),
                    ),
                  ],
                ),
              )
            else
              ...journals.map(
                (journal) => _buildDocumentItem(journal, grouped[journal.id] ?? const []),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDocumentItem(Journal journal, List<JournalRow> rows) {
    final balance = _journalService.calculateBalance(rows);
    final isExpanded = _expandedJournalId == journal.id;
    final visibleRows = isExpanded ? rows : rows.take(2).toList();

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.purple.shade100,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Icon(
                  journal.signed ? Icons.verified_outlined : Icons.description_outlined,
                  size: 16,
                  color: Colors.purple,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          'سند ${journal.referenceNumber ?? '-'}',
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        _buildBadge(
                          journal.signed ? 'امضا شده' : 'پیش‌نویس',
                          journal.signed ? Colors.green : Colors.orange,
                        ),
                        if (journal.isAuto) _buildBadge('خودکار', Colors.blue),
                        if (!balance.isBalanced && rows.isNotEmpty)
                          _buildBadge('نامتوازن', Colors.red),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      journal.description.isEmpty ? 'بدون شرح' : journal.description,
                      style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${formatMoney(balance.total)} ${journal.currencyCode}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade600,
                    ),
                  ),
                  Text(
                    formatJalali(journal.date),
                    style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(height: 1),
          const SizedBox(height: 8),
          Text(
            'ردیف‌های سند (${rows.length}):',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade700,
            ),
          ),
          const SizedBox(height: 8),
          if (rows.isEmpty)
            Text(
              'این سند ردیفی ندارد',
              style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
            ),
          ...visibleRows.map(_buildDocumentRowPreview),
          if (!isExpanded && rows.length > 2)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                '... و ${rows.length - 2} ردیف دیگر',
                style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
              ),
            ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.event_note_outlined, size: 12, color: Colors.grey.shade600),
                  const SizedBox(width: 4),
                  Text(
                    'تاریخ: ${formatJalaliLong(journal.date)}',
                    style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
                  ),
                ],
              ),
              TextButton(
                onPressed: () => setState(
                  () => _expandedJournalId = isExpanded ? null : journal.id,
                ),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  minimumSize: Size.zero,
                ),
                child: Text(
                  isExpanded ? 'بستن جزئیات' : 'مشاهده کامل',
                  style: const TextStyle(fontSize: 10),
                ),
              ),
              OutlinedButton(
                onPressed: () => _toggleSign(journal, rows),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  minimumSize: Size.zero,
                ),
                child: Text(
                  journal.signed ? 'لغو امضا' : 'امضا سند',
                  style: const TextStyle(fontSize: 10),
                ),
              ),
              ElevatedButton(
                onPressed: () => _openEditForm(journal),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade600,
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  minimumSize: Size.zero,
                ),
                child: const Text(
                  'ویرایش',
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () => _deleteJournal(journal),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade600,
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  minimumSize: Size.zero,
                ),
                child: const Text(
                  'حذف',
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(String text, MaterialColor color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w500,
          color: color.shade800,
        ),
      ),
    );
  }

  Widget _buildDocumentRowPreview(JournalRow row) {
    final costCenter = _costCenterById(row.costCenterId);

    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Text(
                  _hesabCode(row.hesabId),
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade800,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  _hesabTitle(row.hesabId),
                  style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (row.prBed > 0)
                Text(
                  'بدهکار: ${formatMoney(row.prBed)}',
                  style: TextStyle(fontSize: 10, color: Colors.red.shade600),
                ),
              if (row.prBest > 0)
                Text(
                  'بستانکار: ${formatMoney(row.prBest)}',
                  style: TextStyle(fontSize: 10, color: Colors.green.shade600),
                ),
            ],
          ),
          if (row.descRow.isNotEmpty || costCenter != null || row.media.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Wrap(
                spacing: 12,
                runSpacing: 2,
                children: [
                  if (row.descRow.isNotEmpty)
                    Text(
                      row.descRow,
                      style: TextStyle(fontSize: 10, color: Colors.grey.shade700),
                    ),
                  if (costCenter != null)
                    Text(
                      'مرکز هزینه: ${costCenter.name}',
                      style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
                    ),
                  if (row.media.isNotEmpty)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.attachment_outlined,
                            size: 11, color: Colors.grey.shade600),
                        const SizedBox(width: 2),
                        Text(
                          'پیوست',
                          style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  // --------------------------- نمای فرم سند ---------------------------------

  Widget _buildFormView() {
    final form = _form;
    if (form == null) return const SizedBox.shrink();

    return ChangeNotifierProvider<JournalFormController>.value(
      value: form,
      child: Consumer<JournalFormController>(
        builder: (context, journalForm, _) {
          final balance = _journalService.calculateBalance(_rows);

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _buildJournalHeaderCard(journalForm),
                const SizedBox(height: 16),
                _buildRowsCard(journalForm),
                const SizedBox(height: 16),
                _buildBalanceCard(balance, journalForm),
                const SizedBox(height: 16),
                _buildActionButtons(balance),
                const SizedBox(height: 24),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildJournalHeaderCard(JournalFormController form) {
    final currencies = <String>{...kSupportedCurrencies, form.currencyCode.value}.toList();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'اطلاعات کلی سند',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'تاریخ سند',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 4),
                      InkWell(
                        onTap: () => _pickDate(form),
                        borderRadius: BorderRadius.circular(6),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFFE5E7EB)),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.calendar_today_outlined, size: 14),
                              const SizedBox(width: 8),
                              Text(
                                JalaliDate.fromDateTime(form.date.value).format(),
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'شماره سند',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 4),
                      TextField(
                        controller: _referenceController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9۰-۹٠-٩]')),
                        ],
                        style: const TextStyle(fontSize: 12),
                        decoration: InputDecoration(
                          hintText: 'خودکار',
                          hintStyle: const TextStyle(fontSize: 11),
                          errorText: form.referenceNumber.error,
                        ),
                        onChanged: (value) =>
                            form.setReferenceNumber(parseIntValue(value)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'ارز / پایه مالی',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 4),
                      DropdownButtonFormField<String>(
                        key: ValueKey('journal-currency-${form.currencyCode.value}'),
                        initialValue: form.currencyCode.value,
                        isExpanded: true,
                        decoration: InputDecoration(errorText: form.currencyCode.error),
                        style: const TextStyle(fontSize: 12, color: Colors.black),
                        items: currencies
                            .map((c) => DropdownMenuItem<String>(value: c, child: Text(c)))
                            .toList(),
                        onChanged: (value) => _changeCurrency(form, value ?? 'IRR'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              'شرح سند',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 4),
            TextField(
              controller: _descriptionController,
              maxLines: 2,
              maxLength: 400,
              style: const TextStyle(fontSize: 12),
              decoration: InputDecoration(
                hintText: 'توضیحات کامل سند را وارد کنید...',
                hintStyle: const TextStyle(fontSize: 11),
                errorText: form.description.error,
                counterText: '',
              ),
              onChanged: form.setDescription,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    value: form.isAuto.value,
                    onChanged: form.setIsAuto,
                    title: const Text('سند خودکار', style: TextStyle(fontSize: 11)),
                    subtitle: const Text(
                      'تولیدشده توسط سیستم',
                      style: TextStyle(fontSize: 9),
                    ),
                  ),
                ),
                Expanded(
                  child: SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    value: form.signed.value,
                    onChanged: form.setSigned,
                    title: const Text('امضای سند', style: TextStyle(fontSize: 11)),
                    subtitle: const Text(
                      'سند امضاشده قابل ویرایش نیست',
                      style: TextStyle(fontSize: 9),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// تغییر ارز سند؛ ارز تمام ردیف‌های پیش‌نویس نیز هماهنگ می‌شود
  void _changeCurrency(JournalFormController form, String currency) {
    form.setCurrencyCode(currency);
    setState(() {
      for (var i = 0; i < _rows.length; i++) {
        _rows[i] = _rows[i].copyWith(currencyCode: currency);
      }
    });
  }

  Future<void> _pickDate(JournalFormController form) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: form.date.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      helpText: 'انتخاب تاریخ سند',
    );
    if (picked != null) form.setDate(picked);
  }

  Widget _buildRowsCard(JournalFormController form) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'ردیف‌های سند',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
                ElevatedButton(
                  onPressed: _addRow,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade600,
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    minimumSize: Size.zero,
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add, size: 14, color: Colors.white),
                      SizedBox(width: 4),
                      Text('افزودن ردیف',
                          style: TextStyle(fontSize: 10, color: Colors.white)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (_rows.isEmpty)
              Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Icon(Icons.add_circle_outline, size: 32, color: Colors.grey.shade400),
                    const SizedBox(height: 8),
                    Text(
                      'هنوز ردیفی اضافه نشده است',
                      style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'یک سند حسابداری حداقل به دو ردیف (بدهکار و بستانکار) نیاز دارد',
                      style: TextStyle(fontSize: 10, color: Colors.grey.shade500),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            else
              ...List.generate(_rows.length, (index) => _buildEditableRow(index)),
          ],
        ),
      ),
    );
  }

  Widget _buildEditableRow(int index) {
    final row = _rows[index];
    final costCenter = _costCenterById(row.costCenterId);

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 22,
                height: 22,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Text('${index + 1}', style: const TextStyle(fontSize: 10)),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  _hesabCode(row.hesabId),
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade800,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  _hesabTitle(row.hesabId),
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (row.isAuto)
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Icon(Icons.lock_outline, size: 14, color: Colors.grey.shade500),
                ),
              IconButton(
                icon: const Icon(Icons.edit, size: 16, color: Colors.blue),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                onPressed: () => _editRow(index),
              ),
              IconButton(
                icon: const Icon(Icons.delete_outline, size: 16, color: Colors.red),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                onPressed: () => _removeRow(index),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              if (row.prBed > 0)
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      'بدهکار: ${formatMoney(row.prBed)} ${row.currencyCode}',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Colors.red.shade700,
                      ),
                    ),
                  ),
                ),
              if (row.prBed > 0 && row.prBest > 0) const SizedBox(width: 8),
              if (row.prBest > 0)
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      'بستانکار: ${formatMoney(row.prBest)} ${row.currencyCode}',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Colors.green.shade700,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          if (row.descRow.isNotEmpty || costCenter != null || row.media.isNotEmpty) ...[
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (row.descRow.isNotEmpty)
                    Text(
                      row.descRow,
                      style: TextStyle(fontSize: 11, color: Colors.grey.shade700),
                    ),
                  if (costCenter != null)
                    Text(
                      'مرکز هزینه: ${costCenter.code} - ${costCenter.name}',
                      style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
                    ),
                  if (row.media.isNotEmpty)
                    Text(
                      'پیوست: ${row.media}',
                      style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildBalanceCard(JournalBalance balance, JournalFormController form) {
    final currency = form.currencyCode.value;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'تراز سند',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildBalanceBox(
                    'کل بدهکار',
                    '${formatMoney(balance.totalDebit)} $currency',
                    Colors.red,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildBalanceBox(
                    'کل بستانکار',
                    '${formatMoney(balance.totalCredit)} $currency',
                    Colors.green,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildBalanceBox(
                    'اختلاف',
                    balance.isBalanced
                        ? 'متعادل'
                        : '${formatMoney(balance.difference.abs())} $currency',
                    balance.isBalanced ? Colors.blue : Colors.orange,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceBox(String label, String value, MaterialColor color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(label, style: TextStyle(fontSize: 12, color: color.shade700)),
          const SizedBox(height: 4),
          FittedBox(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: color.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(JournalBalance balance) {
    final canSave = !_isSaving && _rows.length >= 2 && balance.isBalanced;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            if (!balance.isBalanced || _rows.length < 2)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, size: 14, color: Colors.orange.shade700),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        _rows.length < 2
                            ? 'برای ذخیره، سند باید حداقل دو ردیف داشته باشد.'
                            : 'برای ذخیره، جمع بدهکار و بستانکار باید برابر باشد.',
                        style: TextStyle(fontSize: 11, color: Colors.orange.shade800),
                      ),
                    ),
                  ],
                ),
              ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: _isSaving ? null : _closeForm,
                    child: const Text('انصراف', style: TextStyle(fontSize: 12)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: canSave ? _saveJournal : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade600,
                    ),
                    child: _isSaving
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            _formMode == FormMode.create ? 'ذخیره سند' : 'به‌روزرسانی سند',
                            style: const TextStyle(fontSize: 12, color: Colors.white),
                          ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
