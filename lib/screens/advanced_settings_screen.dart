import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdvancedSettingsScreen extends StatefulWidget {
  const AdvancedSettingsScreen({super.key});

  @override
  State<AdvancedSettingsScreen> createState() => _AdvancedSettingsScreenState();
}

class _AdvancedSettingsScreenState extends State<AdvancedSettingsScreen> {
  bool enableAdvancedSecurity = true;
  bool enableAutoBackup = false;
  bool enableTwoFactorAuth = true;
  bool enableApiLogging = false;
  bool enableCloudSync = true;
  bool enableNotifications = true;
  bool enableDataEncryption = true;
  bool enableDebugMode = false;

  String selectedTheme = 'auto';
  String selectedLanguage = 'fa';
  String selectedCurrency = 'IRR';
  String backupFrequency = 'daily';
  String sessionTimeout = '30';

  final List<SettingSection> settingSections = [
    SettingSection(
      id: 'security',
      title: 'امنیت پیشرفته',
      titleEn: 'Advanced Security',
      icon: Icons.security_outlined,
      color: Colors.red,
    ),
    SettingSection(
      id: 'system',
      title: 'تنظیمات سیستم',
      titleEn: 'System Settings',
      icon: Icons.settings_outlined,
      color: Colors.blue,
    ),
    SettingSection(
      id: 'backup',
      title: 'پشتیبان‌گیری',
      titleEn: 'Backup & Sync',
      icon: Icons.cloud_upload_outlined,
      color: Colors.green,
    ),
    SettingSection(
      id: 'api',
      title: 'تنظیمات API',
      titleEn: 'API Configuration',
      icon: Icons.api_outlined,
      color: Colors.orange,
    ),
    SettingSection(
      id: 'developer',
      title: 'ابزار توسعه‌دهنده',
      titleEn: 'Developer Tools',
      icon: Icons.code_outlined,
      color: Colors.purple,
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
                  Icons.tune_outlined,
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
                      'تنظیمات پیشرفته',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Advanced System Settings',
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
            'تنظیمات پیشرفته سیستم و امنیت',
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
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildQuickActions(),
          const SizedBox(height: 16),
          _buildSettingSections(),
        ],
      ),
    );
  }

  Widget _buildQuickActions() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.flash_on_outlined, size: 16),
                SizedBox(width: 8),
                Text(
                  'دسترسی سریع',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildQuickActionButton(
                    'پشتیبان‌گیری فوری',
                    Icons.backup_outlined,
                    Colors.green,
                    () => _showBackupDialog(),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildQuickActionButton(
                    'بازنشانی تنظیمات',
                    Icons.refresh_outlined,
                    Colors.orange,
                    () => _showResetDialog(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: _buildQuickActionButton(
                    'صادرات گزارش',
                    Icons.file_download_outlined,
                    Colors.blue,
                    () => _exportSystemReport(),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildQuickActionButton(
                    'تست سیستم',
                    Icons.bug_report_outlined,
                    Colors.purple,
                    () => _runSystemTest(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionButton(String title, IconData icon, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: color,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingSections() {
    return Column(
      children: settingSections.map((section) => _buildSectionCard(section)).toList(),
    );
  }

  Widget _buildSectionCard(SettingSection section) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Card(
        child: ExpansionTile(
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: section.color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(section.icon, color: section.color, size: 20),
          ),
          title: Text(
            section.title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            section.titleEn,
            style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: _buildSectionContent(section.id),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionContent(String sectionId) {
    switch (sectionId) {
      case 'security':
        return _buildSecuritySettings();
      case 'system':
        return _buildSystemSettings();
      case 'backup':
        return _buildBackupSettings();
      case 'api':
        return _buildApiSettings();
      case 'developer':
        return _buildDeveloperSettings();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildSecuritySettings() {
    return Column(
      children: [
        _buildSwitchTile(
          'احراز هویت دو مرحله‌ای',
          'Two-Factor Authentication',
          enableTwoFactorAuth,
          (value) => setState(() => enableTwoFactorAuth = value),
        ),
        _buildSwitchTile(
          'رمزگذاری پیشرفته داده‌ها',
          'Advanced Data Encryption',
          enableDataEncryption,
          (value) => setState(() => enableDataEncryption = value),
        ),
        _buildSwitchTile(
          'امنیت پیشرفته',
          'Enhanced Security Mode',
          enableAdvancedSecurity,
          (value) => setState(() => enableAdvancedSecurity = value),
        ),
        _buildDropdownTile(
          'مهلت نشست',
          'Session Timeout',
          sessionTimeout,
          ['15', '30', '60', '120'],
          (value) => setState(() => sessionTimeout = value!),
          suffix: 'دقیقه',
        ),
      ],
    );
  }

  Widget _buildSystemSettings() {
    return Column(
      children: [
        _buildDropdownTile(
          'تم رابط کاربری',
          'UI Theme',
          selectedTheme,
          ['light', 'dark', 'auto'],
          (value) => setState(() => selectedTheme = value!),
          displayNames: {'light': 'روشن', 'dark': 'تیره', 'auto': 'خودکار'},
        ),
        _buildDropdownTile(
          'زبان سیستم',
          'System Language',
          selectedLanguage,
          ['fa', 'en', 'ar'],
          (value) => setState(() => selectedLanguage = value!),
          displayNames: {'fa': 'فارسی', 'en': 'English', 'ar': 'العربية'},
        ),
        _buildDropdownTile(
          'ارز پیش‌فرض',
          'Default Currency',
          selectedCurrency,
          ['IRR', 'USD', 'EUR'],
          (value) => setState(() => selectedCurrency = value!),
        ),
        _buildSwitchTile(
          'اعلان‌های سیستم',
          'System Notifications',
          enableNotifications,
          (value) => setState(() => enableNotifications = value),
        ),
      ],
    );
  }

  Widget _buildBackupSettings() {
    return Column(
      children: [
        _buildSwitchTile(
          'پشتیبان‌گیری خودکار',
          'Automatic Backup',
          enableAutoBackup,
          (value) => setState(() => enableAutoBackup = value),
        ),
        _buildSwitchTile(
          'همگام‌سازی ابری',
          'Cloud Synchronization',
          enableCloudSync,
          (value) => setState(() => enableCloudSync = value),
        ),
        _buildDropdownTile(
          'تکرار پشتیبان‌گیری',
          'Backup Frequency',
          backupFrequency,
          ['hourly', 'daily', 'weekly', 'monthly'],
          (value) => setState(() => backupFrequency = value!),
          displayNames: {
            'hourly': 'ساعتی',
            'daily': 'روزانه',
            'weekly': 'هفتگی',
            'monthly': 'ماهانه',
          },
        ),
      ],
    );
  }

  Widget _buildApiSettings() {
    return Column(
      children: [
        _buildSwitchTile(
          'لاگ‌گیری API',
          'API Logging',
          enableApiLogging,
          (value) => setState(() => enableApiLogging = value),
        ),
        _buildInfoTile('نسخه API', 'API Version', 'v2.1.0'),
        _buildInfoTile('آدرس سرور', 'Server URL', 'https://api.cloud-x.ir'),
        _buildInfoTile('کلید API', 'API Key', '****-****-****-ab12'),
        const SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _regenerateApiKey,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange.shade600,
              padding: const EdgeInsets.symmetric(vertical: 8),
            ),
            child: const Text(
              'تولید مجدد کلید API',
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDeveloperSettings() {
    return Column(
      children: [
        _buildSwitchTile(
          'حالت توسعه‌دهنده',
          'Developer Mode',
          enableDebugMode,
          (value) => setState(() => enableDebugMode = value),
        ),
        _buildInfoTile('نسخه برنامه', 'App Version', '1.0.0'),
        _buildInfoTile('نسخه Flutter', 'Flutter Version', '3.24.0'),
        _buildInfoTile('شناسه ساخت', 'Build ID', 'a1b2c3d4'),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: _clearCache,
                child: const Text('پاکسازی کش', style: TextStyle(fontSize: 11)),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: OutlinedButton(
                onPressed: _viewLogs,
                child: const Text('مشاهده لاگ‌ها', style: TextStyle(fontSize: 11)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSwitchTile(String title, String subtitle, bool value, ValueChanged<bool> onChanged) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: Colors.green.shade600,
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownTile(
    String title,
    String subtitle,
    String value,
    List<String> options,
    ValueChanged<String?> onChanged, {
    Map<String, String>? displayNames,
    String? suffix,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          DropdownButton<String>(
            value: value,
            onChanged: onChanged,
            underline: const SizedBox.shrink(),
            style: const TextStyle(fontSize: 11, color: Colors.black),
            items: options.map((option) {
              final displayText = displayNames?[option] ?? option;
              final finalText = suffix != null ? '$displayText $suffix' : displayText;
              return DropdownMenuItem(
                value: option,
                child: Text(finalText),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTile(String title, String subtitle, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 11, fontFamily: 'monospace'),
          ),
        ],
      ),
    );
  }

  void _showBackupDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('پشتیبان‌گیری فوری'),
        content: const Text('آیا مایل به ایجاد پشتیبان فوری از سیستم هستید؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('انصراف'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              _performBackup();
            },
            child: const Text('شروع پشتیبان‌گیری'),
          ),
        ],
      ),
    );
  }

  void _showResetDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('بازنشانی تنظیمات'),
        content: const Text('تمام تنظیمات به حالت پیش‌فرض بازگردانده می‌شود. آیا مطمئن هستید؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('انصراف'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              _resetSettings();
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('بازنشانی', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _performBackup() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('پشتیبان‌گیری با موفقیت آغاز شد'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _resetSettings() {
    setState(() {
      enableAdvancedSecurity = true;
      enableAutoBackup = false;
      enableTwoFactorAuth = true;
      enableApiLogging = false;
      enableCloudSync = true;
      enableNotifications = true;
      enableDataEncryption = true;
      enableDebugMode = false;
      selectedTheme = 'auto';
      selectedLanguage = 'fa';
      selectedCurrency = 'IRR';
      backupFrequency = 'daily';
      sessionTimeout = '30';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('تنظیمات با موفقیت بازنشانی شد'),
        backgroundColor: Colors.orange,
      ),
    );
  }

  void _exportSystemReport() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('گزارش سیستم در حال آماده‌سازی...'),
        backgroundColor: Colors.blue,
      ),
    );
  }

  void _runSystemTest() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('تست سیستم آغاز شد'),
        backgroundColor: Colors.purple,
      ),
    );
  }

  void _regenerateApiKey() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('کلید API جدید تولید شد'),
        backgroundColor: Colors.orange,
      ),
    );
  }

  void _clearCache() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('کش سیستم پاکسازی شد'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _viewLogs() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('بازکردن نمایشگر لاگ‌ها...'),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

class SettingSection {
  final String id;
  final String title;
  final String titleEn;
  final IconData icon;
  final Color color;

  SettingSection({
    required this.id,
    required this.title,
    required this.titleEn,
    required this.icon,
    required this.color,
  });
}