import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(),
        Expanded(
          child: Container(
            color: const Color(0xFFF9FAFB),
            child: ListView(
              padding: const EdgeInsets.all(12),
              children: [
                _buildSection('عمومی', [
                  _buildSettingItem(Icons.language, 'زبان', 'Language', 'فارسی'),
                  _buildSettingItem(Icons.palette, 'تم', 'Theme', 'روشن'),
                  _buildSettingItem(Icons.notifications, 'اعلان‌ها', 'Notifications', 'فعال'),
                ]),
                const SizedBox(height: 12),
                _buildSection('امنیت', [
                  _buildSettingItem(Icons.lock, 'تغییر رمز', 'Change Password', ''),
                  _buildSettingItem(Icons.fingerprint, 'احراز هویت', 'Authentication', 'فعال'),
                  _buildSettingItem(Icons.security, 'امنیت ابری', 'Cloud Security', 'فعال'),
                ]),
                const SizedBox(height: 12),
                _buildSection('حساب', [
                  _buildSettingItem(Icons.person, 'پروفایل', 'Profile', ''),
                  _buildSettingItem(Icons.sync, 'همگام‌سازی', 'Sync', 'خودکار'),
                  _buildSettingItem(Icons.backup, 'پشتیبان‌گیری', 'Backup', 'ابری'),
                ]),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFF7C3AED), Color(0xFF3B82F6)],
        ),
      ),
      child: SafeArea(
        child: Column(
          children: const [
            Text('تنظیمات', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
            SizedBox(height: 2),
            Text('Settings', style: TextStyle(fontSize: 10, color: Color(0xFFE9D5FF))),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> items) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              title,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF7C3AED)),
            ),
          ),
          const Divider(height: 1),
          ...items,
        ],
      ),
    );
  }

  Widget _buildSettingItem(IconData icon, String title, String subtitle, String value) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Icon(icon, size: 18, color: const Color(0xFF7C3AED)),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                  Text(subtitle, style: const TextStyle(fontSize: 10, color: Color(0xFF6B7280))),
                ],
              ),
            ),
            if (value.isNotEmpty)
              Text(value, style: const TextStyle(fontSize: 11, color: Color(0xFF6B7280))),
            const SizedBox(width: 4),
            const Icon(Icons.chevron_right, size: 18, color: Color(0xFF9CA3AF)),
          ],
        ),
      ),
    );
  }
}
