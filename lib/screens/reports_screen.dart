import 'package:flutter/material.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  String _dateFrom = '1404/03/22';
  final String _dateTo = '1404/03/22';
  String _docNumber = '16196';

  final List<AccountData> _accountData = [
    AccountData(
      id: 1,
      code: '1111000001',
      account: 'جاری بانک ملی',
      accountEn: 'Bank Melli Current',
      debit: 2500000,
      credit: 0,
      balance: 2500000,
      type: AccountType.asset,
    ),
    AccountData(
      id: 2,
      code: '1111000002',
      account: 'جاری بانک صادرات',
      accountEn: 'Export Bank Current',
      debit: 0,
      credit: 750000,
      balance: -750000,
      type: AccountType.asset,
    ),
    AccountData(
      id: 3,
      code: '2111000001',
      account: 'حساب‌های پرداختنی',
      accountEn: 'Accounts Payable',
      debit: 300000,
      credit: 800000,
      balance: -500000,
      type: AccountType.liability,
    ),
    AccountData(
      id: 4,
      code: '3111000001',
      account: 'سرمایه ثبتی',
      accountEn: 'Registered Capital',
      debit: 0,
      credit: 5000000,
      balance: -5000000,
      type: AccountType.equity,
    ),
  ];

  final List<TransactionData> _transactionData = [
    TransactionData(
      id: 1,
      docNo: '16196',
      date: '1404/03/22',
      description: 'فروش کالا',
      descriptionEn: 'Product Sale',
      debit: 1500000,
      credit: 0,
      reference: 'F9',
    ),
    TransactionData(
      id: 2,
      docNo: '16197',
      date: '1404/03/22',
      description: 'خرید مواد اولیه',
      descriptionEn: 'Raw Material Purchase',
      debit: 0,
      credit: 800000,
      reference: 'F8',
    ),
    TransactionData(
      id: 3,
      docNo: '16198',
      date: '1404/03/21',
      description: 'پرداخت حقوق',
      descriptionEn: 'Salary Payment',
      debit: 0,
      credit: 2500000,
      reference: 'F7',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Header
              const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'گزارشات مالی',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F2937),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Financial Reports System',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Tab Bar
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    color: const Color(0xFF2563EB),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: const Color(0xFF374151),
                  dividerColor: Colors.transparent,
                  tabs: const [
                    Tab(text: 'دفتر کل'),
                    Tab(text: 'روزنامه'),
                    Tab(text: 'تراز آزمایشی'),
                    Tab(text: 'سود و زیان'),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Tab Content
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildLedgerTab(),
                    _buildJournalTab(),
                    _buildTrialBalanceTab(),
                    _buildProfitLossTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLedgerTab() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.print, size: 16),
                      label: const Text('چاپ'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      ),
                    ),
                    const SizedBox(width: 8),
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.download, size: 16),
                      label: const Text('خروجی اکسل'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Icon(Icons.description, size: 20),
                    SizedBox(width: 8),
                    Text(
                      'دفتر کل حساب‌ها',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Filter Section
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFEFF6FF),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFBFDBFE)),
            ),
            child: Column(
              children: [
                // Filter inputs
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text('تاریخ:', style: TextStyle(fontSize: 12)),
                          const SizedBox(height: 4),
                          TextField(
                            controller: TextEditingController(text: _dateFrom),
                            textAlign: TextAlign.right,
                            style: const TextStyle(fontSize: 12),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.all(8),
                              isDense: true,
                            ),
                            onChanged: (value) => _dateFrom = value,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text('شماره پرداخت:', style: TextStyle(fontSize: 12)),
                          const SizedBox(height: 4),
                          TextField(
                            controller: TextEditingController(text: _docNumber),
                            textAlign: TextAlign.right,
                            style: const TextStyle(fontSize: 12),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.all(8),
                              isDense: true,
                            ),
                            onChanged: (value) => _docNumber = value,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text('حد حساب:', style: TextStyle(fontSize: 12)),
                          const SizedBox(height: 4),
                          const TextField(
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 12),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.all(8),
                              isDense: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text('توضیحات:', style: TextStyle(fontSize: 12)),
                          const SizedBox(height: 4),
                          const TextField(
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 12),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.all(8),
                              isDense: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Radio buttons
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Radio<String>(value: 'all', groupValue: 'cash', onChanged: null),
                        Text('همه بانکی', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    SizedBox(width: 16),
                    Row(
                      children: [
                        Radio<String>(value: 'bank', groupValue: 'cash', onChanged: null),
                        Text('رسید بانکی', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    SizedBox(width: 16),
                    Row(
                      children: [
                        Radio<String>(value: 'cash', groupValue: 'cash', onChanged: null),
                        Text('نقدی', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Action buttons
                Wrap(
                  spacing: 8,
                  children: [
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.search, size: 16),
                      label: const Text('جستجو F3', style: TextStyle(fontSize: 11)),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        minimumSize: Size.zero,
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        minimumSize: Size.zero,
                      ),
                      child: const Text('فیلتر F6', style: TextStyle(fontSize: 11)),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        minimumSize: Size.zero,
                      ),
                      child: const Text('نمایش F2', style: TextStyle(fontSize: 11)),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        minimumSize: Size.zero,
                      ),
                      child: const Text('چاپ F4', style: TextStyle(fontSize: 11)),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        minimumSize: Size.zero,
                      ),
                      child: const Text('حذف F8', style: TextStyle(fontSize: 11)),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        minimumSize: Size.zero,
                      ),
                      child: const Text('خروج', style: TextStyle(fontSize: 11)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Data Table
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFE5E7EB)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DataTable(
                  headingRowColor: WidgetStateProperty.all(const Color(0xFF2563EB)),
                  headingTextStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  columns: const [
                    DataColumn(label: Text('ردیف')),
                    DataColumn(label: Text('کد حساب')),
                    DataColumn(label: Text('نام حساب')),
                    DataColumn(label: Text('بدهکار')),
                    DataColumn(label: Text('بستانکار')),
                    DataColumn(label: Text('مانده')),
                    DataColumn(label: Text('نوع')),
                    DataColumn(label: Text('عملیات')),
                  ],
                  rows: _accountData.asMap().entries.map((entry) {
                    int index = entry.key;
                    AccountData account = entry.value;
                    
                    return DataRow(
                      cells: [
                        DataCell(Text('${index + 1}')),
                        DataCell(Text(
                          account.code,
                          style: const TextStyle(fontFamily: 'monospace'),
                        )),
                        DataCell(
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                account.account,
                                style: const TextStyle(fontWeight: FontWeight.w500),
                              ),
                              Text(
                                account.accountEn,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        DataCell(Text(
                          account.debit > 0 ? _formatNumber(account.debit) : '-',
                          style: const TextStyle(fontFamily: 'monospace'),
                        )),
                        DataCell(Text(
                          account.credit > 0 ? _formatNumber(account.credit) : '-',
                          style: const TextStyle(fontFamily: 'monospace'),
                        )),
                        DataCell(Text(
                          _formatNumber(account.balance.abs()),
                          style: TextStyle(
                            fontFamily: 'monospace',
                            color: account.balance >= 0 ? Colors.green : Colors.red,
                          ),
                        )),
                        DataCell(
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: _getAccountTypeColor(account.type).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              _getAccountTypeName(account.type),
                              style: TextStyle(
                                fontSize: 12,
                                color: _getAccountTypeColor(account.type),
                              ),
                            ),
                          ),
                        ),
                        DataCell(
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.description, size: 16),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ),

          // Summary Footer
          Container(
            margin: const EdgeInsets.all(24),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'مجموع بدهکار',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '2,800,000',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'مجموع بستانکار',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '6,550,000',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'مانده کل',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '-3,750,000',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
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

  Widget _buildJournalTab() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(24),
            child: Text(
              'روزنامه حسابداری',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFE5E7EB)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DataTable(
                  headingRowColor: WidgetStateProperty.all(const Color(0xFFF9FAFB)),
                  columns: const [
                    DataColumn(label: Text('شماره سند')),
                    DataColumn(label: Text('تاریخ')),
                    DataColumn(label: Text('شرح')),
                    DataColumn(label: Text('بدهکار')),
                    DataColumn(label: Text('بستانکار')),
                    DataColumn(label: Text('مرجع')),
                  ],
                  rows: _transactionData.map((transaction) {
                    return DataRow(
                      cells: [
                        DataCell(Text(
                          transaction.docNo,
                          style: const TextStyle(fontFamily: 'monospace'),
                        )),
                        DataCell(Text(transaction.date)),
                        DataCell(
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(transaction.description),
                              Text(
                                transaction.descriptionEn,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        DataCell(Text(
                          transaction.debit > 0 ? _formatNumber(transaction.debit) : '-',
                          style: const TextStyle(fontFamily: 'monospace'),
                        )),
                        DataCell(Text(
                          transaction.credit > 0 ? _formatNumber(transaction.credit) : '-',
                          style: const TextStyle(fontFamily: 'monospace'),
                        )),
                        DataCell(Text(transaction.reference)),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrialBalanceTab() {
    return _buildComingSoon('تراز آزمایشی در حال آماده‌سازی است');
  }

  Widget _buildProfitLossTab() {
    return _buildComingSoon('گزارش سود و زیان در حال آماده‌سازی است');
  }

  Widget _buildComingSoon(String message) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.trending_up,
              size: 64,
              color: Colors.grey,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatNumber(double number) {
    return number.toInt().toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }

  Color _getAccountTypeColor(AccountType type) {
    switch (type) {
      case AccountType.asset:
        return const Color(0xFF2563EB);
      case AccountType.liability:
        return const Color(0xFFDC2626);
      case AccountType.equity:
        return const Color(0xFF6B7280);
    }
  }

  String _getAccountTypeName(AccountType type) {
    switch (type) {
      case AccountType.asset:
        return 'دارایی';
      case AccountType.liability:
        return 'بدهی';
      case AccountType.equity:
        return 'حقوق صاحبان';
    }
  }
}

class AccountData {
  final int id;
  final String code;
  final String account;
  final String accountEn;
  final double debit;
  final double credit;
  final double balance;
  final AccountType type;

  AccountData({
    required this.id,
    required this.code,
    required this.account,
    required this.accountEn,
    required this.debit,
    required this.credit,
    required this.balance,
    required this.type,
  });
}

class TransactionData {
  final int id;
  final String docNo;
  final String date;
  final String description;
  final String descriptionEn;
  final double debit;
  final double credit;
  final String reference;

  TransactionData({
    required this.id,
    required this.docNo,
    required this.date,
    required this.description,
    required this.descriptionEn,
    required this.debit,
    required this.credit,
    required this.reference,
  });
}

enum AccountType { asset, liability, equity }