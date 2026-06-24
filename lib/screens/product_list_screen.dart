import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  String searchTerm = '';
  String selectedCategory = 'all';
  String sortBy = 'name';
  
  final TextEditingController _searchController = TextEditingController();

  final List<ProductData> products = [
    ProductData(
      id: 'P001',
      name: 'کیک شکلاتی ویژه',
      nameEn: 'Special Chocolate Cake',
      category: 'کیک و شیرینی',
      price: 450000,
      currency: 'IRR',
      stock: 25,
      status: 'موجود',
      barcode: '1234567890123',
      supplier: 'شیرینی‌سرای نعلی',
      lastUpdated: '1404/03/20',
      image: '🎂',
    ),
    ProductData(
      id: 'P002',
      name: 'کیک وانیلی',
      nameEn: 'Vanilla Cake',
      category: 'کیک و شیرینی',
      price: 380000,
      currency: 'IRR',
      stock: 15,
      status: 'موجود',
      barcode: '1234567890124',
      supplier: 'شیرینی‌سرای نعلی',
      lastUpdated: '1404/03/21',
      image: '🍰',
    ),
    ProductData(
      id: 'P003',
      name: 'کاپ کیک مخصوص',
      nameEn: 'Special Cupcake',
      category: 'کیک و شیرینی',
      price: 120000,
      currency: 'IRR',
      stock: 0,
      status: 'ناموجود',
      barcode: '1234567890125',
      supplier: 'شیرینی‌سرای نعلی',
      lastUpdated: '1404/03/19',
      image: '🧁',
    ),
    ProductData(
      id: 'P004',
      name: 'قلم فلزی',
      nameEn: 'Metal Pen',
      category: 'لوازم التحریر',
      price: 45000,
      currency: 'IRR',
      stock: 100,
      status: 'موجود',
      barcode: '1234567890126',
      supplier: 'پخش مرکزی',
      lastUpdated: '1404/03/22',
      image: '🖊️',
    ),
    ProductData(
      id: 'P005',
      name: 'دفترچه یادداشت',
      nameEn: 'Notebook',
      category: 'لوازم التحریر',
      price: 25000,
      currency: 'IRR',
      stock: 75,
      status: 'موجود',
      barcode: '1234567890127',
      supplier: 'پخش مرکزی',
      lastUpdated: '1404/03/18',
      image: '📓',
    ),
    ProductData(
      id: 'P006',
      name: 'مشاوره مالی یک ساعته',
      nameEn: '1-Hour Financial Consulting',
      category: 'خدمات مشاوره',
      price: 2500000,
      currency: 'IRR',
      stock: 0,
      status: 'خدمات',
      barcode: 'S001',
      supplier: 'داخلی',
      lastUpdated: '1404/03/20',
      image: '💼',
    ),
  ];

  List<ProductData> get filteredProducts {
    return products.where((product) {
      final matchesSearch = product.name.toLowerCase().contains(searchTerm.toLowerCase()) ||
                           product.nameEn.toLowerCase().contains(searchTerm.toLowerCase());
      final matchesCategory = selectedCategory == 'all' || product.category == selectedCategory;
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
                  Icons.list_alt_outlined,
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
                      'فهرست کالا و خدمات',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Product & Service Inventory',
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
            'مدیریت و مشاهده کامل محصولات و خدمات',
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
          _buildProductsList(),
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
                          hintText: 'نام محصول یا کد...',
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
                          DropdownMenuItem(value: 'all', child: Text('همه دسته‌ها')),
                          DropdownMenuItem(value: 'کیک و شیرینی', child: Text('کیک و شیرینی')),
                          DropdownMenuItem(value: 'لوازم التحریر', child: Text('لوازم التحریر')),
                          DropdownMenuItem(value: 'خدمات مشاوره', child: Text('خدمات مشاوره')),
                        ],
                        onChanged: (value) => setState(() => selectedCategory = value!),
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
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade600,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, size: 16, color: Colors.white),
                        SizedBox(width: 4),
                        Text('محصول جدید', style: TextStyle(fontSize: 12, color: Colors.white)),
                      ],
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

  Widget _buildSummaryCards() {
    final availableCount = products.where((p) => p.status == 'موجود').length;
    final unavailableCount = products.where((p) => p.status == 'ناموجود').length;
    final servicesCount = products.where((p) => p.status == 'خدمات').length;

    return Row(
      children: [
        Expanded(
          child: _buildSummaryCard(
            '${products.length}',
            'کل محصولات',
            Colors.blue.shade600,
            Colors.blue.shade50,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildSummaryCard(
            '$availableCount',
            'موجود',
            Colors.green.shade600,
            Colors.green.shade50,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildSummaryCard(
            '$unavailableCount',
            'ناموجود',
            Colors.red.shade600,
            Colors.red.shade50,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildSummaryCard(
            '$servicesCount',
            'خدمات',
            Colors.purple.shade600,
            Colors.purple.shade50,
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryCard(String count, String label, Color textColor, Color bgColor) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text(
              count,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductsList() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.list_alt_outlined, size: 16),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'فهرست محصولات (${filteredProducts.length})',
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
            if (filteredProducts.isEmpty)
              const Center(
                child: Column(
                  children: [
                    SizedBox(height: 32),
                    Icon(Icons.search_off, size: 48, color: Colors.grey),
                    SizedBox(height: 16),
                    Text(
                      'محصولی یافت نشد',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'هیچ محصولی با معیارهای جستجو یافت نشد',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    SizedBox(height: 32),
                  ],
                ),
              )
            else
              ...filteredProducts.map((product) => _buildProductItem(product)),
          ],
        ),
      ),
    );
  }

  Widget _buildProductItem(ProductData product) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.purple.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              product.image,
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
                        product.name,
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        product.id,
                        style: TextStyle(fontSize: 10, color: Colors.grey.shade800),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  product.nameEn,
                  style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      'دسته: ${product.category}',
                      style: TextStyle(fontSize: 10, color: Colors.grey.shade500),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'تامین‌کننده: ${product.supplier}',
                      style: TextStyle(fontSize: 10, color: Colors.grey.shade500),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${_formatPrice(product.price)} ریال',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade600,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                product.status == 'خدمات' 
                    ? 'موجودی: نامحدود'
                    : 'موجودی: ${product.stock} عدد',
                style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: _getStatusColor(product.status),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  product.status,
                  style: TextStyle(
                    fontSize: 10,
                    color: _getStatusTextColor(product.status),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatPrice(int price) {
    return price.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'موجود':
        return Colors.green.shade100;
      case 'ناموجود':
        return Colors.red.shade100;
      case 'خدمات':
        return Colors.purple.shade100;
      default:
        return Colors.grey.shade100;
    }
  }

  Color _getStatusTextColor(String status) {
    switch (status) {
      case 'موجود':
        return Colors.green.shade800;
      case 'ناموجود':
        return Colors.red.shade800;
      case 'خدمات':
        return Colors.purple.shade800;
      default:
        return Colors.grey.shade800;
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

class ProductData {
  final String id;
  final String name;
  final String nameEn;
  final String category;
  final int price;
  final String currency;
  final int stock;
  final String status;
  final String barcode;
  final String supplier;
  final String lastUpdated;
  final String image;

  ProductData({
    required this.id,
    required this.name,
    required this.nameEn,
    required this.category,
    required this.price,
    required this.currency,
    required this.stock,
    required this.status,
    required this.barcode,
    required this.supplier,
    required this.lastUpdated,
    required this.image,
  });
}