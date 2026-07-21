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
  bool isAddingAccount = false;

  final List<AccountData> accounts = [
    AccountData(
      id: '1',
      code: '1000',
      name: 'دارایی‌های جاری',
      nameEn: 'Current Assets',
      type: AccountType.asset,
      level: 1,
      balance: 125000000,
      children: [
        AccountData(
          id: '1-1',
          code: '1100',
          name: 'نقد و بانک',
          nameEn: 'Cash & Bank',
          type: AccountType.asset,
          level: 2,
          balance: 85000000,
          children: [
            AccountData(
              id: '1-1-1',
              code: '1101',
              name: 'صندوق',
              nameEn: 'Cash',
              type: AccountType.asset,
              level: 3,
              balance: 15000000,
              children: [],
            ),
            AccountData(
              id: '1-1-2',
              code: '1102',
              name: 'بانک ملی',
              nameEn: 'Melli Bank',
              type: AccountType.asset,
              level: 3,
              balance: 45000000,
              children: [],
            ),
            AccountData(
              id: '1-1-3',
              code: '1103',
              name: 'بانک پارسیان',
              nameEn: 'Parsian Bank',
              type: AccountType.asset,
              level: 3,
              balance: 25000000,
              children: [],
            ),
          ],
        ),
        AccountData(
          id: '1-2',
          code: '1200',
          name: 'حساب‌های دریافتنی',
          nameEn: 'Accounts Receivable',
          type: AccountType.asset,
          level: 2,
          balance: 40000000,
          children: [
            AccountData(
              id: '1-2-1',
              code: '1201',
              name: 'مشتریان',
              nameEn: 'Customers',
              type: AccountType.asset,
              level: 3,
              balance: 35000000,
              children: [],
            ),
            AccountData(
              id: '1-2-2',
              code: '1202',
              name: 'چک دریافتنی',
              nameEn: 'Notes Receivable',
              type: AccountType.asset,
              level: 3,
              balance: 5000000,
              children: [],
            ),
          ],
        ),
      ],
    ),
    AccountData(
      id: '2',
      code: '2000',
      name: 'بدهی‌های جاری',
      nameEn: 'Current Liabilities',
      type: AccountType.liability,
      level: 1,
      balance: 75000000,
      children: [
        AccountData(
          id: '2-1',
          code: '2100',
          name: 'حساب‌های پرداختنی',
          nameEn: 'Accounts Payable',
          type: AccountType.liability,
          level: 2,
          balance: 45000000,
          children: [
            AccountData(
              id: '2-1-1',
              code: '2101',
              name: 'تامین‌کنندگان',
              nameEn: 'Suppliers',
              type: AccountType.liability,
              level: 3,
              balance: 40000000,
              children: [],
            ),
            AccountData(
              id: '2-1-2',
              code: '2102',
              name: 'چک پرداختنی',
              nameEn: 'Notes Payable',
              type: AccountType.liability,
              level: 3,
              balance: 5000000,
              children: [],
            ),
          ],
        ),
        AccountData(
          id: '2-2',
          code: '2200',
          name: 'بدهی‌های کوتاه‌مدت',
          nameEn: 'Short-term Debt',
          type: AccountType.liability,
          level: 2,
          balance: 30000000,
          children: [],
        ),
      ],
    ),
    AccountData(
      id: '3',
      code: '3000',
      name: 'درآمدها',
      nameEn: 'Revenues',
      type: AccountType.income,
      level: 1,
      balance: 200000000,
      children: [
        AccountData(
          id: '3-1',
          code: '3100',
          name: 'فروش کالا',
          nameEn: 'Sales',
          type: AccountType.income,
          level: 2,
          balance: 180000000,
          children: [],
        ),
        AccountData(
          id: '3-2',
          code: '3200',
          name: 'درآمد خدمات',
          nameEn: 'Service Revenue',
          type: AccountType.income,
          level: 2,
          balance: 20000000,
          children: [],
        ),
      ],
    ),
  ];

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
                      onPressed: () => _showEntityDialog(),//() => setState(() => isAddingAccount = true),
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
                      children: accounts.map((account) => _buildAccountItem(account, 0)).toList(),
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
                        onPressed: () {},
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
                    ],
                  ),
                  const SizedBox(height: 12),
                  _buildDetailRow('کد حساب', accountData.code),
                  _buildDetailRow('نام حساب', accountData.name),
                  _buildDetailRow('نام انگلیسی', accountData.nameEn),
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
  void _showEntityDialog({Hesab? hesab}) {
    FormMode formMode = hesab != null ? FormMode.edit : FormMode.create;

    // ذخیره context اصلی برای استفاده بعدی
    final mainContext = context;

    showDialog(
      context: context,
      builder: (dialogContext) => ChangeNotifierProvider<HesabFormController>(
        create: (_) => HesabFormController(hesab: hesab),
        child: AlertDialog(
          title: Text(formMode==FormMode.create ? 'افزودن سرفصل حساب' : 'ویرایش سرفصل حساب'),
          content: SingleChildScrollView(
            child: Consumer<HesabFormController>(
              builder: (context, form, _) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'سطح',errorText: form.levelF.error),
                    onChanged: (v) => form.levelF.set(int.tryParse(v)?? 0),

                    controller: TextEditingController(text: form.levelF.value.toString()),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'کد ',errorText: form.code.error),
                    onChanged: (v) => form.code.set(v),
                    controller: TextEditingController(text: form.code.value),

                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'نام',errorText: form.descF.error),
                    onChanged: (v) => form.descF.set(v),
                    controller: TextEditingController(text: form.descF.value),
                  ),
                  // TextField(
                  //   decoration: InputDecoration(labelText: 'نوع - (سرفصل اصلی)',errorText: form.parent.error),
                  //   onChanged: (v) => form.fee.set(double.tryParse(v) ?? 0),
                  //   keyboardType: TextInputType.number,
                  //   controller: TextEditingController(text: form.fee.value.toString()),
                  // ),
                  TextField(
                    decoration: InputDecoration(labelText: 'توضیحات',errorText: form.exteraDesc.error),
                    onChanged: (v) => form.exteraDesc.set(v),
                    keyboardType: TextInputType.text,
                    controller: TextEditingController(text: form.exteraDesc.value),
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
                    final hesab = form.buildHesab( now: DateTime.now());
                    await dialogContext.read<HesabService>().saveHesab(hesab, formMode, now: DateTime.now());
                    // print("saved product:\n$product");
                    // بستن دیالوگ
                    Navigator.pop(dialogContext);

                    // refresh Accounting Struct
                    // _loadHesab();

                    // نمایش پیام موفقیت
                    ScaffoldMessenger.of(mainContext).showSnackBar(
                      const SnackBar(
                        content: Text('عملیات با موفقیت انجام شد'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  } on Exception catch (e) {
                    ScaffoldMessenger.of(mainContext).showSnackBar(
                      SnackBar(content: Text('خطا: ${e.toString()}')),
                    );
                  }
                },
                child: Text(formMode==FormMode.create ? 'افزودن' : 'ویرایش'),
              ),
            ),
          ],
        ),
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
    return findInList(accounts);
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
      case AccountType.income:
        return 'درآمد';
      case AccountType.expense:
        return 'هزینه';
    }
  }

  Color _getAccountTypeColor(AccountType type) {
    switch (type) {
      case AccountType.asset:
        return Colors.green.shade100;
      case AccountType.liability:
        return Colors.red.shade100;
      case AccountType.income:
        return Colors.blue.shade100;
      case AccountType.expense:
        return Colors.orange.shade100;
    }
  }

  Color _getAccountTypeTextColor(AccountType type) {
    switch (type) {
      case AccountType.asset:
        return Colors.green.shade800;
      case AccountType.liability:
        return Colors.red.shade800;
      case AccountType.income:
        return Colors.blue.shade800;
      case AccountType.expense:
        return Colors.orange.shade800;
    }
  }
}

enum AccountType {
  asset,
  liability,
  income,
  expense,
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