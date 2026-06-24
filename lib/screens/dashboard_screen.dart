import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/app_layout.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // return AppLayout(
    //     currentRoute: '/dashboard',
    //     child: Container(
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFF7C3AED), Color(0xFF6366F1), Color(0xFF3B82F6)],
        ),
      ),
      child: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isDesktop = constraints.maxWidth > 900;
            final isTablet = constraints.maxWidth > 600 && constraints.maxWidth <= 900;
            
            return SingleChildScrollView(
              padding: EdgeInsets.all(isDesktop ? 20 : 12),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: Column(
                    children: [
                      _buildHeader(context, isDesktop),
                      SizedBox(height: isDesktop ? 20 : 16),
                      _buildAiDashboard(context, isDesktop, isTablet),
                      // _buildDashboardContent(context, isDesktop, isTablet),
                      _buildCloudStatus(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    // ),
    );
  }

  Widget _buildAiDashboard(
      BuildContext context,
      bool isDesktop,
      bool isTablet,
      ){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: EdgeInsets.all(isDesktop ? 20 : 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
            Row(
              children: [
                _buildAiSection(context,
                  ModuleItem(title: 'ورودی صوتی',titleEn: 'گفتگو با دستیار',
                      icon: Icons.call_received,gradient:const LinearGradient(
                        colors: [Color(0xFF3B82F6), Color(0xFF2563EB)],
                      ),
                      badgeColor: Colors.white54 )
                  ,isDesktop,isTablet,),
                const SizedBox(width: 20),
                _buildAiSection(context,
                  ModuleItem(title: 'دریافت تصویر',titleEn: 'فاکتور یا قبض',
                      icon: Icons.add_a_photo,gradient:const LinearGradient(
                        colors: [Color(0xFF3B82F6), Color(0xFF2563EB)],
                      ),
                      badgeColor: Colors.white54 )
                  ,isDesktop,isTablet,),
                const SizedBox(width: 20),
                _buildAiSection(context,
                  ModuleItem(title: 'پیامک بانکی',titleEn: 'Sms',
                      icon: Icons.add_call,gradient:const LinearGradient(
                        colors: [Color(0xFF3B82F6), Color(0xFF2563EB)],
                      ),
                      badgeColor: Colors.white54 )
                  ,isDesktop,isTablet,),
              ],
            ),
          Container(
            padding: EdgeInsets.all(isDesktop ? 20 : 14),
            // child: ,
          ),
        ]),
    );
  }

