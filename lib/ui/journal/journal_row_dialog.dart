import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../domain/cost_center.dart';
import '../../domain/hesab.dart';
import '../../domain/journal_row.dart';
import '../common/format_utils.dart';
import 'journal_row_form_controller.dart';

/// ارزها/پایه‌های مالی پشتیبانی‌شده در فرم سند
///
/// بر اساس اسناد پروژه، سیستم باید پایه‌های مالی مختلف (ریالی، ارزی و رمزارز)
/// را پشتیبانی کند.
const List<String> kSupportedCurrencies = <String>[
  'IRR',
  'USD',
  'EUR',
  'AED',
  'BTC',
  'USDT',
];

/// نمایش دیالوگ افزودن/ویرایش ردیف سند
///
/// خروجی: ردیف ساخته‌شده (JournalRow) یا null در صورت انصراف
Future<JournalRow?> showJournalRowDialog({
  required BuildContext context,
  required String journalId,
  required int noSnd,
  required DateTime date,
  required int rowF,
  required String currencyCode,
  required List<Hesab> hesabs,
  required List<CostCenter> costCenters,
  JournalRow? row,
}) {
  return showDialog<JournalRow>(
    context: context,
    builder: (dialogContext) => ChangeNotifierProvider<JournalRowFormController>(
      create: (_) => JournalRowFormController(
        journalRow: row,
        journalId: journalId,
        noSnd: noSnd,
        date: date,
        rowF: rowF,
        currencyCode: currencyCode,
      ),
      child: _JournalRowDialog(
        hesabs: hesabs,
        costCenters: costCenters,
        isEditing: row != null,
        rowNumber: rowF,
      ),
    ),
  );
}

class _JournalRowDialog extends StatefulWidget {
  final List<Hesab> hesabs;
  final List<CostCenter> costCenters;
  final bool isEditing;
  final int rowNumber;

  const _JournalRowDialog({
    required this.hesabs,
    required this.costCenters,
    required this.isEditing,
    required this.rowNumber,
  });

  @override
  State<_JournalRowDialog> createState() => _JournalRowDialogState();
}

class _JournalRowDialogState extends State<_JournalRowDialog> {
  late final TextEditingController _amountController;
  late final TextEditingController _descController;
  late final TextEditingController _mediaController;

  @override
  void initState() {
    super.initState();
    final form = context.read<JournalRowFormController>();
    _amountController = TextEditingController(
      text: form.amount == 0 ? '' : formatMoney(form.amount),
    );
    _descController = TextEditingController(text: form.descRow.value);
    _mediaController = TextEditingController(text: form.media.value);
  }

