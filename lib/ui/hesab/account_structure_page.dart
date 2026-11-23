import 'dart:async';

import 'package:cloud_financial_x/domain/enums/account_level.dart';
import 'package:cloud_financial_x/domain/hesab.dart';
import 'package:cloud_financial_x/domain/services/hesab_service.dart';
import 'package:cloud_financial_x/ui/hesab/hesab_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/form_mod.dart';
import 'package:go_router/go_router.dart';

class AccountStructurePage extends StatefulWidget {
  const AccountStructurePage({super.key});

  @override
  State<AccountStructurePage> createState() => _AccountStructurePageState();
}

class _AccountStructurePageState extends State<AccountStructurePage> {
  String? selectedAccount;
  Set<String> expandedAccounts = <String>{};

  /// درخت حساب‌ها از سرفصل‌های فعال (از پایگاه‌داده می‌آید)
  List<AccountData> _accounts = const [];

  /// خطایط flat برای جستجوی سرفصل
  final Map<String, Hesab> _hesabById = {};

  late final StreamSubscription<List<Hesab>> _hesabSub;

  @override
  void initState() {
    super.initState();
    _accounts = const [];
    // دریافت داده‌ها از پایگاه‌داده به صورت واکنشی
    // هر زمان یک سرفصل اضافه/ویرایش/حذف شود، درخت حساب‌ها بازسازی می‌شود
    _hesabSub = context.read<HesabService>().watchHesabs().listen((items) {
      if (!mounted) return;
      setState(() {
        _hesabById.clear();
        for (final hesab in items) {
          _hesabById[hesab.id] = hesab;
        }
        _accounts = _buildTree(items);
      });
    });
  }

  @override
  void dispose() {
    _hesabSub.cancel();
    super.dispose();
  }

