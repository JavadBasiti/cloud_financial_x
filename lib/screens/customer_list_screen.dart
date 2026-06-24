import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomerListScreen extends StatefulWidget {
  const CustomerListScreen({super.key});

  @override
  State<CustomerListScreen> createState() => _CustomerListScreenState();
}

class _CustomerListScreenState extends State<CustomerListScreen> {
  String searchTerm = '';
  String selectedCategory = 'all';
  String sortBy = 'name';
  bool isAddingCustomer = false;
  
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final List<CustomerData> customers = [
    CustomerData(
      id: 'C001',
      name: 'دفاتر چاپی احمدرضا جنگ',
      nameEn: 'Ahmadreza Jang Printing Office',
      phone: '09123456789',
      email: 'info@jangprinting.com',
      address: 'تهران، خیابان انقلاب، پلاک 123',
      customerType: 'حقوقی',
      totalPurchases: 15650000,
      lastPurchase: '1404/03/20',
      status: 'فعال',
      avatar: '📄',
    ),
    CustomerData(
      id: 'C002',
      name: 'شرکت فناوری نوین',
      nameEn: 'Modern Technology Company',
      phone: '09987654321',
      email: 'contact@moderntech.ir',
      address: 'تهران، میدان ونک، برج میلاد',
      customerType: 'حقوقی',
      totalPurchases: 8500000,
      lastPurchase: '1404/03/18',
      status: 'فعال',
      avatar: '💻',
    ),
    CustomerData(
      id: 'C003',
      name: 'علی احمدی',
      nameEn: 'Ali Ahmadi',
      phone: '09111111111',
      email: 'ali.ahmadi@gmail.com',
      address: 'اصفهان، خیابان چهارباغ، کوچه گل',
      customerType: 'حقیقی',
      totalPurchases: 2250000,
      lastPurchase: '1404/03/22',
      status: 'فعال',
      avatar: '👤',
    ),
    CustomerData(
      id: 'C004',
      name: 'مریم کریمی',
      nameEn: 'Maryam Karimi',
      phone: '09222222222',
      email: 'maryam.karimi@yahoo.com',
      address: 'شیراز، خیابان زند، پلاک 456',
      customerType: 'حقیقی',
      totalPurchases: 1750000,
      lastPurchase: '1404/03/15',
      status: 'غیرفعال',
      avatar: '👤',
    ),
    CustomerData(
      id: 'C005',
      name: 'رستوران طلایی',
      nameEn: 'Golden Restaurant',
      phone: '09333333333',
      email: 'info@goldenrest.com',
      address: 'مشهد، خیابان امام رضا، نبش کوچه نور',
      customerType: 'حقوقی',
      totalPurchases: 5800000,
      lastPurchase: '1404/03/19',
      status: 'فعال',
      avatar: '🍽️',
    ),
  ];

