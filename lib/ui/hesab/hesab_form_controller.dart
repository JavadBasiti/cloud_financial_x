import 'package:flutter/foundation.dart';
import '../../domain/enums/account_level.dart';
import '../../domain/hesab.dart';
import '../form/form_field.dart';
import '../form/validator.dart';
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

  /// مقدارد‌هی اولیه فیلدها
  void _initializeFields() {
    _fields = {
      'levelF': FormField<int>(
        value: _hesab?.levelF.index ?? 0,
        validators: [Validators.positive()],
      ),
      'code': FormField<String>(
        value: _hesab?.code ?? '',
        validators: [Validators.required(), Validators.minLength(1)],
      ),
      'descF': FormField<String>(
        value: _hesab?.descF ?? '',
        validators: [Validators.required()],
      ),
      'crnPrice': FormField<double>(
        value: _hesab?.crnPrice ?? 0.0,
        validators: [Validators.nonNegative()],
      ),
      'fuPrice': FormField<double>(
        value: _hesab?.fuPrice ?? 0.0,
        validators: [Validators.nonNegative()],
      ),
      'exteraDesc': FormField<String>(
        value: _hesab?.exteraDesc ?? '',
        validators: [],
      ),
    };
  }

  /// دسترسی به فیلد به صورت generic
  FormField<T> getField<T>(String name) {
    return _fields[name]! as FormField<T>;
  }

  /// getterهای اختصاصی برای فیلدها
  FormField<int> get levelF => getField<int>('levelF');
  FormField<String> get code => getField<String>('code');

  FormField<String> get descF => getField<String>('descF');
  FormField<double> get crnPrice => getField<double>('crnPrice');
  FormField<double> get fuPrice => getField<double>('fuPrice');
  FormField<String> get exteraDesc => getField<String>('exteraDesc');

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
    final levelIndex = getField<int>('levelF').value;
    final level = AccountLevel.values[levelIndex];

    _hesab = Hesab(
      id: _hesab?.id ?? _uuid.v4(),
      levelF: level,
      code: getField<String>('code').value.trim(),
      descF: getField<String>('descF').value.trim(),
      crnPrice: getField<double>('crnPrice').value,
      fuPrice: getField<double>('fuPrice').value,
      exteraDesc: getField<String>('exteraDesc').value.trim(),
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
