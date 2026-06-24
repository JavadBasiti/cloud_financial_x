import 'package:flutter/material.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> with TickerProviderStateMixin {
  bool _isAuthenticated = false;
  bool _showBalance = false;
  String _currentPassword = '';
  late TabController _tabController;

  final List<WalletItem> _wallets = [
    WalletItem(
      id: 1,
      name: 'کیف پول اصلی',
      nameEn: 'Main Wallet',
      balance: 2500000,
      currency: 'تومان',
      type: WalletType.primary,
    ),
    WalletItem(
      id: 2,
      name: 'کیف پول دلاری',
      nameEn: 'USD Wallet',
      balance: 1250,
      currency: 'USD',
      type: WalletType.foreign,
    ),
    WalletItem(
      id: 3,
      name: 'کیف پول یورو',
      nameEn: 'EUR Wallet',
      balance: 890,
      currency: 'EUR',
      type: WalletType.foreign,
    ),
    WalletItem(
      id: 4,
      name: 'کیف پول کسب‌وکار',
      nameEn: 'Business Wallet',
      balance: 5750000,
      currency: 'تومان',
      type: WalletType.business,
    ),
  ];

  final List<TransactionItem> _transactions = [
    TransactionItem(
      id: 1,
      type: TransactionType.income,
      amount: 500000,
      description: 'واریز حقوق',
      descriptionEn: 'Salary Deposit',
      date: '1404/03/22',
    ),
    TransactionItem(
      id: 2,
      type: TransactionType.expense,
      amount: 125000,
      description: 'خرید آنلاین',
      descriptionEn: 'Online Purchase',
      date: '1404/03/21',
    ),
    TransactionItem(
      id: 3,
      type: TransactionType.income,
      amount: 750000,
      description: 'فروش محصول',
      descriptionEn: 'Product Sale',
      date: '1404/03/20',
    ),
    TransactionItem(
      id: 4,
      type: TransactionType.expense,
      amount: 250000,
      description: 'پرداخت قبض',
      descriptionEn: 'Bill Payment',
      date: '1404/03/19',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleAuthentication() {
    if (_currentPassword == 'demo123') {
      setState(() {
        _isAuthenticated = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isAuthenticated) {
      return _buildAuthenticationScreen();
    }

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF7C3AED), Color(0xFF2563EB)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const Text(
                    'مدیریت کیف پول',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Wallet Management System',
                    style: TextStyle(
                      color: Color(0xFFE0E7FF),
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  // Tab Bar
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TabBar(
                      controller: _tabController,
                      indicator: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelColor: const Color(0xFF7C3AED),
                      unselectedLabelColor: Colors.white,
                      dividerColor: Colors.transparent,
                      tabs: const [
                        Tab(text: 'کیف پول‌ها'),
                        Tab(text: 'تراکنش‌ها'),
                        Tab(text: 'انتقال وجه'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            // Tab Content
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildWalletsTab(),
                  _buildTransactionsTab(),
                  _buildTransferTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAuthenticationScreen() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF7C3AED), Color(0xFF2563EB)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF7C3AED).withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.security,
                      color: Color(0xFF7C3AED),
                      size: 32,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Column(
                    children: [
                      Text(
                        'احراز هویت امن',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Secure Authentication',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'رمز عبور کیف پول',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        obscureText: true,
                        textAlign: TextAlign.right,
                        decoration: const InputDecoration(
                          hintText: 'رمز عبور خود را وارد کنید',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(16),
                        ),
                        onChanged: (value) {
                          _currentPassword = value;
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _handleAuthentication,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7C3AED),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'ورود به کیف پول',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Demo password: demo123',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWalletsTab() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).size.width > 768 ? 2 : 1,
          childAspectRatio: 1.5,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: _wallets.length,
        itemBuilder: (context, index) {
          return _buildWalletCard(_wallets[index]);
        },
      ),
    );
  }

  Widget _buildWalletCard(WalletItem wallet) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF7C3AED).withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    _getWalletIcon(wallet.type),
                    color: _getWalletColor(wallet.type),
                    size: 24,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        wallet.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        wallet.nameEn,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            
            // Balance
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _showBalance = !_showBalance;
                    });
                  },
                  icon: Icon(
                    _showBalance ? Icons.visibility_off : Icons.visibility,
                    size: 20,
                  ),
                ),
                Expanded(
                  child: Text(
                    _showBalance
                        ? '${wallet.balance.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')} ${wallet.currency}'
                        : '••••••••',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            
            // Actions
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.send, size: 16),
                    label: const Text('ارسال'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.download, size: 16),
                    label: const Text('دریافت'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // Badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: _getWalletColor(wallet.type).withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                _getWalletTypeName(wallet.type),
                style: TextStyle(
                  fontSize: 12,
                  color: _getWalletColor(wallet.type),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionsTab() {
    return Container(
      margin: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(24),
            child: Text(
              'تاریخچه تراکنش‌ها',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemCount: _transactions.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return _buildTransactionItem(_transactions[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionItem(TransactionItem transaction) {
    final bool isIncome = transaction.type == TransactionType.income;
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isIncome 
                  ? Colors.green.withOpacity(0.1) 
                  : Colors.red.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              isIncome ? Icons.trending_up : Icons.trending_down,
              color: isIncome ? Colors.green : Colors.red,
              size: 16,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.description,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${isIncome ? '+' : '-'}${transaction.amount.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')} تومان',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isIncome ? Colors.green : Colors.red,
                ),
              ),
              Text(
                transaction.date,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTransferTab() {
    return Container(
      margin: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              'انتقال وجه',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            
            // Form fields
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text('کیف پول مبدا'),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(16),
                        ),
                        items: const [
                          DropdownMenuItem(value: '1', child: Text('کیف پول اصلی')),
                          DropdownMenuItem(value: '2', child: Text('کیف پول تجاری')),
                        ],
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text('کیف پول مقصد'),
                      const SizedBox(height: 8),
                      const TextField(
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          hintText: 'شماره کیف پول مقصد',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(16),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text('مبلغ انتقال'),
                const SizedBox(height: 8),
                const TextField(
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: '0',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text('توضیحات'),
                const SizedBox(height: 8),
                const TextField(
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: 'توضیحات انتقال (اختیاری)',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text('رمز عبور تایید'),
                const SizedBox(height: 8),
                const TextField(
                  obscureText: true,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: 'رمز عبور خود را وارد کنید',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.send),
                label: const Text('انجام انتقال'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7C3AED),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getWalletIcon(WalletType type) {
    switch (type) {
      case WalletType.primary:
        return Icons.account_balance_wallet;
      case WalletType.foreign:
        return Icons.currency_exchange;
      case WalletType.business:
        return Icons.business;
    }
  }

  Color _getWalletColor(WalletType type) {
    switch (type) {
      case WalletType.primary:
        return const Color(0xFF7C3AED);
      case WalletType.foreign:
        return const Color(0xFF2563EB);
      case WalletType.business:
        return const Color(0xFF059669);
    }
  }

  String _getWalletTypeName(WalletType type) {
    switch (type) {
      case WalletType.primary:
        return 'اصلی';
      case WalletType.foreign:
        return 'ارز خارجی';
      case WalletType.business:
        return 'تجاری';
    }
  }
}

class WalletItem {
  final int id;
  final String name;
  final String nameEn;
  final double balance;
  final String currency;
  final WalletType type;

  WalletItem({
    required this.id,
    required this.name,
    required this.nameEn,
    required this.balance,
    required this.currency,
    required this.type,
  });
}

class TransactionItem {
  final int id;
  final TransactionType type;
  final double amount;
  final String description;
  final String descriptionEn;
  final String date;

  TransactionItem({
    required this.id,
    required this.type,
    required this.amount,
    required this.description,
    required this.descriptionEn,
    required this.date,
  });
}

enum WalletType { primary, foreign, business }
enum TransactionType { income, expense }