import 'package:cloud_financial_x/ui/common/form_mod.dart';
import 'package:cloud_financial_x/ui/product/product_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/repository/product_repository.dart';
import '../../domain/product.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  void _loadProducts() {
    setState(() {
      // موجودی محصولات را refresh می‌کند
    });
  }

  void _showEntityDialog({Product? product}) {
    FormMode formMode = product != null ? FormMode.edit : FormMode.create;

    // ذخیره context اصلی برای استفاده بعدی
    final mainContext = context;

    showDialog(
      context: context,
      builder: (dialogContext) => ChangeNotifierProvider<ProductFormController>(
        create: (_) => ProductFormController(product: product),
        child: AlertDialog(
          title: Text(product == null ? 'افزودن محصول' : 'ویرایش محصول'),
          content: SingleChildScrollView(
            child: Consumer<ProductFormController>(
              builder: (context, form, _) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'کد محصول',errorText: form.code.error),
                    onChanged: (v) => form.code.set(v),
                    controller: TextEditingController(text: form.code.value),

                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'توضیحات',errorText: form.descF.error),
                    onChanged: (v) => form.descF.set(v),
                    controller: TextEditingController(text: form.descF.value),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'واحد',errorText: form.unit.error),
                    onChanged: (v) => form.unit.set(v),
                    controller: TextEditingController(text: form.unit.value),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'قیمت خرید',errorText: form.fee.error),
                    onChanged: (v) => form.fee.set(double.tryParse(v) ?? 0),
                    keyboardType: TextInputType.number,
                    controller: TextEditingController(text: form.fee.value.toString()),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'قیمت فروش',errorText: form.buyFee.error),
                    onChanged: (v) => form.buyFee.set(double.tryParse(v) ?? 0.0),
                    keyboardType: TextInputType.number,
                    controller: TextEditingController(text: form.buyFee.value.toString()),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('لغو'),
            ),
            Consumer<ProductFormController>(
              builder: (context, form, _) => TextButton(
                onPressed: () async {
                  try {
                    final product = form.buildProduct(now: DateTime.now());
                    await dialogContext.read<ProductRepository>().save(product, formMode);
                    // print("saved product:\n$product");
                    // بستن دیالوگ
                    Navigator.pop(dialogContext);

                    // refresh لیست محصولات
                    _loadProducts();

                    // نمایش پیام موفقیت
                    ScaffoldMessenger.of(mainContext).showSnackBar(
                      const SnackBar(
                        content: Text('عملیات با موفقیت انجام شد'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  } on Exception catch (e) {
                    ScaffoldMessenger.of(mainContext).showSnackBar(
                      SnackBar(content: Text('خطا: ${e.toString()}')),
                    );
                  }
                },
                child: Text(product == null ? 'افزودن' : 'ویرایش'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('کالاها')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showEntityDialog(), // ✅ اصلاح شده
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<List<Product>>(
        stream: context.read<ProductRepository>().watchAll(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('خطا: ${snapshot.error}'));
          }

          final items = snapshot.data ?? [];
          if (items.isEmpty) {
            return const Center(child: Text('کالایی یافت نشد'));
          }

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final product = items[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: ListTile(
                  title: Text(product.code),
                  subtitle: Text(product.descF),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () => _showEntityDialog(product: product), // ✅ اصلاح شده
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () async {
                          final confirmed = await showDialog<bool>(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('تأیید حذف'),
                              content: const Text('آیا از حذف این محصول مطمئن هستید؟'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context, false),
                                  child: const Text('خیر'),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context, true),
                                  child: const Text('بله'),
                                ),
                              ],
                            ),
                          );

                          if (confirmed == true) {
                            await context.read<ProductRepository>().softDelete(product);
                            _loadProducts();
                          }
                        },
                      ),
                    ],
                  ),
                  onTap: () => _showEntityDialog(product: product), // ✅ اصلاح شده
                ),
              );
            },
          );
        },
      ),
    );
  }
}