import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DevelopmentSettingsScreen extends StatefulWidget {
  const DevelopmentSettingsScreen({super.key});

  @override
  State<DevelopmentSettingsScreen> createState() => _DevelopmentSettingsScreenState();
}

class _DevelopmentSettingsScreenState extends State<DevelopmentSettingsScreen> {
  bool enableDebugMode = true;
  bool enableDeviceLogging = false;
  bool enableNetworkLogging = true;
  bool enablePerformanceMonitoring = false;
  bool enableCrashReporting = true;
  bool enableHotReload = true;
  bool showFpsOverlay = false;
  bool enableInspector = false;

  String selectedLogLevel = 'debug';
  String selectedApiEndpoint = 'development';
  String selectedBuildMode = 'debug';

  final List<LogEntry> logs = [
    LogEntry(
      timestamp: '2024-03-22 14:30:15',
      level: 'INFO',
      message: 'Application started successfully',
      category: 'System',
    ),
    LogEntry(
      timestamp: '2024-03-22 14:30:20',
      level: 'DEBUG',
      message: 'API request: GET /api/dashboard',
      category: 'Network',
    ),
    LogEntry(
      timestamp: '2024-03-22 14:30:21',
      level: 'DEBUG',
      message: 'Response received: 200 OK',
      category: 'Network',
    ),
    LogEntry(
      timestamp: '2024-03-22 14:30:25',
      level: 'WARNING',
      message: 'Cache miss for user preferences',
      category: 'Cache',
    ),
    LogEntry(
      timestamp: '2024-03-22 14:30:30',
      level: 'ERROR',
      message: 'Failed to load user avatar',
      category: 'UI',
    ),
  ];

