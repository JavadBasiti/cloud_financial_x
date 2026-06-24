import 'package:flutter/foundation.dart';
import '../../domain/journal.dart';
import '../form/form_field.dart';
import '../form/validator.dart';
import 'package:uuid/uuid.dart';

/// کنترلر فرم برای مدیریت سند حسابداری (Journal)
/// 
/// مسئولیت‌های این کلاس:
/// - نگه‌داری وضعیت فیلدهای فرم
/// - اعتبار‌سنجی تمام فیلدها
/// - تبدیل داده‌های فرم به Journal domain object
class JournalFormController extends ChangeNotifier {
  final _uuid = const Uuid();

  Journal? _journal;

  /// دسترسی به سند موجود
  Journal? get journal => _journal;

  /// فیلدهای فرم
  late final Map<String, FormField<dynamic>> _fields;

  /// Constructor که سند اختیاری را می‌گیرد
  JournalFormController({Journal? journal}) {
    _journal = journal;
    _initializeFields();
  }

  /// مقدارد‌هی اولیه فیلدها
  void _initializeFields() {
    _fields = {
      // 'noSnd': FormField<int>(
      //   value: _journal?.noSnd ?? 0,
      //   validators: [Validators.positive()],
      // ),
      'referenceNumber': FormField<int>(
        value: _journal?.referenceNumber ?? 0,
        validators: [],
      ),
      'date': FormField<DateTime>(
        value: _journal?.date != null 
          ? DateTime.fromMillisecondsSinceEpoch(_journal!.date)
          : DateTime.now(),
        validators: [],
      ),
      'description': FormField<String>(
        value: _journal?.description ?? '',
        validators: [],
      ),
      'isAuto': FormField<bool>(
        value: _journal?.isAuto ?? false,
        validators: [],
      ),
      'currencyCode': FormField<String>(
        value: _journal?.currencyCode ?? 'IRR',
        validators: [Validators.required()],
      ),
    };
  }

  /// دسترسی به فیلد به صورت generic
  FormField<T> getField<T>(String name) {
    return _fields[name]! as FormField<T>;
  }

  /// getterهای اختصاصی برای فیلدها
  FormField<int> get noSnd => getField<int>('noSnd');
  FormField<int> get referenceNumber => getField<int>('referenceNumber');
  FormField<DateTime> get date => getField<DateTime>('date');
  FormField<String> get description => getField<String>('description');
  FormField<bool> get isAuto => getField<bool>('isAuto');
  FormField<String> get currencyCode => getField<String>('currencyCode');

  /// اعتبار‌سنجی تمام فیلدها
  bool validateAll() {
    final ok = _fields.values.every((f) => f.validate());
    if (ok) {
      _updateJournal();
    }
    notifyListeners();
    return ok;
  }

  /// به‌روزرسانی سند با مقادیر جدید
  void _updateJournal() {
    _journal = Journal(
      id: _journal?.id ?? _uuid.v4(),
      // noSnd: getField<int>('noSnd').value,**deleted**
      referenceNumber: getField<int>('referenceNumber').value == 0 
        ? null 
        : getField<int>('referenceNumber').value,
      date: getField<DateTime>('date').value.millisecondsSinceEpoch,
      description: getField<String>('description').value.trim(),
      isAuto: getField<bool>('isAuto').value,
      currencyCode: getField<String>('currencyCode').value,
      createdAt: _journal?.createdAt ?? DateTime.now().millisecondsSinceEpoch,
      updatedAt: DateTime.now().millisecondsSinceEpoch,
      version: (_journal?.version ?? 0) + 1,
      isDeleted: false,
    );
  }

  /// ساخت Journal از فرم (بعد از تایید اعتبار)
  Journal buildJournal() {
    if (!validateAll()) {
      throw Exception('فرم نامعتبر است');
    }
    return _journal!;
  }

  /// ریست کردن فرم
  void reset() {
    _journal = null;
    _initializeFields();
    notifyListeners();
  }

  /// به‌روزرسانی سند
  void setJournal(Journal? journal) {
    _journal = journal;
    _initializeFields();
    notifyListeners();
  }
}
