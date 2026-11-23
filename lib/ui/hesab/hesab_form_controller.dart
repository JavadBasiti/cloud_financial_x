import 'package:flutter/foundation.dart';
import 'package:cloud_financial_x/domain/enums/account_level.dart';
import 'package:cloud_financial_x/domain/hesab.dart';
import 'package:cloud_financial_x/ui/form/form_field.dart';
import 'package:cloud_financial_x/ui/form/validator.dart';
import 'package:uuid/uuid.dart';

/// کنترلر فرم برای مدیریت سرفصل (Hesab)
///
/// مسئولیت‌های این کلاس:
/// - نگه‌داری وضعیت فیلدهای فرم
/// - اعتبار‌سنجی تمام فیلدها
/// - تبدیل داده‌های فرم به Hesab domain object
class HesabFormController extends ChangeNotifier {
  final _uuid = const Uuid();

  Hesab? _hesab;

  /// دسترسی به سرفصل موجود
  Hesab? get hesab => _hesab;

  /// فیلدهای فرم
  late final Map<String, FormField<dynamic>> _fields;

  /// Constructor که سرفصل اختیاری را می‌گیرد
  HesabFormController({Hesab? hesab}) {
    _hesab = hesab;
    _initializeFields();
  }

  /// مقداردهی اولیه فیلدها
  void _initializeFields() {
    _fields = {
      'level': FormField<int>(
        value: _hesab?.level.index ?? AccountLevel.level1.index,
        validators: [Validators.positive()],
      ),
      'parentId': FormField<String>(
        value: _hesab?.parentId ?? '',
        validators: [],
      ),
      'code': FormField<String>(
        value: _hesab?.code ?? '',
        validators: [Validators.required(), Validators.minLength(1)],
      ),
      'name': FormField<String>(
        value: _hesab?.name ?? '',
        validators: [Validators.required()],
      ),
      'balance': FormField<double>(
        value: _hesab?.balance ?? 0.0,
        validators: [Validators.nonNegative()],
      ),
      'fuPrice': FormField<double>(
        value: _hesab?.fuPrice ?? 0.0,
        validators: [Validators.nonNegative()],
      ),
      'nameEn': FormField<String>(
        value: _hesab?.nameEn ?? '',
        validators: [],
      ),
    };
  }

  /// دسترسی به فیلد به صورت generic
  FormField<T> getField<T>(String name) {
    return _fields[name]! as FormField<T>;
  }

  /// getterهای اختصاصی برای فیلدها
  FormField<int> get level => getField<int>('level');

  FormField<String> get parentId => getField<String>('parentId');

  FormField<String> get code => getField<String>('code');

  FormField<String> get name => getField<String>('name');

  FormField<double> get balance => getField<double>('balance');

  FormField<double> get fuPrice => getField<double>('fuPrice');

  FormField<String> get nameEn => getField<String>('nameEn');

  /// اعتبار‌سنجی تمام فیلدها
  bool validateAll() {
    final ok = _fields.values.every((f) => f.validate());
    if (ok) {
      _updateHesab();
    }
    notifyListeners();
    return ok;
  }

  /// به‌روزرسانی سرفصل با مقادیر جدید
  void _updateHesab() {
    final levelIndex = getField<int>('level').value;
    final level = AccountLevel.values[levelIndex];

    _hesab = Hesab(
      id: _hesab?.id ?? _uuid.v4(),
      level: level,
      parentId: getField<String>('parentId').value.trim().isEmpty
          ? null
          : getField<String>('parentId').value.trim(),
      code: getField<String>('code').value.trim(),
      name: getField<String>('name').value.trim(),
      balance: getField<double>('balance').value,
      fuPrice: getField<double>('fuPrice').value,
      nameEn: getField<String>('nameEn').value.trim(),
      createdAt: _hesab?.createdAt ?? DateTime.now().millisecondsSinceEpoch,
      updatedAt: DateTime.now().millisecondsSinceEpoch,
      version: (_hesab?.version ?? 0) + 1,
      isDeleted: false,
    );
  }

  /// ساخت Hesab از فرم (بعد از تایید اعتبار)
  Hesab buildHesab({required DateTime now}) {
    if (!validateAll()) {
      throw Exception('فرم نامعتبر است');
    }
    return _hesab!;
  }

  /// ریست کردن فرم
  void reset() {
    _hesab = null;
    _initializeFields();
    notifyListeners();
  }

  /// به‌روزرسانی سرفصل
  void setHesab(Hesab? hesab) {
    _hesab = hesab;
    _initializeFields();
    notifyListeners();
  }
}