  final List<DevTool> devTools = [
    DevTool(
      id: 'inspector',
      title: 'بازرس رابط کاربری',
      titleEn: 'UI Inspector',
      description: 'بررسی و تحلیل رابط کاربری',
      icon: Icons.search_outlined,
      color: Colors.blue,
    ),
    DevTool(
      id: 'profiler',
      title: 'مانیتور عملکرد',
      titleEn: 'Performance Profiler',
      description: 'نظارت بر عملکرد اپلیکیشن',
      icon: Icons.speed_outlined,
      color: Colors.green,
    ),
    DevTool(
      id: 'network',
      title: 'مانیتور شبکه',
      titleEn: 'Network Monitor',
      description: 'نظارت بر ترافیک شبکه',
      icon: Icons.wifi_outlined,
      color: Colors.orange,
    ),
    DevTool(
      id: 'database',
      title: 'مدیر پایگاه داده',
      titleEn: 'Database Manager',
      description: 'مدیریت داده‌های محلی',
      icon: Icons.storage_outlined,
      color: Colors.purple,
    ),
    DevTool(
      id: 'api',
      title: 'تست API',
      titleEn: 'API Tester',
      description: 'تست و بررسی API ها',
      icon: Icons.api_outlined,
      color: Colors.red,
    ),
    DevTool(
      id: 'logs',
      title: 'مشاهده لاگ‌ها',
      titleEn: 'Log Viewer',
      description: 'مشاهده لاگ‌های سیستم',
      icon: Icons.list_alt_outlined,
      color: Colors.teal,
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
                  Icons.developer_mode_outlined,
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
                      'تنظیمات توسعه‌دهنده',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Developer Settings',
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
            'ابزارها و تنظیمات توسعه‌دهندگان',
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
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          _buildTabBar(),
          Expanded(
            child: TabBarView(
              children: [
                _buildSettingsTab(),
                _buildToolsTab(),
                _buildLogsTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const TabBar(
          indicator: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          labelColor: Colors.purple,
          unselectedLabelColor: Colors.grey,
          labelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          unselectedLabelStyle: TextStyle(fontSize: 12),
          tabs: [
            Tab(text: 'تنظیمات'),
            Tab(text: 'ابزارها'),
            Tab(text: 'لاگ‌ها'),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildDebugSettings(),
          const SizedBox(height: 16),
          _buildLoggingSettings(),
          const SizedBox(height: 16),
          _buildEnvironmentSettings(),
        ],
      ),
    );
  }

  Widget _buildDebugSettings() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.bug_report_outlined, size: 16),
                SizedBox(width: 8),
                Text(
                  'تنظیمات دیباگ',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildSwitchTile(
              'حالت دیباگ',
              'Debug Mode',
              enableDebugMode,
              (value) => setState(() => enableDebugMode = value),
            ),
            _buildSwitchTile(
              'بازگشت سریع (Hot Reload)',
              'Hot Reload',
              enableHotReload,
              (value) => setState(() => enableHotReload = value),
            ),
            _buildSwitchTile(
              'نمایش FPS',
              'Show FPS Overlay',
              showFpsOverlay,
              (value) => setState(() => showFpsOverlay = value),
            ),
            _buildSwitchTile(
              'بازرس رابط کاربری',
              'Widget Inspector',
              enableInspector,
              (value) => setState(() => enableInspector = value),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoggingSettings() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.list_alt_outlined, size: 16),
                SizedBox(width: 8),
                Text(
                  'تنظیمات لاگ‌گیری',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildSwitchTile(
              'لاگ‌گیری دستگاه',
              'Device Logging',
              enableDeviceLogging,
              (value) => setState(() => enableDeviceLogging = value),
            ),
            _buildSwitchTile(
              'لاگ‌گیری شبکه',
              'Network Logging',
              enableNetworkLogging,
              (value) => setState(() => enableNetworkLogging = value),
            ),
            _buildSwitchTile(
              'گزارش خرابی',
              'Crash Reporting',
              enableCrashReporting,
              (value) => setState(() => enableCrashReporting = value),
            ),
            _buildDropdownTile(
              'سطح لاگ',
              'Log Level',
              selectedLogLevel,
              ['verbose', 'debug', 'info', 'warning', 'error'],
              (value) => setState(() => selectedLogLevel = value!),
              displayNames: {
                'verbose': 'جزئیات کامل',
                'debug': 'دیباگ',
                'info': 'اطلاعات',
                'warning': 'هشدار',
                'error': 'خطا',
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEnvironmentSettings() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.settings_outlined, size: 16),
                SizedBox(width: 8),
                Text(
                  'تنظیمات محیط',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildDropdownTile(
              'سرور API',
              'API Endpoint',
              selectedApiEndpoint,
              ['development', 'staging', 'production'],
              (value) => setState(() => selectedApiEndpoint = value!),
              displayNames: {
                'development': 'توسعه',
                'staging': 'تست',
                'production': 'تولید',
              },
            ),
            _buildDropdownTile(
              'حالت ساخت',
              'Build Mode',
              selectedBuildMode,
              ['debug', 'profile', 'release'],
              (value) => setState(() => selectedBuildMode = value!),
              displayNames: {
                'debug': 'دیباگ',
                'profile': 'پروفایل',
                'release': 'انتشار',
              },
            ),
            _buildSwitchTile(
              'مانیتورینگ عملکرد',
              'Performance Monitoring',
              enablePerformanceMonitoring,
              (value) => setState(() => enablePerformanceMonitoring = value),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToolsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildToolsGrid(),
          const SizedBox(height: 16),
          _buildSystemInfo(),
        ],
      ),
    );
  }

  Widget _buildToolsGrid() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.build_outlined, size: 16),
                SizedBox(width: 8),
                Text(
                  'ابزارهای توسعه‌دهنده',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: devTools.length,
              itemBuilder: (context, index) {
                final tool = devTools[index];
                return _buildToolCard(tool);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToolCard(DevTool tool) {
    return InkWell(
      onTap: () => _openTool(tool.id),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: tool.color.withOpacity(0.1),
          border: Border.all(color: tool.color.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(tool.icon, color: tool.color, size: 20),
                const Spacer(),
                Icon(Icons.arrow_forward_ios, color: tool.color, size: 12),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              tool.title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: tool.color,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              tool.description,
              style: TextStyle(
                fontSize: 10,
                color: tool.color.withOpacity(0.8),
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSystemInfo() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.info_outline, size: 16),
                SizedBox(width: 8),
                Text(
                  'اطلاعات سیستم',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildInfoRow('نسخه Flutter', '3.24.0'),
            _buildInfoRow('نسخه Dart', '3.5.0'),
            _buildInfoRow('سیستم عامل', 'Android 14'),
            _buildInfoRow('معماری', 'arm64-v8a'),
            _buildInfoRow('حافظه RAM', '8 GB'),
            _buildInfoRow('فضای خالی', '256 GB'),
            _buildInfoRow('شناسه دستگاه', 'abc123...'),
            _buildInfoRow('شناسه ساخت', 'a1b2c3d4'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 11, fontFamily: 'monospace'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildLogControls(),
          const SizedBox(height: 16),
          _buildLogsList(),
        ],
      ),
    );
  }

  Widget _buildLogControls() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.settings_outlined, size: 16),
                SizedBox(width: 8),
                Text(
                  'کنترل لاگ‌ها',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _clearLogs,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade600,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    child: const Text(
                      'پاکسازی لاگ‌ها',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _exportLogs,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade600,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    child: const Text(
                      'صادرات لاگ‌ها',
                      style: TextStyle(fontSize: 12, color: Colors.white),
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

  Widget _buildLogsList() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.list_alt_outlined, size: 16),
                SizedBox(width: 8),
                Text(
                  'لاگ‌های اخیر',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...logs.map((log) => _buildLogItem(log)),
          ],
        ),
      ),
    );
  }

  Widget _buildLogItem(LogEntry log) {
    Color levelColor;
    switch (log.level) {
      case 'ERROR':
        levelColor = Colors.red;
        break;
      case 'WARNING':
        levelColor = Colors.orange;
        break;
      case 'INFO':
        levelColor = Colors.blue;
        break;
      case 'DEBUG':
        levelColor = Colors.green;
        break;
      default:
        levelColor = Colors.grey;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(6),
        border: Border(
          right: BorderSide(color: levelColor, width: 3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                  color: levelColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Text(
                  log.level,
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                    color: levelColor,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                log.category,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey.shade600,
                ),
              ),
              const Spacer(),
              Text(
                log.timestamp,
                style: TextStyle(
                  fontSize: 9,
                  color: Colors.grey.shade500,
                  fontFamily: 'monospace',
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            log.message,
            style: const TextStyle(fontSize: 11),
          ),
        ],
      ),
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
              return DropdownMenuItem(
                value: option,
                child: Text(displayText),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  void _openTool(String toolId) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('بازکردن ابزار $toolId'),
        backgroundColor: Colors.blue,
      ),
    );
  }

  void _clearLogs() {
    setState(() {
      logs.clear();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('لاگ‌ها پاکسازی شدند'),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _exportLogs() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('صادرات لاگ‌ها در حال انجام...'),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

class DevTool {
  final String id;
  final String title;
  final String titleEn;
  final String description;
  final IconData icon;
  final Color color;

  DevTool({
    required this.id,
    required this.title,
    required this.titleEn,
    required this.description,
    required this.icon,
    required this.color,
  });
}

class LogEntry {
  final String timestamp;
  final String level;
  final String message;
  final String category;

  LogEntry({
    required this.timestamp,
    required this.level,
    required this.message,
    required this.category,
  });
}