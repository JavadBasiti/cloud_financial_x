import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CompoundDocumentScreen extends StatefulWidget {
  const CompoundDocumentScreen({super.key});

  @override
  State<CompoundDocumentScreen> createState() => _CompoundDocumentScreenState();
}

class _CompoundDocumentScreenState extends State<CompoundDocumentScreen> {
  bool isCreatingDocument = false;
  String selectedDocumentType = 'general';
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _referenceController = TextEditingController();
  
  final List<DocumentEntryData> entries = [];
  int totalDebit = 0;
  int totalCredit = 0;

  final List<CompoundDocumentData> documents = [
    CompoundDocumentData(
      id: 'CD001',
      documentNumber: 'DOC-001-1404',
      date: '1404/03/22',
      description: 'فروش کیک‌های قندی به شرکت فناوری نوین',
      reference: 'INV-16195',
      status: 'تایید شده',
      totalAmount: 6600000,
      entries: [
        DocumentEntryData(
          accountCode: '1101',
          accountName: 'صندوق',
          debit: 6600000,
          credit: 0,
          description: 'دریافت نقدی بابت فروش کیک',
        ),
        DocumentEntryData(
          accountCode: '3100',
          accountName: 'فروش کالا',
          debit: 0,
          credit: 6600000,
          description: 'درآمد حاصل از فروش کیک‌های قندی',
        ),
      ],
    ),
    CompoundDocumentData(
      id: 'CD002',
      documentNumber: 'DOC-002-1404',
      date: '1404/03/21',
      description: 'خرید مواد اولیه از تامین‌کننده',
      reference: 'PUR-001',
      status: 'در انتظار تایید',
      totalAmount: 2800000,
      entries: [
        DocumentEntryData(
          accountCode: '1300',
          accountName: 'موجودی مواد',
          debit: 2800000,
          credit: 0,
          description: 'خرید مواد اولیه برای تولید',
        ),
        DocumentEntryData(
          accountCode: '2101',
          accountName: 'تامین‌کنندگان',
          debit: 0,
          credit: 2800000,
          description: 'بدهی به تامین‌کننده',
        ),
      ],
    ),
    CompoundDocumentData(
      id: 'CD003',
      documentNumber: 'DOC-003-1404',
      date: '1404/03/20',
      description: 'پرداخت حقوق کارکنان',
      reference: 'PAY-001',
      status: 'تایید شده',
      totalAmount: 15000000,
      entries: [
        DocumentEntryData(
          accountCode: '4100',
          accountName: 'هزینه حقوق',
          debit: 15000000,
          credit: 0,
          description: 'پرداخت حقوق ماهانه کارکنان',
        ),
        DocumentEntryData(
          accountCode: '1102',
          accountName: 'بانک ملی',
          debit: 0,
          credit: 15000000,
          description: 'پرداخت از حساب بانکی',
        ),
      ],
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
                  child: isCreatingDocument ? _buildCreateDocument() : _buildContent(),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: !isCreatingDocument ? FloatingActionButton(
        onPressed: () => setState(() => isCreatingDocument = true),
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
                  if (isCreatingDocument) {
                    setState(() => isCreatingDocument = false);
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
                  Icons.description_outlined,
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
                      isCreatingDocument ? 'ایجاد سند مرکب جدید' : 'مدیریت اسناد مرکب',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      isCreatingDocument ? 'Create New Compound Document' : 'Compound Documents Management',
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
            isCreatingDocument 
                ? 'ثبت عملیات مالی با چندین حساب'
                : 'مدیریت و کنترل اسناد حسابداری مرکب',
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
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildSummaryCards(),
          const SizedBox(height: 16),
          _buildDocumentsList(),
        ],
      ),
    );
  }