  List<CustomerData> get filteredCustomers {
    return customers.where((customer) {
      final matchesSearch = customer.name.toLowerCase().contains(searchTerm.toLowerCase()) ||
                           customer.phone.contains(searchTerm) ||
                           customer.email.toLowerCase().contains(searchTerm.toLowerCase());
      final matchesCategory = selectedCategory == 'all' || 
                             (selectedCategory == 'legal' && customer.customerType == 'حقوقی') ||
                             (selectedCategory == 'individual' && customer.customerType == 'حقیقی') ||
                             (selectedCategory == 'active' && customer.status == 'فعال') ||
                             (selectedCategory == 'inactive' && customer.status == 'غیرفعال');
      return matchesSearch && matchesCategory;
    }).toList();
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
        onPressed: () => setState(() => isAddingCustomer = true),
        backgroundColor: Colors.green.shade600,
        child: const Icon(Icons.person_add_outlined, color: Colors.white),
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
                  Icons.people_outline,
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
                      'فهرست مشتریان',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Customer Management System',
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
            'مدیریت کامل اطلاعات مشتریان و ارتباطات',
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
          _buildFilters(),
          const SizedBox(height: 16),
          _buildSummaryCards(),
          const SizedBox(height: 16),
          _buildCustomersList(),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'جستجو',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 4),
                      TextField(
                        controller: _searchController,
                        decoration: const InputDecoration(
                          hintText: 'نام، تلفن یا ایمیل...',
                          prefixIcon: Icon(Icons.search, size: 16),
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        ),
                        style: const TextStyle(fontSize: 12),
                        onChanged: (value) => setState(() => searchTerm = value),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'دسته‌بندی',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 4),
                      DropdownButtonFormField<String>(
                        initialValue: selectedCategory,
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        ),
                        style: const TextStyle(fontSize: 12, color: Colors.black),
                        items: const [
                          DropdownMenuItem(value: 'all', child: Text('همه مشتریان')),
                          DropdownMenuItem(value: 'legal', child: Text('حقوقی')),
                          DropdownMenuItem(value: 'individual', child: Text('حقیقی')),
                          DropdownMenuItem(value: 'active', child: Text('فعال')),
                          DropdownMenuItem(value: 'inactive', child: Text('غیرفعال')),
                        ],
                        onChanged: (value) => setState(() => selectedCategory = value!),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCards() {
    final activeCount = customers.where((c) => c.status == 'فعال').length;
    final legalCount = customers.where((c) => c.customerType == 'حقوقی').length;
    final individualCount = customers.where((c) => c.customerType == 'حقیقی').length;
    final totalRevenue = customers.fold<int>(0, (sum, c) => sum + c.totalPurchases);

    return Row(
      children: [
        Expanded(
          child: _buildSummaryCard(
            '${customers.length}',
            'کل مشتریان',
            Colors.blue.shade600,
            Colors.blue.shade50,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildSummaryCard(
            '$activeCount',
            'فعال',
            Colors.green.shade600,
            Colors.green.shade50,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildSummaryCard(
            '$legalCount',
            'حقوقی',
            Colors.purple.shade600,
            Colors.purple.shade50,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildSummaryCard(
            _formatPrice(totalRevenue),
            'کل فروش',
            Colors.orange.shade600,
            Colors.orange.shade50,
            isPrice: true,
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryCard(String count, String label, Color textColor, Color bgColor, {bool isPrice = false}) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text(
              count,
              style: TextStyle(
                fontSize: isPrice ? 14 : 16,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                color: textColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomersList() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.people_outline, size: 16),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'فهرست مشتریان (${filteredCustomers.length})',
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
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
            if (filteredCustomers.isEmpty)
              const Center(
                child: Column(
                  children: [
                    SizedBox(height: 32),
                    Icon(Icons.person_search_outlined, size: 48, color: Colors.grey),
                    SizedBox(height: 16),
                    Text(
                      'مشتریی یافت نشد',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'هیچ مشتریی با معیارهای جستجو یافت نشد',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    SizedBox(height: 32),
                  ],
                ),
              )
            else
              ...filteredCustomers.map((customer) => _buildCustomerItem(customer)),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomerItem(CustomerData customer) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  customer.avatar,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            customer.name,
                            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: customer.status == 'فعال' 
                                ? Colors.green.shade100
                                : Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            customer.status,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: customer.status == 'فعال'
                                  ? Colors.green.shade800
                                  : Colors.grey.shade800,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      customer.nameEn,
                      style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.phone_outlined, size: 14, color: Colors.grey.shade600),
                        const SizedBox(width: 4),
                        Text(
                          customer.phone,
                          style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                        ),
                        const SizedBox(width: 16),
                        Icon(Icons.email_outlined, size: 14, color: Colors.grey.shade600),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            customer.email,
                            style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined, size: 14, color: Colors.grey.shade600),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            customer.address,
                            style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(height: 1),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'نوع مشتری',
                      style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
                    ),
                    const SizedBox(height: 2),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: customer.customerType == 'حقوقی'
                            ? Colors.purple.shade100
                            : Colors.orange.shade100,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        customer.customerType,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: customer.customerType == 'حقوقی'
                              ? Colors.purple.shade800
                              : Colors.orange.shade800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'کل خرید',
                      style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${_formatPrice(customer.totalPurchases)} ریال',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'آخرین خرید',
                      style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      customer.lastPurchase,
                      style: const TextStyle(fontSize: 11),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade600,
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      minimumSize: Size.zero,
                    ),
                    child: const Text(
                      'مشاهده',
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 4),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      minimumSize: Size.zero,
                    ),
                    child: const Text(
                      'ویرایش',
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatPrice(int price) {
    if (price >= 1000000) {
      return '${(price / 1000000).toStringAsFixed(1)}M';
    } else if (price >= 1000) {
      return '${(price / 1000).toStringAsFixed(1)}K';
    }
    return price.toString();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    super.dispose();
  }
}

class CustomerData {
  final String id;
  final String name;
  final String nameEn;
  final String phone;
  final String email;
  final String address;
  final String customerType;
  final int totalPurchases;
  final String lastPurchase;
  final String status;
  final String avatar;

  CustomerData({
    required this.id,
    required this.name,
    required this.nameEn,
    required this.phone,
    required this.email,
    required this.address,
    required this.customerType,
    required this.totalPurchases,
    required this.lastPurchase,
    required this.status,
    required this.avatar,
  });
}