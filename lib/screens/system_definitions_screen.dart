import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SystemDefinitionsScreen extends StatefulWidget {
  const SystemDefinitionsScreen({super.key});

  @override
  State<SystemDefinitionsScreen> createState() => _SystemDefinitionsScreenState();
}

class _SystemDefinitionsScreenState extends State<SystemDefinitionsScreen> {
  int selectedTabIndex = 0;
  bool isAddingDefinition = false;
  String selectedDefinitionType = 'currency';
  
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final List<DefinitionTab> tabs = [
    DefinitionTab(
      id: 'currency',
      title: 'واحد پولی',
      titleEn: 'Currencies',
      icon: Icons.attach_money_outlined,
    ),
    DefinitionTab(
      id: 'unit',
      title: 'واحد اندازه‌گیری',
      titleEn: 'Units',
      icon: Icons.straighten_outlined,
    ),
    DefinitionTab(
      id: 'tax',
      title: 'نرخ مالیات',
      titleEn: 'Tax Rates',
      icon: Icons.percent_outlined,
    ),
    DefinitionTab(
      id: 'bank',
      title: 'بانک‌ها',
      titleEn: 'Banks',
      icon: Icons.account_balance_outlined,
    ),
    DefinitionTab(
      id: 'location',
      title: 'مناطق جغرافیایی',
      titleEn: 'Locations',
      icon: Icons.location_on_outlined,
    ),
  ];