  /// ساخت درخت حساب‌ها از لیست flat سرفصل‌های پایگاه‌داده
  List<AccountData> _buildTree(List<Hesab> hesabs) {
    final active = hesabs.where((h) => !h.isDeleted).toList();

    // گروه‌بندی سرفصل‌ها بر اساس شناسه والد
    final byParent = <String?, List<Hesab>>{};
    for (final hesab in active) {
      final key = (hesab.parentId ?? '').isEmpty ? null : hesab.parentId;
      byParent.putIfAbsent(key, () => []).add(hesab);
    }
    for (final list in byParent.values) {
      list.sort((a, b) => a.code.compareTo(b.code));
    }

    // ساخت节点 با جلوگیری از حلقهٔ بازگشتی (A والد B و B والد A)
    AccountData? build(Hesab hesab, Set<String> path) {
      if (!path.add(hesab.id)) return null;
      final children = <AccountData>[];
      for (final child in byParent[hesab.id] ?? const <Hesab>[]) {
        final node = build(child, {...path});
        if (node != null) children.add(node);
      }
      path.remove(hesab.id);
      return AccountData(
        id: hesab.id,
        code: hesab.code,
        name: hesab.name,
        nameEn: hesab.nameEn,
        type: _accountTypeOf(hesab.code),
        level: hesab.level.index,
        balance: (hesab.balance ?? 0).toInt(),
        children: children,
      );
    }

    final roots = <AccountData>[];
    for (final hesab in byParent[null] ?? const <Hesab>[]) {
      final node = build(hesab, <String>{});
      if (node != null) roots.add(node);
    }

    // حساب‌های بی‌والد (والد حذف‌شده یا نامعتبر) را در سطح ریشه قرار می‌دهیم
    final consumed = <String>{};
    void collect(AccountData node) {
      consumed.add(node.id);
      for (final child in node.children) {
        collect(child);
      }
    }
    for (final root in roots) {
      collect(root);
    }
    for (final hesab in active) {
      if (!consumed.contains(hesab.id)) {
        final node = build(hesab, <String>{});
        if (node != null) roots.add(node);
      }
    }
    roots.sort((a, b) => a.code.compareTo(b.code));
    return roots;
  }

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
                  child: _buildContent(),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showEntityDialog(),
        backgroundColor: Colors.green.shade600,
        child: const Icon(Icons.switch_account_outlined, color: Colors.white),
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
                onPressed: () => context.go('/dashboard'),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.account_tree_outlined,
                  color: Color(0xFF7C3AED),
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ساختار حسابداری',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Chart of Accounts',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'مدیریت و طراحی ساختار حساب‌های مالی',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Row(
      children: [
        // Accounts Tree
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.account_tree_outlined, size: 16),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text(
                        'ساختار حساب‌ها',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => _showEntityDialog(),
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
                          Text('حساب جدید', style: TextStyle(fontSize: 10, color: Colors.white)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: _accounts.map((account) => _buildAccountItem(account, 0)).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Account Details
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.all(16),
            child: selectedAccount != null
                ? _buildAccountDetails()
                : _buildEmptyState(),
          ),
        ),
      ],
    );
  }

  Widget _buildAccountItem(AccountData account, int level) {
    final hasChildren = account.children.isNotEmpty;
    final isExpanded = expandedAccounts.contains(account.id);
    final isSelected = selectedAccount == account.id;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Column(
        children: [
          Material(
            color: isSelected ? Colors.purple.shade50 : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              onTap: () => setState(() => selectedAccount = account.id),
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding: EdgeInsets.only(
                  left: 12,
                  right: 12 + (level * 20.0),
                  top: 12,
                  bottom: 12,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isSelected
                        ? Colors.purple.shade300
                        : Colors.grey.shade300,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    if (hasChildren)
                      GestureDetector(
                        onTap: () => _toggleExpand(account.id),
                        child: Icon(
                          isExpanded
                              ? Icons.keyboard_arrow_down
                              : Icons.keyboard_arrow_left,
                          size: 16,
                          color: Colors.grey.shade600,
                        ),
                      )
                    else
                      const SizedBox(width: 16),

                    const SizedBox(width: 8),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.purple.shade100,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        account.code,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple.shade800,
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            account.name,
                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            account.nameEn,
                            style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${_formatBalance(account.balance)} ریال',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: _getAccountTypeColor(account.type),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            _getAccountTypeLabel(account.type),
                            style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w500,
                              color: _getAccountTypeTextColor(account.type),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          if (hasChildren && isExpanded)
            Column(
              children: account.children.map((child) => _buildAccountItem(child, level + 1)).toList(),
            ),
        ],
      ),
    );
  }

  Widget _buildAccountDetails() {
    final accountData = _findAccount(selectedAccount!);
    if (accountData == null) return _buildEmptyState();

    final hesab = _hesabById[selectedAccount!];
    final parentHesab = hesab != null && hesab.parentId != null
        ? _hesabById[hesab.parentId!]
        : null;

    return SingleChildScrollView(
      child: Column(
        children: [
          // Account Info
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'جزئیات حساب',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ),
                      TextButton(
                        onPressed: () => _showEntityDialog(hesab: hesab),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          minimumSize: Size.zero,
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.edit_outlined, size: 12),
                            SizedBox(width: 4),
                            Text('ویرایش', style: TextStyle(fontSize: 10)),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () => _showEntityDialog(parentId: selectedAccount!),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          minimumSize: Size.zero,
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.add, size: 12),
                            SizedBox(width: 4),
                            Text('زیرحساب', style: TextStyle(fontSize: 10)),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () => _deleteAccount(selectedAccount!),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          minimumSize: Size.zero,
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.delete_outline, size: 12, color: Colors.red),
                            SizedBox(width: 4),
                            Text('حذف', style: TextStyle(fontSize: 10, color: Colors.red)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _buildDetailRow('کد حساب', accountData.code),
                  _buildDetailRow('نام حساب', accountData.name),
                  _buildDetailRow('نام انگلیسی', accountData.nameEn),
                  _buildDetailRow('سرفصل اصلی', parentHesab?.name ?? '—'),
                  Row(
                    children: [
                      const Text(
                        'نوع حساب:',
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: _getAccountTypeColor(accountData.type),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          _getAccountTypeLabel(accountData.type),
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: _getAccountTypeTextColor(accountData.type),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  _buildDetailRow('سطح', '${accountData.level}'),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Text(
                        'موجودی فعلی:',
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                      const Spacer(),
                      Text(
                        '${_formatBalance(accountData.balance)} ریال',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Balance Chart
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'روند موجودی',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.bar_chart_outlined, size: 32, color: Colors.grey),
                          SizedBox(height: 8),
                          Text(
                            'نمودار موجودی',
                            style: TextStyle(fontSize: 11, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Recent Transactions
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'تراکنش‌های اخیر',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 12),
                  ..._buildRecentTransactions(),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'مشاهده همه تراکنش‌ها',
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 70,
            child: Text(
              '$label:',
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildRecentTransactions() {
    final transactions = [
      {'date': '1404/03/22', 'description': 'فروش کیک شکلاتی', 'amount': '+2,500,000', 'type': 'income'},
      {'date': '1404/03/21', 'description': 'خرید مواد اولیه', 'amount': '-850,000', 'type': 'expense'},
      {'date': '1404/03/20', 'description': 'دریافت از مشتری', 'amount': '+3,200,000', 'type': 'income'},
    ];

    return transactions.map((transaction) => Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction['description']!,
                  style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                ),
                Text(
                  transaction['date']!,
                  style: TextStyle(fontSize: 10, color: Colors.grey.shade500),
                ),
              ],
            ),
          ),
          Text(
            '${transaction['amount']} ریال',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: transaction['type'] == 'income' ? Colors.green.shade600 : Colors.red.shade600,
            ),
          ),
        ],
      ),
    )).toList();
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.account_tree_outlined,
            size: 48,
            color: Colors.grey,
          ),
          SizedBox(height: 16),
          Text(
            'یک حساب انتخاب کنید',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 8),
          Text(
            'برای مشاهده جزئیات، یکی از حساب‌ها را انتخاب کنید',
            style: TextStyle(fontSize: 12, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _showEntityDialog({Hesab? hesab, String? parentId}) {
    final formMode = hesab != null ? FormMode.edit : FormMode.create;

    // ذخیره context اصلی برای استفاده بعدی
    final mainContext = context;
    final accounts = _hesabById.values.toList();

    showDialog(
      context: context,
      builder: (dialogContext) => ChangeNotifierProvider<HesabFormController>(
        create: (_) {
          final controller = HesabFormController(hesab: hesab);
          // هنگام افزودن زیرحساب، والد از قبل مشخص است
          if (parentId != null) {
            controller.parentId.set(parentId);
          }
          return controller;
        },
        child: AlertDialog(
          title: Text(formMode == FormMode.create ? 'افزودن سرفصل حساب' : 'ویرایش سرفصل حساب'),
          content: SingleChildScrollView(
            child: Consumer<HesabFormController>(
              builder: (context, form, _) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButtonFormField<int>(
                    value: form.level.value,
                    items: AccountLevel.values
                        .map((level) => DropdownMenuItem(
                              value: level.index,
                              child: Text('سطح ${level.index}'),
                            ))
                        .toList(),
                    onChanged: (value) => form.level.set(value ?? 0),
                    decoration: const InputDecoration(
                      labelText: 'سطح',
                      isDense: true,
                    ),
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    value: form.parentId.value.isEmpty ||
                            !accounts.any((account) =>
                                account.id == form.parentId.value)
                        ? null
                        : form.parentId.value,
                    items: [
                      DropdownMenuItem(
                        value: '',
                        child: const Text('سرفصل اصلی'),
                      ),
                      ...accounts.map(
                        (account) => DropdownMenuItem(
                          value: account.id,
                          child: Text(
                            '${account.code} - ${account.name}',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                    onChanged: (value) => form.parentId.set(value ?? ''),
                    decoration: const InputDecoration(
                      labelText: 'سرفصل اصلی',
                      isDense: true,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'کد',
                      errorText: form.code.error,
                      isDense: true,
                    ),
                    onChanged: (value) => form.code.set(value),
                    controller: TextEditingController(text: form.code.value),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'کدگذاری: ۱xxx دارایی، ۲xxx بدهی، ۳xxx حقوق، ۴xxx درآمد، ۵xxx هزینه، ۶xxx امانی',
                        style: TextStyle(fontSize: 9, color: Colors.grey),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'نام',
                      errorText: form.name.error,
                      isDense: true,
                    ),
                    onChanged: (value) => form.name.set(value),
                    controller: TextEditingController(text: form.name.value),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'موجودی',
                      errorText: form.balance.error,
                      isDense: true,
                    ),
                    onChanged: (value) => form.balance.set(double.tryParse(value) ?? 0),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    controller: TextEditingController(text: form.balance.value.toString()),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'قیمت ارز',
                      errorText: form.fuPrice.error,
                      isDense: true,
                    ),
                    onChanged: (value) => form.fuPrice.set(double.tryParse(value) ?? 0),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    controller: TextEditingController(text: form.fuPrice.value.toString()),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'نام انگلیسی',
                      errorText: form.nameEn.error,
                      isDense: true,
                    ),
                    onChanged: (value) => form.nameEn.set(value),
                    keyboardType: TextInputType.text,
                    controller: TextEditingController(text: form.nameEn.value),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('لغو'),
            ),
            Consumer<HesabFormController>(
              builder: (context, form, _) => TextButton(
                onPressed: () async {
                  try {
                    final hesab = form.buildHesab(now: DateTime.now());
                    await dialogContext
                        .read<HesabService>()
                        .saveHesab(hesab, formMode, now: DateTime.now());
                    if (!dialogContext.mounted) return;
                    // بستن دیالوگ
                    Navigator.pop(dialogContext);

                    // نمایش پیام موفقیت
                    if (!mainContext.mounted) return;
                    ScaffoldMessenger.of(mainContext).showSnackBar(
                      const SnackBar(
                        content: Text('عملیات با موفقیت انجام شد'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  } on Exception catch (e) {
                    if (!mainContext.mounted) return;
                    ScaffoldMessenger.of(mainContext).showSnackBar(
                      SnackBar(content: Text('خطا: ${e.toString()}')),
                    );
                  }
                },
                child: Text(formMode == FormMode.create ? 'افزودن' : 'ویرایش'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _deleteAccount(String id) {
    final hesab = _hesabById[id];
    if (hesab == null) return;

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('حذف حساب'),
        content: Text('آیا از حذف حساب «${hesab.name}» مطمئن هستید؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('لغو'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(dialogContext);
              try {
                await context
                    .read<HesabService>()
                    .deleteHesab(hesab, now: DateTime.now());
                if (mounted) {
                  setState(() {
                    if (selectedAccount == id) {
                      selectedAccount = null;
                    }
                  });
                }
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('حساب با موفقیت حذف شد'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              } on Exception catch (e) {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('خطا: ${e.toString()}')),
                  );
                }
              }
            },
            child: const Text('حذف', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _toggleExpand(String accountId) {
    setState(() {
      if (expandedAccounts.contains(accountId)) {
        expandedAccounts.remove(accountId);
      } else {
        expandedAccounts.add(accountId);
      }
    });
  }

  AccountData? _findAccount(String id) {
    AccountData? findInList(List<AccountData> accounts) {
      for (final account in accounts) {
        if (account.id == id) return account;
        final found = findInList(account.children);
        if (found != null) return found;
      }
      return null;
    }
    return findInList(_accounts);
  }

  /// طرف حساب بر اساس کد حساب (عدد اول کد)
  AccountType _accountTypeOf(String code) {
    final first = code.trim().isEmpty ? '' : code.trim().substring(0, 1);
    return switch (first) {
      '1' => AccountType.asset,
      '2' => AccountType.liability,
      '3' => AccountType.equity,
      '4' => AccountType.income,
      '5' => AccountType.expense,
      '6' => AccountType.regulatory,
      _ => AccountType.other,
    };
  }

  String _formatBalance(int balance) {
    return balance.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }

  String _getAccountTypeLabel(AccountType type) {
    switch (type) {
      case AccountType.asset:
        return 'دارایی';
      case AccountType.liability:
        return 'بدهی';
      case AccountType.equity:
        return 'حقوق';
      case AccountType.income:
        return 'درآمد';
      case AccountType.expense:
        return 'هزینه';
      case AccountType.regulatory:
        return 'امانی';
      case AccountType.other:
        return 'سایر';
    }
  }

  Color _getAccountTypeColor(AccountType type) {
    switch (type) {
      case AccountType.asset:
        return Colors.green.shade100;
      case AccountType.liability:
        return Colors.red.shade100;
      case AccountType.equity:
        return Colors.teal.shade100;
      case AccountType.income:
        return Colors.blue.shade100;
      case AccountType.expense:
        return Colors.orange.shade100;
      case AccountType.regulatory:
        return Colors.purple.shade100;
      case AccountType.other:
        return Colors.grey.shade100;
    }
  }

  Color _getAccountTypeTextColor(AccountType type) {
    switch (type) {
      case AccountType.asset:
        return Colors.green.shade800;
      case AccountType.liability:
        return Colors.red.shade800;
      case AccountType.equity:
        return Colors.teal.shade800;
      case AccountType.income:
        return Colors.blue.shade800;
      case AccountType.expense:
        return Colors.orange.shade800;
      case AccountType.regulatory:
        return Colors.purple.shade800;
      case AccountType.other:
        return Colors.grey.shade800;
    }
  }
}

enum AccountType {
  asset,
  liability,
  equity,
  income,
  expense,
  regulatory,
  other,
}

class AccountData {
  final String id;
  final String code;
  final String name;
  final String nameEn;
  final AccountType type;
  final int level;
  final int balance;
  final List<AccountData> children;

  AccountData({
    required this.id,
    required this.code,
    required this.name,
    required this.nameEn,
    required this.type,
    required this.level,
    required this.balance,
    required this.children,
  });
}