  @override
  void dispose() {
    _amountController.dispose();
    _descController.dispose();
    _mediaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<JournalRowFormController>(
      builder: (context, form, _) {
        final hesabIds = widget.hesabs.map((h) => h.id).toSet();
        final selectedHesab =
            hesabIds.contains(form.hesabId.value) ? form.hesabId.value : null;

        final costCenterIds = widget.costCenters.map((c) => c.id).toSet();
        final selectedCostCenter = costCenterIds.contains(form.costCenterId.value)
            ? form.costCenterId.value
            : null;

        final currencies = <String>{...kSupportedCurrencies, form.currencyCode.value}.toList();

        return AlertDialog(
          title: Text(
            widget.isEditing
                ? 'ویرایش ردیف ${widget.rowNumber}'
                : 'افزودن ردیف ${widget.rowNumber}',
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          content: SizedBox(
            width: 420,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (widget.hesabs.isEmpty)
                    Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade50,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        'هیچ سرفصل حسابی تعریف نشده است. ابتدا از صفحهٔ «ساختار حساب‌ها» سرفصل تعریف کنید.',
                        style: TextStyle(fontSize: 11, color: Colors.orange.shade900),
                      ),
                    ),

                  // سرفصل حساب (hesabId)
                  DropdownButtonFormField<String>(
                    key: ValueKey('hesab-${selectedHesab ?? ''}'),
                    initialValue: selectedHesab,
                    isExpanded: true,
                    decoration: InputDecoration(
                      labelText: 'سرفصل حساب',
                      errorText: form.hesabId.error,
                    ),
                    style: const TextStyle(fontSize: 12, color: Colors.black),
                    items: widget.hesabs
                        .map(
                          (h) => DropdownMenuItem<String>(
                            value: h.id,
                            child: Text(
                              '${h.code} - ${h.descF}',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) => form.setHesabId(value ?? ''),
                  ),
                  const SizedBox(height: 12),

                  // سمت ردیف: بدهکار / بستانکار
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: SegmentedButton<JournalRowSide>(
                      showSelectedIcon: false,
                      segments: const [
                        ButtonSegment<JournalRowSide>(
                          value: JournalRowSide.debit,
                          label: Text('بدهکار', style: TextStyle(fontSize: 11)),
                        ),
                        ButtonSegment<JournalRowSide>(
                          value: JournalRowSide.credit,
                          label: Text('بستانکار', style: TextStyle(fontSize: 11)),
                        ),
                      ],
                      selected: {form.side},
                      onSelectionChanged: (selection) => form.setSide(selection.first),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // مبلغ (prBed یا prBest بر اساس سمت انتخاب‌شده)
                  TextField(
                    controller: _amountController,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9۰-۹٠-٩,.\s]')),
                    ],
                    style: const TextStyle(fontSize: 12),
                    decoration: InputDecoration(
                      labelText: form.side == JournalRowSide.debit
                          ? 'مبلغ بدهکار'
                          : 'مبلغ بستانکار',
                      errorText: form.amountError,
                      suffixText: form.currencyCode.value,
                    ),
                    onChanged: (value) => form.setAmount(parseAmount(value)),
                  ),
                  const SizedBox(height: 12),

                  // مرکز هزینه (costCenterId) - اختیاری
                  DropdownButtonFormField<String>(
                    key: ValueKey('cost-center-${selectedCostCenter ?? ''}'),
                    initialValue: selectedCostCenter,
                    isExpanded: true,
                    decoration: InputDecoration(
                      labelText: 'مرکز هزینه (اختیاری)',
                      errorText: form.costCenterId.error,
                    ),
                    style: const TextStyle(fontSize: 12, color: Colors.black),
                    items: [
                      const DropdownMenuItem<String>(
                        value: '',
                        child: Text('بدون مرکز هزینه'),
                      ),
                      ...widget.costCenters.map(
                        (c) => DropdownMenuItem<String>(
                          value: c.id,
                          child: Text('${c.code} - ${c.name}', overflow: TextOverflow.ellipsis),
                        ),
                      ),
                    ],
                    onChanged: (value) => form.setCostCenterId(value ?? ''),
                  ),
                  const SizedBox(height: 12),

                  // ارز ردیف (currencyCode)
                  DropdownButtonFormField<String>(
                    key: ValueKey('row-currency-${form.currencyCode.value}'),
                    initialValue: form.currencyCode.value,
                    isExpanded: true,
                    decoration: InputDecoration(
                      labelText: 'ارز / پایه مالی',
                      errorText: form.currencyCode.error,
                    ),
                    style: const TextStyle(fontSize: 12, color: Colors.black),
                    items: currencies
                        .map((c) => DropdownMenuItem<String>(value: c, child: Text(c)))
                        .toList(),
                    onChanged: (value) => form.setCurrencyCode(value ?? 'IRR'),
                  ),
                  const SizedBox(height: 12),

                  // شرح ردیف (descRow)
                  TextField(
                    controller: _descController,
                    maxLines: 2,
                    maxLength: 255,
                    style: const TextStyle(fontSize: 12),
                    decoration: InputDecoration(
                      labelText: 'شرح ردیف',
                      errorText: form.descRow.error,
                      counterText: '',
                    ),
                    onChanged: form.setDescRow,
                  ),
                  const SizedBox(height: 12),

                  // مدیا (media): لینک عکس/صوت/فایل مستند
                  TextField(
                    controller: _mediaController,
                    style: const TextStyle(fontSize: 12),
                    decoration: InputDecoration(
                      labelText: 'مدیا (لینک عکس، صوت یا فایل)',
                      errorText: form.media.error,
                      prefixIcon: const Icon(Icons.attachment_outlined, size: 18),
                    ),
                    onChanged: form.setMedia,
                  ),
                  const SizedBox(height: 4),

                  // ردیف خودکار (isAuto)
                  CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: form.isAuto.value,
                    onChanged: (value) => form.setIsAuto(value ?? false),
                    title: const Text(
                      'ردیف تولیدشده به صورت خودکار (سیستمی)',
                      style: TextStyle(fontSize: 11),
                    ),
                  ),

                  // اطلاعات سیاقی ردیف (فقط نمایشی)
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.info_outline, size: 14, color: Colors.grey.shade600),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            'شماره سند: ${form.noSnd.value == 0 ? 'خودکار' : form.noSnd.value}'
                            '  |  شماره ردیف: ${form.rowF.value}'
                            '  |  تاریخ: ${JalaliDate.fromDateTime(form.date.value).format()}',
                            style: TextStyle(fontSize: 10, color: Colors.grey.shade700),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('لغو'),
            ),
            ElevatedButton(
              onPressed: () {
                if (!form.validateAll(now: DateTime.now())) return;
                Navigator.pop(context, form.journalRow);
              },
              child: Text(widget.isEditing ? 'به‌روزرسانی ردیف' : 'افزودن ردیف'),
            ),
          ],
        );
      },
    );
  }
}