Widget _buildAiSection(
    BuildContext context,
    ModuleItem module,
    bool isDesktop,
    bool isTablet,
    ){
    return _buildModuleCard( context,module);

}
  Widget _buildHeader(BuildContext context, bool isDesktop) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.cloud_upload,
                color: Color(0xFF7C3AED),
                size: 24,
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'دستیار هوشمند مالی',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isDesktop ? 18 : 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Text(
                  'ثبت خودکار اسناد حسابداری با هوش مصنوعی',
                  style: TextStyle(
                    color: Color(0xFFE9D5FF),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        // const Text(
        //   'سیستم خردمند مالی وابری',
        //   style: TextStyle(
        //     color: Color(0xFFE9D5FF),
        //     fontSize: 11,
        //   ),
        //   textAlign: TextAlign.center,
        // ),
      ],
    );
  }

  Widget _buildDashboardContent(BuildContext context, bool isDesktop, bool isTablet) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: EdgeInsets.all(isDesktop ? 20 : 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildSection(context,'خرید و فروش','Buy & Sell',_getBuyAndSellModules(context),isDesktop,isTablet,),
          const SizedBox(height: 20),
          _buildSection(context,'مبادلات مالی','Financial Exchanges',_getExchangeModules(context),isDesktop,isTablet,),         const SizedBox(height: 20),
          _buildSection(context,'اسناد حسابداری','Accounting Documents',_getAccountingModules(context),isDesktop,isTablet,),
          const SizedBox(height: 20),
          _buildSection(context,'تنظیمات و مالی ابری','Cloud Settings & Finance',_getSettingsModules(context),isDesktop,isTablet,),
          const SizedBox(height: 14),
          _buildCloudStatus(),
        ],
      ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    String title,
    String titleEn,
    List<ModuleItem> modules,
    bool isDesktop,
    bool isTablet,
  ) {
    int crossAxisCount = 2; // Default for mobile 2
    if (isDesktop) {
      crossAxisCount = 8;//default 4
    } else if (isTablet) {
      crossAxisCount = 4;//default 3
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Color(0xFF1F2937),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      titleEn,
                      style: const TextStyle(
                        color: Color(0xFF6B7280),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.05,
          ),
          itemCount: modules.length,
          itemBuilder: (context, index) {
            return _buildModuleCard(context, modules[index]);
          },
        ),
      ],
    );
  }

  Widget _buildModuleCard(BuildContext context, ModuleItem module) {
    return InkWell(
      onTap: module.onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFFF3F4F6)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 4,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: module.gradient,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: module.gradient.colors.first.withOpacity(0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                module.icon,
                color: Colors.white,
                size: 24,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              module.title,
              style: const TextStyle(
                color: Color(0xFF374151),
                fontSize: 11,
                height: 1.3,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            Text(
              module.titleEn,
              style: const TextStyle(
                color: Color(0xFF9CA3AF),
                fontSize: 9,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            if (module.isNew) ...[
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: module.badgeColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: module.badgeColor.withOpacity(0.3)),
                ),
                child: Text(
                  'جدید',
                  style: TextStyle(
                    color: module.badgeColor,
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildCloudStatus() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFFF5F3FF), Color(0xFFEBF5FF)],
        ),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE9D5FF)),
      ),
      child: const Column(
        children: [
          Text(
            'پروفایل و تنظیمات ابری',
            style: TextStyle(
              color: Color(0xFF6B21A8),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 2),
          Text(
            'Cloud Profile & Settings',
            style: TextStyle(
              color: Color(0xFF7C3AED),
              fontSize: 10,
            ),
          ),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle,
                color: Color(0xFF16A34A),
                size: 14,
              ),
              SizedBox(width: 4),
              Text(
                'متصل به ابر',
                style: TextStyle(
                  color: Color(0xFF16A34A),
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<ModuleItem> _getBuyAndSellModules(BuildContext context) {
    return [
      ModuleItem(
        title: 'فاکتور فروش',
        titleEn: 'Sales Invoice',
        icon: Icons.receipt_long,
        gradient: const LinearGradient(
          colors: [Color(0xFF3B82F6), Color(0xFF2563EB)],
        ),
        badgeColor: const Color(0xFF3B82F6),
        onTap: () {},
      ),
      ModuleItem(
        title: 'برگشت قبوض',
        titleEn: 'Returns',
        icon: Icons.refresh,
        gradient: const LinearGradient(
          colors: [Color(0xFF8B5CF6), Color(0xFF7C3AED)],
        ),
        badgeColor: const Color(0xFF8B5CF6),
        onTap: () {},
      ),
      ModuleItem(
        title: 'اسناد مرکب',
        titleEn: 'Documents',
        icon: Icons.description,
        gradient: const LinearGradient(
          colors: [Color(0xFF7C3AED), Color(0xFF6D28D9)],
        ),
        badgeColor: const Color(0xFF7C3AED),
        onTap: () {},
      ),
      ModuleItem(
        title: 'گزارش',
        titleEn: 'Reports',
        icon: Icons.bar_chart,
        gradient: const LinearGradient(
          colors: [Color(0xFF6D28D9), Color(0xFF5B21B6)],
        ),
        badgeColor: const Color(0xFF6D28D9),
        onTap: () {},
      ),
    ];
  }

  List<ModuleItem> _getExchangeModules(BuildContext context) {
    return [
      ModuleItem(
        title: 'دریافت QR',
        titleEn: 'QR Receive',
        icon: Icons.qr_code_scanner,
        gradient: const LinearGradient(
          colors: [Color(0xFF16A34A), Color(0xFF15803D)],
        ),
        badgeColor: const Color(0xFF16A34A),
        isNew: true,
        onTap: () => context.go('/receive'),
      ),
      ModuleItem(
        title: 'پرداخت QR',
        titleEn: 'QR Payment',
        icon: Icons.qr_code,
        gradient: const LinearGradient(
          colors: [Color(0xFF4F46E5), Color(0xFF4338CA)],
        ),
        badgeColor: const Color(0xFF4F46E5),
        isNew: true,
        onTap: () => context.go('/payment'),
      ),
      ModuleItem(
        title: 'حواله',
        titleEn: 'Transfer',
        icon: Icons.swap_vert,
        gradient: const LinearGradient(
          colors: [Color(0xFF7C3AED), Color(0xFF6D28D9)],
        ),
        badgeColor: const Color(0xFF7C3AED),
        onTap: () {},
      ),
      ModuleItem(
        title: 'اسناد مرکب',
        titleEn: 'Documents',
        icon: Icons.description,
        gradient: const LinearGradient(
          colors: [Color(0xFF8B5CF6), Color(0xFF7C3AED)],
        ),
        badgeColor: const Color(0xFF8B5CF6),
        onTap: () {},
      ),
    ];
  }

  List<ModuleItem> _getAccountingModules(BuildContext context) {
    return [
      ModuleItem(
        title: 'اسناد دستی',
        titleEn: 'Manual Docs',
        icon: Icons.edit_document,
        gradient: const LinearGradient(
          colors: [Color(0xFF8B5CF6), Color(0xFF7C3AED)],
        ),
        badgeColor: const Color(0xFF8B5CF6),
        onTap: () {},
      ),
      ModuleItem(
        title: 'سند مرکب',
        titleEn: 'Complex Doc',
        icon: Icons.description,
        gradient: const LinearGradient(
          colors: [Color(0xFF7C3AED), Color(0xFF6D28D9)],
        ),
        badgeColor: const Color(0xFF7C3AED),
        onTap: () {},
      ),
      ModuleItem(
        title: 'گزارش اسناد',
        titleEn: 'Doc Reports',
        icon: Icons.analytics,
        gradient: const LinearGradient(
          colors: [Color(0xFF8B5CF6), Color(0xFF6366F1)],
        ),
        badgeColor: const Color(0xFF8B5CF6),
        onTap: () {},
      ),
      ModuleItem(
        title: 'برنامه',
        titleEn: 'Program',
        icon: Icons.settings,
        gradient: const LinearGradient(
          colors: [Color(0xFF6D28D9), Color(0xFF5B21B6)],
        ),
        badgeColor: const Color(0xFF6D28D9),
        onTap: () {},
      ),
    ];
  }

  List<ModuleItem> _getSettingsModules(BuildContext context) {
    return [
      ModuleItem(
        title: 'دفترکل',
        titleEn: 'General Ledger',
        icon: Icons.book,
        gradient: const LinearGradient(
          colors: [Color(0xFF8B5CF6), Color(0xFF7C3AED)],
        ),
        badgeColor: const Color(0xFF8B5CF6),
        onTap: () {},
      ),
      ModuleItem(
        title: 'دفترمعین',
        titleEn: 'Subsidiary',
        icon: Icons.account_balance,
        gradient: const LinearGradient(
          colors: [Color(0xFF7C3AED), Color(0xFF6D28D9)],
        ),
        badgeColor: const Color(0xFF7C3AED),
        onTap: () {},
      ),
      ModuleItem(
        title: 'پشتیبان‌گیری ابری',
        titleEn: 'Cloud Backup',
        icon: Icons.cloud_download,
        gradient: const LinearGradient(
          colors: [Color(0xFF8B5CF6), Color(0xFF6366F1)],
        ),
        badgeColor: const Color(0xFF8B5CF6),
        onTap: () {},
      ),
      ModuleItem(
        title: 'کاربر',
        titleEn: 'User',
        icon: Icons.person,
        gradient: const LinearGradient(
          colors: [Color(0xFF6D28D9), Color(0xFF5B21B6)],
        ),
        badgeColor: const Color(0xFF6D28D9),
        onTap: () {},
      ),
    ];
  }
}

class ModuleItem {
  final String title;
  final String titleEn;
  final IconData icon;
  final LinearGradient gradient;
  final Color badgeColor;
  final bool isNew;
  final VoidCallback? onTap;

  ModuleItem({
    required this.title,
    required this.titleEn,
    required this.icon,
    required this.gradient,
    required this.badgeColor,
    this.isNew = false,
    this.onTap,
  });
}