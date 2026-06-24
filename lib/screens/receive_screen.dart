import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ReceiveScreen extends StatefulWidget {
  const ReceiveScreen({super.key});

  @override
  State<ReceiveScreen> createState() => _ReceiveScreenState();
}

class _ReceiveScreenState extends State<ReceiveScreen> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String _selectedCurrency = 'IRR';
  String _qrData = '';
  bool _showQR = false;

  final List<Map<String, String>> _currencies = [
    {'value': 'IRR', 'label': 'ریال ایرانی', 'type': 'fiat'},
    {'value': 'USD', 'label': 'دلار آمریکا', 'type': 'fiat'},
    {'value': 'EUR', 'label': 'یورو', 'type': 'fiat'},
    {'value': 'BTC', 'label': 'بیت کوین', 'type': 'crypto'},
    {'value': 'ETH', 'label': 'اتریوم', 'type': 'crypto'},
    {'value': 'USDT', 'label': 'تتر', 'type': 'crypto'},
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
                  Icons.qr_code_2_outlined,
                  color: Color(0xFF059669),
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'سیستم دریافت وجه ابری',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Cloud Payment Request System',
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
            'تولید QR Code برای دریافت پرداخت از مشتریان',
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
          if (!_showQR) _buildRequestForm(),
          if (_showQR) _buildQRDisplay(),
        ],
      ),
    );
  }

  Widget _buildRequestForm() {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.payment_outlined, size: 20),
                    const SizedBox(width: 8),
                    const Text(
                      'درخواست پرداخت جدید',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                
                // Amount and Currency
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextField(
                        controller: _amountController,
                        decoration: const InputDecoration(
                          labelText: 'مبلغ',
                          hintText: '0',
                        ),
                        keyboardType: TextInputType.number,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        initialValue: _selectedCurrency,
                        decoration: const InputDecoration(
                          labelText: 'نوع ارز',
                        ),
                        style: const TextStyle(fontSize: 12, color: Colors.black),
                        items: _currencies.map((currency) {
                          return DropdownMenuItem(
                            value: currency['value'],
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  currency['label']!,
                                  style: const TextStyle(fontSize: 11),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 4,
                                    vertical: 1,
                                  ),
                                  decoration: BoxDecoration(
                                    color: currency['type'] == 'crypto'
                                        ? Colors.orange.shade100
                                        : Colors.blue.shade100,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    currency['type'] == 'crypto' ? 'رمزارز' : 'فیات',
                                    style: TextStyle(
                                      fontSize: 8,
                                      color: currency['type'] == 'crypto'
                                          ? Colors.orange.shade800
                                          : Colors.blue.shade800,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedCurrency = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 16),
                
                // Description
                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'توضیحات',
                    hintText: 'توضیحات درخواست پرداخت (اختیاری)',
                  ),
                  maxLines: 3,
                  style: const TextStyle(fontSize: 12),
                ),
                
                const SizedBox(height: 16),
                
                // Preview
                if (_amountController.text.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'مبلغ درخواستی:',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${_amountController.text} $_selectedCurrency',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                
                const SizedBox(height: 20),
                
                // Generate Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _generateQR,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF059669),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.qr_code_2_outlined, size: 16),
                        SizedBox(width: 8),
                        Text(
                          'تولید QR Code پرداخت',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        
        const SizedBox(height: 20),
        _buildInvoiceSelector(),
      ],
    );
  }

  Widget _buildInvoiceSelector() {
    final invoices = [
      {
        'number': '16195',
        'amount': '6,600,000',
        'currency': 'IRR',
        'customer': 'دفاتر چاپی احمدرضا جنگ',
        'description': 'فروش کیک‌های قندی مختلف',
      },
      {
        'number': '16196',
        'amount': '2,500,000',
        'currency': 'IRR',
        'customer': 'شرکت فناوری نوین',
        'description': 'خدمات مشاوره مالی',
      },
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.receipt_long_outlined, size: 20),
                const SizedBox(width: 8),
                const Text(
                  'بارگذاری از فاکتور',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...invoices.map((invoice) {
              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      invoice['number']!,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade800,
                      ),
                    ),
                  ),
                  title: Text(
                    invoice['customer']!,
                    style: const TextStyle(fontSize: 12),
                  ),
                  subtitle: Text(
                    '${invoice['amount']} ${invoice['currency']}',
                    style: const TextStyle(fontSize: 11),
                  ),
                  trailing: ElevatedButton(
                    onPressed: () => _loadFromInvoice(invoice),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                    ),
                    child: const Text(
                      'انتخاب',
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildQRDisplay() {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.qr_code_2, size: 20),
                    const SizedBox(width: 8),
                    const Text(
                      'QR Code درخواست پرداخت',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                
                // QR Code
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300, width: 2),
                  ),
                  child: Column(
                    children: [
                      QrImageView(
                        data: _qrData,
                        version: QrVersions.auto,
                        size: 200.0,
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'مشتری می‌تواند این QR Code را اسکن کند',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Payment Details
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'جزئیات درخواست پرداخت:',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildDetailRow('مبلغ:', '${_amountController.text} $_selectedCurrency'),
                      _buildDetailRow('دریافت‌کننده:', 'ابر مالی بازرگانی نوین اکس'),
                      if (_descriptionController.text.isNotEmpty)
                        _buildDetailRow('توضیحات:', _descriptionController.text),
                      _buildDetailRow('تاریخ:', '1404/03/22'),
                    ],
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Action Buttons
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _shareQR,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.share_outlined, size: 16),
                            SizedBox(width: 4),
                            Text('اشتراک', style: TextStyle(fontSize: 11)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _downloadQR,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.download_outlined, size: 16),
                            SizedBox(width: 4),
                            Text('دانلود', style: TextStyle(fontSize: 11)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 8),
                
                // New Request Button
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: _newRequest,
                    child: const Text(
                      'درخواست پرداخت جدید',
                      style: TextStyle(fontSize: 11),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 11,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }

  void _generateQR() {
    if (_amountController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('لطفاً مبلغ را وارد کنید'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Generate QR data
    final qrData = {
      'amount': _amountController.text,
      'currency': _selectedCurrency,
      'recipient': 'ابر مالی بازرگانی نوین اکس',
      'description': _descriptionController.text,
      'timestamp': DateTime.now().toIso8601String(),
      'system': 'Cloud Financial System X',
    };

    setState(() {
      _qrData = qrData.toString();
      _showQR = true;
    });
  }

  void _loadFromInvoice(Map<String, String> invoice) {
    setState(() {
      _amountController.text = invoice['amount']!.replaceAll(',', '');
      _selectedCurrency = invoice['currency']!;
      _descriptionController.text = 'فاکتور ${invoice['number']} - ${invoice['description']}';
    });
  }

  void _shareQR() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('QR Code به اشتراک گذاشته شد!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _downloadQR() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('QR Code دانلود شد!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _newRequest() {
    setState(() {
      _amountController.clear();
      _descriptionController.clear();
      _selectedCurrency = 'IRR';
      _qrData = '';
      _showQR = false;
    });
  }

  @override
  void dispose() {
    _amountController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}