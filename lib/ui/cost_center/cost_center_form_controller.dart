import 'package:flutter/foundation.dart';
import '../../domain/cost_center.dart';
import '../../domain/enums/cost_center_type.dart';
import '../form/form_field.dart';
import '../form/validator.dart';
import 'package:uuid/uuid.dart';

/// کنترلر فرم برای مدیریت مرکز هزینه (CostCenter)
/// 
/// مسئولیت‌های این کلاس:
/// - نگه‌داری وضعیت فیلدهای فرم
/// - اعتبار‌سنجی تمام فیلدها
/// - تبدیل داده‌های فرم به CostCenter domain object
class CostCenterFormController extends ChangeNotifier {
  final _uuid = const Uuid();

  CostCenter? _costCenter;

  /// دسترسی به مرکز موجود
  CostCenter? get costCenter => _costCenter;

  /// فیلدهای فرم
  late final Map<String, FormField<dynamic>> _fields;

  /// Constructor که مرکز اختیاری را می‌گیرد
  CostCenterFormController({CostCenter? costCenter}) {
    _costCenter = costCenter;
    _initializeFields();
  }

  /// مقدارد‌هی اولیه فیلدها
  void _initializeFields() {
    _fields = {
      'code': FormField<String>(
        value: _costCenter?.code ?? '',
        validators: [Validators.required(), Validators.minLength(1)],
      ),
      'name': FormField<String>(
        value: _costCenter?.name ?? '',
        validators: [Validators.required()],
      ),
      'description': FormField<String>(
        value: _costCenter?.description ?? '',
        validators: [],
      ),
      'isActive': FormField<bool>(
        value: _costCenter?.isActive ?? true,
        validators: [],
      ),
      'type': FormField<int>(
        value: _costCenter?.type.index ?? 0,
        validators: [],
      ),
      'currencyCode': FormField<String>(
        value: _costCenter?.currencyCode ?? '',
        validators: [],
      ),
      'budget': FormField<double>(
        value: _costCenter?.budget ?? 0.0,
        validators: [Validators.nonNegative()],
      ),
    };
  }

  /// دسترسی به فیلد به صورت generic
  FormField<T> getField<T>(String name) {
    return _fields[name]! as FormField<T>;
  }

  /// getterهای اختصاصی برای فیلدها
  FormField<String> get code => getField<String>('code');
  FormField<String> get name => getField<String>('name');
  FormField<String> get description => getField<String>('description');
  FormField<bool> get isActive => getField<bool>('isActive');
  FormField<int> get type => getField<int>('type');
  FormField<String> get currencyCode => getField<String>('currencyCode');
  FormField<double> get budget => getField<double>('budget');

  /// اعتبار‌سنجی تمام فیلدها
  bool validateAll() {
    final ok = _fields.values.every((f) => f.validate());
    if (ok) {
      _updateCostCenter();
    }
    notifyListeners();
    return ok;
  }

  /// به‌روزرسانی مرکز با مقادیر جدید
  void _updateCostCenter() {
    final typeIndex = getField<int>('type').value;
    final centerType = CostCenterType.values[typeIndex];

    _costCenter = CostCenter(
      id: _costCenter?.id ?? _uuid.v4(),
      code: getField<String>('code').value.trim(),
      name: getField<String>('name').value.trim(),
      description: getField<String>('description').value.trim(),
      isActive: getField<bool>('isActive').value,
      type: centerType,
      currencyCode: getField<String>('currencyCode').value.isEmpty 
        ? null 
        : getField<String>('currencyCode').value,
      budget: getField<double>('budget').value == 0 
        ? null 
        : getField<double>('budget').value,
      createdAt: _costCenter?.createdAt ?? DateTime.now().millisecondsSinceEpoch,
      updatedAt: DateTime.now().millisecondsSinceEpoch,
      version: (_costCenter?.version ?? 0) + 1,
      isDeleted: false,
    );
  }

  /// ساخت CostCenter از فرم (بعد از تایید اعتبار)
  CostCenter buildCostCenter() {
    if (!validateAll()) {
      throw Exception('فرم نامعتبر است');
    }
    return _costCenter!;
  }

  /// ریست کردن فرم
  void reset() {
    _costCenter = null;
    _initializeFields();
    notifyListeners();
  }

  /// به‌روزرسانی مرکز
  void setCostCenter(CostCenter? costCenter) {
    _costCenter = costCenter;
    _initializeFields();
    notifyListeners();
  }
}