  final Map<String, List<SystemDefinition>> definitions = {
    'currency': [
      SystemDefinition(
        id: '1',
        code: 'IRR',
        name: 'ریال ایرانی',
        nameEn: 'Iranian Rial',
        description: 'واحد پولی رسمی ایران',
        value: '1',
        status: 'فعال',
        type: 'currency',
      ),
      SystemDefinition(
        id: '2',
        code: 'USD',
        name: 'دلار آمریکا',
        nameEn: 'US Dollar',
        description: 'واحد پولی آمریکا',
        value: '42000',
        status: 'فعال',
        type: 'currency',
      ),
      SystemDefinition(
        id: '3',
        code: 'EUR',
        name: 'یورو',
        nameEn: 'Euro',
        description: 'واحد پولی اتحادیه اروپا',
        value: '45000',
        status: 'فعال',
        type: 'currency',
      ),
    ],
    'unit': [
      SystemDefinition(
        id: '4',
        code: 'KG',
        name: 'کیلوگرم',
        nameEn: 'Kilogram',
        description: 'واحد وزن',
        value: '1000',
        status: 'فعال',
        type: 'unit',
      ),
      SystemDefinition(
        id: '5',
        code: 'M',
        name: 'متر',
        nameEn: 'Meter',
        description: 'واحد طول',
        value: '100',
        status: 'فعال',
        type: 'unit',
      ),
      SystemDefinition(
        id: '6',
        code: 'PCS',
        name: 'عدد',
        nameEn: 'Pieces',
        description: 'واحد شمارش',
        value: '1',
        status: 'فعال',
        type: 'unit',
      ),
    ],
    'tax': [
      SystemDefinition(
        id: '7',
        code: 'VAT',
        name: 'مالیات بر ارزش افزوده',
        nameEn: 'Value Added Tax',
        description: 'مالیات 9 درصدی',
        value: '9',
        status: 'فعال',
        type: 'tax',
      ),
      SystemDefinition(
        id: '8',
        code: 'TAX',
        name: 'مالیات درآمد',
        nameEn: 'Income Tax',
        description: 'مالیات بر درآمد',
        value: '10',
        status: 'فعال',
        type: 'tax',
      ),
    ],
    'bank': [
      SystemDefinition(
        id: '9',
        code: 'MELLI',
        name: 'بانک ملی ایران',
        nameEn: 'Bank Melli Iran',
        description: 'بانک ملی ایران',
        value: '011',
        status: 'فعال',
        type: 'bank',
      ),
      SystemDefinition(
        id: '10',
        code: 'PARSIAN',
        name: 'بانک پارسیان',
        nameEn: 'Parsian Bank',
        description: 'بانک پارسیان',
        value: '054',
        status: 'فعال',
        type: 'bank',
      ),
    ],
    'location': [
      SystemDefinition(
        id: '11',
        code: 'THR',
        name: 'تهران',
        nameEn: 'Tehran',
        description: 'استان تهران',
        value: '01',
        status: 'فعال',
        type: 'location',
      ),
      SystemDefinition(
        id: '12',
        code: 'ISF',
        name: 'اصفهان',
        nameEn: 'Isfahan',
        description: 'استان اصفهان',
        value: '03',
        status: 'فعال',
        type: 'location',
      ),
    ],
  };

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
                  child: isAddingDefinition ? _buildAddDefinition() : _buildContent(),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: !isAddingDefinition ? FloatingActionButton(
        onPressed: () => setState(() => isAddingDefinition = true),
        backgroundColor: Colors.green.shade600,
        child: const Icon(Icons.add, color: Colors.white),
      ) : null,
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
                onPressed: () {
                  if (isAddingDefinition) {
                    setState(() => isAddingDefinition = false);
                  } else {
                    context.go('/dashboard');
                  }
                },
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.settings_applications_outlined,
                  color: Color(0xFF7C3AED),
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isAddingDefinition ? 'افزودن تعریف جدید' : 'تعاریف سیستم',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      isAddingDefinition ? 'Add New Definition' : 'System Definitions',
                      style: const TextStyle(
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
          Text(
            isAddingDefinition 
                ? 'ایجاد تعریف جدید برای سیستم'
                : 'مدیریت تعاریف پایه سیستم',
            style: const TextStyle(
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
    return Column(
      children: [
        _buildTabBar(),
        Expanded(
          child: _buildTabContent(),
        ),
      ],
    );
  }

  Widget _buildTabBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: tabs.asMap().entries.map((entry) {
            final index = entry.key;
            final tab = entry.value;
            final isSelected = selectedTabIndex == index;
            
            return Expanded(
              child: GestureDetector(
                onTap: () => setState(() => selectedTabIndex = index),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.white : Colors.transparent,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: isSelected 
                        ? [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4)]
                        : null,
                  ),
                  child: Column(
                    children: [
                      Icon(
                        tab.icon,
                        size: 16,
                        color: isSelected ? Colors.purple.shade600 : Colors.grey.shade600,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        tab.title,
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                          color: isSelected ? Colors.purple.shade600 : Colors.grey.shade600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    final currentTab = tabs[selectedTabIndex];
    final currentDefinitions = definitions[currentTab.id] ?? [];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildSummaryCard(currentTab, currentDefinitions),
          const SizedBox(height: 16),
          _buildDefinitionsList(currentDefinitions),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(DefinitionTab tab, List<SystemDefinition> definitions) {
    final activeCount = definitions.where((d) => d.status == 'فعال').length;
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(tab.icon, color: Colors.blue.shade600, size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tab.title,
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        tab.titleEn,
                        style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildSummaryItem(
                    '${definitions.length}',
                    'کل تعاریف',
                    Colors.blue,
                  ),
                ),
                Expanded(
                  child: _buildSummaryItem(
                    '$activeCount',
                    'فعال',
                    Colors.green,
                  ),
                ),
                Expanded(
                  child: _buildSummaryItem(
                    '${definitions.length - activeCount}',
                    'غیرفعال',
                    Colors.orange,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryItem(String value, String label, Color color) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDefinitionsList(List<SystemDefinition> definitions) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.list_outlined, size: 16),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'فهرست تعاریف',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.file_download_outlined, size: 14),
                      SizedBox(width: 4),
                      Text('خروجی Excel', style: TextStyle(fontSize: 10)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (definitions.isEmpty)
              const Center(
                child: Column(
                  children: [
                    SizedBox(height: 32),
                    Icon(Icons.inbox_outlined, size: 48, color: Colors.grey),
                    SizedBox(height: 16),
                    Text(
                      'هنوز تعریفی اضافه نشده',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'برای شروع یک تعریف جدید اضافه کنید',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    SizedBox(height: 32),
                  ],
                ),
              )
            else
              ...definitions.map((definition) => _buildDefinitionItem(definition)),
          ],
        ),
      ),
    );
  }

  Widget _buildDefinitionItem(SystemDefinition definition) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.purple.shade100,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              definition.code,
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
                  definition.name,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                Text(
                  definition.nameEn,
                  style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
                ),
                if (definition.description.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    definition.description,
                    style: TextStyle(fontSize: 10, color: Colors.grey.shade500),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                definition.value,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'monospace',
                ),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: definition.status == 'فعال'
                      ? Colors.green.shade100
                      : Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  definition.status,
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                    color: definition.status == 'فعال'
                        ? Colors.green.shade800
                        : Colors.orange.shade800,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),
          Column(
            children: [
              IconButton(
                onPressed: () => _editDefinition(definition),
                icon: Icon(
                  Icons.edit_outlined,
                  size: 16,
                  color: Colors.blue.shade600,
                ),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              const SizedBox(height: 4),
              IconButton(
                onPressed: () => _deleteDefinition(definition),
                icon: Icon(
                  Icons.delete_outline,
                  size: 16,
                  color: Colors.red.shade600,
                ),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAddDefinition() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'اطلاعات تعریف جدید',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 16),
                  
                  // Type Selection
                  DropdownButtonFormField<String>(
                    initialValue: selectedDefinitionType,
                    decoration: const InputDecoration(
                      labelText: 'نوع تعریف',
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                    style: const TextStyle(fontSize: 12, color: Colors.black),
                    items: tabs.map((tab) => DropdownMenuItem(
                      value: tab.id,
                      child: Text(tab.title),
                    )).toList(),
                    onChanged: (value) => setState(() => selectedDefinitionType = value!),
                  ),
                  
                  const SizedBox(height: 12),
                  
                  // Code Field
                  TextField(
                    controller: _codeController,
                    decoration: const InputDecoration(
                      labelText: 'کد',
                      hintText: 'کد یکتا برای تعریف',
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                    style: const TextStyle(fontSize: 12),
                  ),
                  
                  const SizedBox(height: 12),
                  
                  // Name Field
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'نام فارسی',
                      hintText: 'نام فارسی تعریف',
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                    style: const TextStyle(fontSize: 12),
                  ),
                  
                  const SizedBox(height: 12),
                  
                  // Description Field
                  TextField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'توضیحات',
                      hintText: 'توضیحات اختیاری',
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                    style: const TextStyle(fontSize: 12),
                    maxLines: 3,
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Action Buttons
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => setState(() => isAddingDefinition = false),
                      child: const Text('انصراف', style: TextStyle(fontSize: 12)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _saveDefinition,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade600,
                      ),
                      child: const Text(
                        'ذخیره تعریف',
                        style: TextStyle(fontSize: 12, color: Colors.white),
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

  void _editDefinition(SystemDefinition definition) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('ویرایش ${definition.name}'),
        backgroundColor: Colors.blue,
      ),
    );
  }

  void _deleteDefinition(SystemDefinition definition) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('حذف تعریف'),
        content: Text('آیا از حذف "${definition.name}" مطمئن هستید؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('انصراف'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                definitions[definition.type]?.removeWhere((d) => d.id == definition.id);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('تعریف با موفقیت حذف شد'),
                  backgroundColor: Colors.red,
                ),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('حذف', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _saveDefinition() {
    if (_codeController.text.isEmpty || _nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('لطفاً تمام فیلدهای ضروری را پر کنید'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    setState(() {
      final newDefinition = SystemDefinition(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        code: _codeController.text,
        name: _nameController.text,
        nameEn: _nameController.text,
        description: _descriptionController.text,
        value: '1',
        status: 'فعال',
        type: selectedDefinitionType,
      );

      definitions[selectedDefinitionType] = [
        ...(definitions[selectedDefinitionType] ?? []),
        newDefinition,
      ];

      isAddingDefinition = false;
      _codeController.clear();
      _nameController.clear();
      _descriptionController.clear();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('تعریف جدید با موفقیت اضافه شد'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _codeController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}

class DefinitionTab {
  final String id;
  final String title;
  final String titleEn;
  final IconData icon;

  DefinitionTab({
    required this.id,
    required this.title,
    required this.titleEn,
    required this.icon,
  });
}

class SystemDefinition {
  final String id;
  final String code;
  final String name;
  final String nameEn;
  final String description;
  final String value;
  final String status;
  final String type;

  SystemDefinition({
    required this.id,
    required this.code,
    required this.name,
    required this.nameEn,
    required this.description,
    required this.value,
    required this.status,
    required this.type,
  });
}