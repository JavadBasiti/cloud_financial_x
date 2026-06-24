import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' as mater;
import '../../domain/product.dart';
import '../form/form_field.dart';
import '../form/validator.dart';
import 'package:uuid/uuid.dart';

class ProductFormController extends ChangeNotifier {
  final _uuid = const Uuid();

  Product? _product;

  // می‌توانید به product دسترسی داشته باشید
  Product? get product => _product;

  // فیلدهای فرم را نگه می‌داریم
  late final Map<String, FormField<dynamic>> _fields;

  var controler =mater.TextEditingController();

  // constructor که product را می‌گیرد
  ProductFormController({Product? product}) {
    _product = product;
    _initializeFields();
  }

  void _initializeFields() {
    _fields = {
      'code': FormField<String>(
        value: _product?.code ?? '',
        validators: [Validators.required()],
      ),
      'descF': FormField<String>(
        value: _product?.descF ?? '',
        validators: [Validators.required()],
      ),
      'unit': FormField<String>(
        value: _product?.unit ?? '',
        validators: [Validators.required()],
      ),
      'fee': FormField<double>(
        value: _product?.fee ?? 0.0,
        validators: [Validators.nonNegative()],
      ),
      'buyFee': FormField<double>(
        value: _product?.buyFee ?? 0.0,
        validators: [Validators.nonNegative()],
      ),
    };
  }

  // دسترسی به فیلدها به صورت dynamic
  FormField<T> getField<T>(String name) {
    return _fields[name]! as FormField<T>;
  }

  // یا می‌توانید getterهای اختصاصی بسازید
  FormField<String> get code => getField<String>('code');
  FormField<String> get descF => getField<String>('descF');
  FormField<String> get unit => getField<String>('unit');
  FormField<double> get fee => getField<double>('fee');
  FormField<double> get buyFee => getField<double>('buyFee');

  bool validateAll() {
    final ok = _fields.values.every((f) => f.validate());
    // print("valiatedd:$ok");
    if (ok) {
      // به‌روزرسانی product با مقادیر جدید
      _updateProduct();
    }
    notifyListeners();
    return ok;
  }

  void _updateProduct() {
    _product = Product(
      id: _product?.id ?? _uuid.v4(),
      code: getField<String>('code').value.trim(),
      descF: getField<String>('descF').value.trim(),
      unit: getField<String>('unit').value.trim(),
      fee: getField<double>('fee').value,
      buyFee: getField<double>('buyFee').value,
      createdAt: _product?.createdAt ?? DateTime.now().millisecondsSinceEpoch,
      updatedAt: DateTime.now().millisecondsSinceEpoch,
      version: (_product?.version ?? 0) + 1,
      isDeleted: false,
    );
  }

  Product buildProduct({required DateTime now}) {
    if (!validateAll()) {
      throw Exception('فرم نامعتبر است');
    }

    return _product!;
  }

  void reset() {
    // for (var field in _fields.values) {
    //   field.value = field.defaultValue;
    // }
    _product = null;
    _initializeFields();
    notifyListeners();
  }

  // به‌روزرسانی product جدید
  void setProduct(Product? product) {
    _product = product;
    _initializeFields();
    notifyListeners();
  }
}