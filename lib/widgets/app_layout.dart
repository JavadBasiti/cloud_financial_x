import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppLayout extends StatefulWidget {
  final Widget child;
  final String currentRoute;

  const AppLayout({
    super.key,
    required this.child,
    required this.currentRoute,
  });

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int get _currentIndex {
    switch (widget.currentRoute) {
      case '/dashboard':
        return 0;
      case '/wallet':
        return 1;
      case '/payment':
        return 2;
      case '/reports':
        return 3;
      case '/settings':
        return 4;
      default:
        return 0;
    }
  }

  void _onBottomNavTap(int index) {
    switch (index) {
      case 0:
        context.go('/dashboard');
        break;
      case 1:
        context.push('/wallet');
        break;
      case 2:
        context.push('/payment');
        break;
      case 3:
        context.push('/reports');
        break;
      case 4:
        context.push('/settings');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 900;

        return Scaffold(
          key: _scaffoldKey,
          drawer: isDesktop ? null : _buildDrawer(context),
          appBar: isDesktop ? null : _buildMobileAppBar(),
          body: Row(
            children: [
              if (isDesktop) _buildDesktopSidebar(context),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 70),
                  child: widget.child,
                ),
              ),
            ],
          ),
          bottomNavigationBar: _buildBottomNav(),
        );
      },
    );
  }

  AppBar _buildMobileAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFF7C3AED),
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.white),
        onPressed: () => _scaffoldKey.currentState?.openDrawer(),
      ),
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ابر مالی بازرگانی نوین اکس',
            style: TextStyle(color: Colors.white, fontSize: 13),
          ),
          Text(
            'Cloud Financial System',
            style: TextStyle(color: Color(0xFFE9D5FF), fontSize: 9),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopSidebar(BuildContext context) {
    final sidebarWidth = (MediaQuery.of(context).size.width * 0.22).clamp(240.0, 320.0) as double;
    return Container(
      width: sidebarWidth,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          left: BorderSide(color: Color(0xFFE5E7EB)),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 4,
            offset: Offset(-2, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xFF7C3AED), Color(0xFF3B82F6)],
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.cloud_upload,
                    color: Color(0xFF7C3AED),
                    size: 18,
                  ),
                ),
                const SizedBox(width: 8),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ابر مالی بازرگانی',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'خرد پرداز',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: _buildNavItems(context),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Color(0xFFE5E7EB)),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F3FF),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.shield_outlined,
                    color: Color(0xFF7C3AED),
                    size: 16,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'حساب امن ابری',
                          style: TextStyle(fontSize: 11),
                        ),
                        Text(
                          'Secure Cloud',
                          style: TextStyle(fontSize: 9, color: Color(0xFF6B7280)),
                        ),
                      ],
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

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xFF7C3AED), Color(0xFF3B82F6)],
              ),
            ),
            child: SafeArea(
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.cloud_upload,
                      color: Color(0xFF7C3AED),
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ابر مالی بازرگانی نوین اکس',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Cloud Financial System X',
                        style: TextStyle(
                          color: Color(0xFFE9D5FF),
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: _buildNavItems(context),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildNavItems(BuildContext context) {
    final items = [
      _NavItem(
        icon: Icons.home,
        title: 'داشبورد',
        titleEn: 'Dashboard',
        route: '/dashboard',
      ),
      _NavItem(
        icon: Icons.account_balance_wallet,
        title: 'کیف پول',
        titleEn: 'Wallet',
        route: '/wallet',
      ),
      _NavItem(
        icon: Icons.qr_code,
        title: 'پرداخت',
        titleEn: 'Payment',
        route: '/payment',
        isNew: true,
      ),
      _NavItem(
        icon: Icons.qr_code_scanner,
        title: 'دریافت',
        titleEn: 'Receive',
        route: '/receive',
        isNew: true,
      ),
      _NavItem(
        icon: Icons.bar_chart,
        title: 'گزارشات',
        titleEn: 'Reports',
        route: '/reports',
      ),
      _NavItem(
        icon: Icons.inventory_2_outlined,
        title: 'کالاها',
        titleEn: 'Products',
        route: '/products',
      ),
      _NavItem(
        icon: Icons.list_alt,
        title: 'لیست کالا',
        titleEn: 'Product List',
        route: '/product-list',
      ),
      _NavItem(
        icon: Icons.list_alt,
        title: 'فاکتور فروش',
        titleEn: 'Sale Invoice',
        route: '/SaleInvoice',
      ),
      _NavItem(
        icon: Icons.account_tree,
        title: 'ساختار حساب',
        titleEn: 'Account Structure',
        route: '/accounts',
      ),
      _NavItem(
        icon: Icons.people,
        title: 'مشتریان',
        titleEn: 'Customers',
        route: '/customers',
      ),
      _NavItem(
        icon: Icons.description,
        title: 'سند مرکب',
        titleEn: 'Compound Document',
        route: '/compound-document',
      ),
      _NavItem(
        icon: Icons.admin_panel_settings,
        title: 'تنظیمات پیشرفته',
        titleEn: 'Advanced Settings',
        route: '/advanced-settings',
      ),
      _NavItem(
        icon: Icons.settings_suggest,
        title: 'تعاریف سیستم',
        titleEn: 'System Definitions',
        route: '/system-definitions',
      ),
      _NavItem(
        icon: Icons.code,
        title: 'تنظیمات توسعه',
        titleEn: 'Development Settings',
        route: '/dev-settings',
      ),
      _NavItem(
        icon: Icons.settings,
        title: 'تنظیمات',
        titleEn: 'Settings',
        route: '/settings',
      ),
    ];

    return items.map((item) {
      final isSelected = widget.currentRoute == item.route;
      return Padding(
        padding: const EdgeInsets.only(bottom: 2),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              context.go(item.route);
              if (_scaffoldKey.currentState?.isDrawerOpen ?? false) {
                Navigator.pop(context);
              }
            },
            borderRadius: BorderRadius.circular(6),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF7C3AED) : Colors.transparent,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: [
                  Icon(
                    item.icon,
                    size: 18,
                    color: isSelected ? Colors.white : const Color(0xFF374151),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: TextStyle(
                            fontSize: 11,
                            color: isSelected ? Colors.white : const Color(0xFF374151),
                            height: 1.3,
                          ),
                        ),
                        Text(
                          item.titleEn,
                          style: TextStyle(
                            fontSize: 9,
                            color: isSelected
                                ? Colors.white.withOpacity(0.7)
                                : const Color(0xFF9CA3AF),
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (item.isNew)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color(0xFF10B981).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color(0xFF10B981).withOpacity(0.3),
                        ),
                      ),
                      child: const Text(
                        'جدید',
                        style: TextStyle(
                          fontSize: 9,
                          color: Color(0xFF10B981),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      );
    }).toList();
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Color(0xFFE5E7EB)),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildBottomNavItem(0, Icons.home, 'داشبورد'),
              _buildBottomNavItem(1, Icons.account_balance_wallet, 'کیف پول'),
              _buildBottomNavItem(2, Icons.qr_code, 'پرداخت'),
              _buildBottomNavItem(3, Icons.bar_chart, 'گزارشات'),
              _buildBottomNavItem(4, Icons.settings, 'تنظیمات'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavItem(int index, IconData icon, String label) {
    final isSelected = _currentIndex == index;
    return Expanded(
      child: InkWell(
        onTap: () => _onBottomNavTap(index),
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            gradient: isSelected
                ? const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Color(0xFF7C3AED), Color(0xFF3B82F6)],
                  )
                : null,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 20,
                color: isSelected ? Colors.white : const Color(0xFF6B7280),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  color: isSelected ? Colors.white : const Color(0xFF6B7280),
                  height: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final String title;
  final String titleEn;
  final String route;
  final bool isNew;

  _NavItem({
    required this.icon,
    required this.title,
    required this.titleEn,
    required this.route,
    this.isNew = false,
  });
}