  Widget _buildSummaryCards() {
    final approvedCount = documents.where((d) => d.status == 'تایید شده').length;
    final pendingCount = documents.where((d) => d.status == 'در انتظار تایید').length;
    final totalAmount = documents.fold<int>(0, (sum, d) => sum + d.totalAmount);

    return Row(
      children: [
        Expanded(
          child: _buildSummaryCard(
            '${documents.length}',
            'کل اسناد',
            Colors.blue.shade600,
            Colors.blue.shade50,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildSummaryCard(
            '$approvedCount',
            'تایید شده',
            Colors.green.shade600,
            Colors.green.shade50,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildSummaryCard(
            '$pendingCount',
            'در انتظار',
            Colors.orange.shade600,
            Colors.orange.shade50,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildSummaryCard(
            '${_formatPrice(totalAmount)}M',
            'کل مبلغ',
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
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDocumentsList() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.description_outlined, size: 16),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'فهرست اسناد مرکب',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.print_outlined, size: 14),
                      SizedBox(width: 4),
                      Text('چاپ گزارش', style: TextStyle(fontSize: 10)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...documents.map((document) => _buildDocumentItem(document)),
          ],
        ),
      ),
    );
  }

  Widget _buildDocumentItem(CompoundDocumentData document) {
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
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.purple.shade100,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(
                  Icons.description_outlined,
                  size: 16,
                  color: Colors.purple,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          document.documentNumber,
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: document.status == 'تایید شده'
                                ? Colors.green.shade100
                                : Colors.orange.shade100,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            document.status,
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w500,
                              color: document.status == 'تایید شده'
                                  ? Colors.green.shade800
                                  : Colors.orange.shade800,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      document.description,
                      style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${_formatPrice(document.totalAmount)} ریال',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade600,
                    ),
                  ),
                  Text(
                    document.date,
                    style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(height: 1),
          const SizedBox(height: 8),
          Text(
            'ردیف‌های سند:',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade700,
            ),
          ),
          const SizedBox(height: 8),
          ...document.entries.take(2).map((entry) => Container(
            margin: const EdgeInsets.only(bottom: 4),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Text(
                    entry.accountCode,
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade800,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    entry.accountName,
                    style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                  ),
                ),
                if (entry.debit > 0)
                  Text(
                    'بدهکار: ${_formatPrice(entry.debit)}',
                    style: TextStyle(fontSize: 10, color: Colors.red.shade600),
                  ),
                if (entry.credit > 0)
                  Text(
                    'بستانکار: ${_formatPrice(entry.credit)}',
                    style: TextStyle(fontSize: 10, color: Colors.green.shade600),
                  ),
              ],
            ),
          )),
          if (document.entries.length > 2)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                '... و ${document.entries.length - 2} ردیف دیگر',
                style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
              ),
            ),
          const SizedBox(height: 8),
          Row(
            children: [
              if (document.reference.isNotEmpty) ...[
                Icon(Icons.link_outlined, size: 12, color: Colors.grey.shade600),
                const SizedBox(width: 4),
                Text(
                  'مرجع: ${document.reference}',
                  style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
                ),
                const Spacer(),
              ],
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  minimumSize: Size.zero,
                ),
                child: const Text('مشاهده کامل', style: TextStyle(fontSize: 10)),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade600,
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  minimumSize: Size.zero,
                ),
                child: const Text(
                  'ویرایش',
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCreateDocument() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildDocumentHeader(),
          const SizedBox(height: 16),
          _buildEntriesSection(),
          const SizedBox(height: 16),
          _buildBalance(),
          const SizedBox(height: 16),
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildDocumentHeader() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'اطلاعات کلی سند',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'تاریخ سند',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          '1404/03/22',
                          style: TextStyle(fontSize: 12),
                        ),
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
                        'نوع سند',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 4),
                      DropdownButtonFormField<String>(
                        initialValue: selectedDocumentType,
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        ),
                        style: const TextStyle(fontSize: 12, color: Colors.black),
                        items: const [
                          DropdownMenuItem(value: 'general', child: Text('سند عمومی')),
                          DropdownMenuItem(value: 'sales', child: Text('سند فروش')),
                          DropdownMenuItem(value: 'purchase', child: Text('سند خرید')),
                          DropdownMenuItem(value: 'payment', child: Text('سند پرداخت')),
                          DropdownMenuItem(value: 'receipt', child: Text('سند دریافت')),
                        ],
                        onChanged: (value) => setState(() => selectedDocumentType = value!),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'شرح سند',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 4),
                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    hintText: 'توضیحات کامل سند را وارد کنید...',
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                  style: const TextStyle(fontSize: 12),
                  maxLines: 2,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'شماره مرجع (اختیاری)',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 4),
                TextField(
                  controller: _referenceController,
                  decoration: const InputDecoration(
                    hintText: 'شماره فاکتور، چک یا مرجع دیگر...',
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEntriesSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'ردیف‌های سند',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
                ElevatedButton(
                  onPressed: _addEntry,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade600,
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    minimumSize: Size.zero,
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add, size: 14, color: Colors.white),
                      SizedBox(width: 4),
                      Text('افزودن ردیف', style: TextStyle(fontSize: 10, color: Colors.white)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (entries.isEmpty)
              Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Column(
                    children: [
                      Icon(Icons.add_circle_outline, size: 32, color: Colors.grey),
                      SizedBox(height: 8),
                      Text(
                        'هنوز ردیفی اضافه نشده',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'برای شروع یک ردیف اضافه کنید',
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              )
            else
              ...entries.asMap().entries.map((entry) => _buildEntryItem(entry.key, entry.value)),
          ],
        ),
      ),
    );
  }

  Widget _buildEntryItem(int index, DocumentEntryData entry) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'ردیف ${index + 1}',
                style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              IconButton(
                onPressed: () => _removeEntry(index),
                icon: const Icon(Icons.delete_outline, size: 16, color: Colors.red),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  entry.accountCode,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade800,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  entry.accountName,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              if (entry.debit > 0)
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      'بدهکار: ${_formatPrice(entry.debit)} ریال',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Colors.red.shade700,
                      ),
                    ),
                  ),
                ),
              if (entry.debit > 0 && entry.credit > 0) const SizedBox(width: 8),
              if (entry.credit > 0)
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      'بستانکار: ${_formatPrice(entry.credit)} ریال',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Colors.green.shade700,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          if (entry.description.isNotEmpty) ...[
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                entry.description,
                style: TextStyle(fontSize: 11, color: Colors.grey.shade700),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildBalance() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'تراز سند',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'کل بدهکار',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.red.shade700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${_formatPrice(totalDebit)} ریال',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.red.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'کل بستانکار',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.green.shade700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${_formatPrice(totalCredit)} ریال',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: totalDebit == totalCredit ? Colors.blue.shade50 : Colors.orange.shade50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'اختلاف',
                          style: TextStyle(
                            fontSize: 12,
                            color: totalDebit == totalCredit ? Colors.blue.shade700 : Colors.orange.shade700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          totalDebit == totalCredit ? 'متعادل' : '${_formatPrice((totalDebit - totalCredit).abs())} ریال',
                          style: TextStyle(
                            fontSize: totalDebit == totalCredit ? 12 : 14,
                            fontWeight: FontWeight.bold,
                            color: totalDebit == totalCredit ? Colors.blue.shade700 : Colors.orange.shade700,
                          ),
                        ),
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

  Widget _buildActionButtons() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => setState(() => isCreatingDocument = false),
                child: const Text('انصراف', style: TextStyle(fontSize: 12)),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: entries.isNotEmpty && totalDebit == totalCredit ? _saveDocument : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade600,
                ),
                child: const Text(
                  'ذخیره سند',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addEntry() {
    // In a real app, this would show a dialog to select account and enter amounts
    setState(() {
      entries.add(DocumentEntryData(
        accountCode: '1101',
        accountName: 'صندوق',
        debit: 1000000,
        credit: 0,
        description: 'نمونه ردیف',
      ));
      _updateTotals();
    });
  }

  void _removeEntry(int index) {
    setState(() {
      entries.removeAt(index);
      _updateTotals();
    });
  }

  void _updateTotals() {
    totalDebit = entries.fold(0, (sum, entry) => sum + entry.debit);
    totalCredit = entries.fold(0, (sum, entry) => sum + entry.credit);
  }

  void _saveDocument() {
    // Save document logic here
    setState(() {
      isCreatingDocument = false;
      entries.clear();
      totalDebit = 0;
      totalCredit = 0;
      _descriptionController.clear();
      _referenceController.clear();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('سند با موفقیت ثبت شد'),
        backgroundColor: Colors.green,
      ),
    );
  }

  String _formatPrice(int price) {
    return price.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _referenceController.dispose();
    super.dispose();
  }
}

class CompoundDocumentData {
  final String id;
  final String documentNumber;
  final String date;
  final String description;
  final String reference;
  final String status;
  final int totalAmount;
  final List<DocumentEntryData> entries;

  CompoundDocumentData({
    required this.id,
    required this.documentNumber,
    required this.date,
    required this.description,
    required this.reference,
    required this.status,
    required this.totalAmount,
    required this.entries,
  });
}

class DocumentEntryData {
  final String accountCode;
  final String accountName;
  final int debit;
  final int credit;
  final String description;

  DocumentEntryData({
    required this.accountCode,
    required this.accountName,
    required this.debit,
    required this.credit,
    required this.description,
  });
}