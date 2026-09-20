import 'package:flutter/foundation.dart';
import '../../domain/journal.dart';
import '../form/form_field.dart';
import '../form/validator.dart';
import 'package:uuid/uuid.dart';

/// کنترلر فرم برای مدیریت سند حسابداری (Journal)
///
/// مسئولیت‌های این کلاس:
/// - نگه‌داری وضعیت فیلدهای فرم (بر اساس فیلدهای واقعی آبجکت Journal در لایه Domain)
/// - اعتبار‌سنجی تمام فیلدها
/// - تبدیل داده‌های فرم به Journal domain object
///
/// نکته: شناسهٔ سند (journalId) به محض ساخته شدن کنترلر تولید می‌شود تا ردیف‌های
/// سند (JournalRow) بتوانند حتی پیش از ذخیرهٔ سند به آن ارجاع دهند.
class JournalFormController extends ChangeNotifier {
  final _uuid = const Uuid();

  Journal? _journal;

  /// شناسهٔ سند در حال ویرایش/ایجاد
  late String _journalId;

  /// دسترسی به سند موجود
  Journal? get journal => _journal;

  /// شناسهٔ سند (برای اتصال ردیف‌ها پیش از ذخیره)
  String get journalId => _journalId;

  /// فیلدهای فرم
  late Map<String, FormField<dynamic>> _fields;

  /// Constructor که سند اختیاری را می‌گیرد
  JournalFormController({Journal? journal}) {
    _journal = journal;
    _initializeFields();
  }

  /// مقدارد‌هی اولیه فیلدها
  void _initializeFields() {
    _journalId = _journal?.id ?? _uuid.v4();

    _fields = {
      // شماره مرجع سند؛ صفر یعنی «به صورت خودکار تعیین شود»
      'referenceNumber': FormField<int>(
        value: _journal?.referenceNumber ?? 0,
        validators: [Validators.nonNegativeInt()],
      ),
      'date': FormField<DateTime>(
        value: _journal?.date != null
            ? DateTime.fromMillisecondsSinceEpoch(_journal!.date)
            : DateTime.now(),
        validators: [],
      ),
      'description': FormField<String>(
        value: _journal?.description ?? '',
        validators: [Validators.required(), Validators.maxLength(400)],
      ),
      'isAuto': FormField<bool>(
        value: _journal?.isAuto ?? false,
        validators: [],
      ),
      'currencyCode': FormField<String>(
        value: _journal?.currencyCode ?? 'IRR',
        validators: [Validators.required()],
      ),
      'signed': FormField<bool>(
        value: _journal?.signed ?? false,
        validators: [],
      ),
    };
  }

  /// دسترسی به فیلد به صورت generic
  FormField<T> getField<T>(String name) {
    return _fields[name]! as FormField<T>;
  }

  /// getterهای اختصاصی برای فیلدها
  FormField<int> get referenceNumber => getField<int>('referenceNumber');
  FormField<DateTime> get date => getField<DateTime>('date');
  FormField<String> get description => getField<String>('description');
  FormField<bool> get isAuto => getField<bool>('isAuto');
  FormField<String> get currencyCode => getField<String>('currencyCode');
  FormField<bool> get signed => getField<bool>('signed');

  /// --- setterهای کمکی برای UI (با اطلاع‌رسانی تغییر) ---

  void setReferenceNumber(int value) {
    referenceNumber.set(value);
    notifyListeners();
  }

  void setDate(DateTime value) {
    date.set(DateTime(value.year, value.month, value.day));
    notifyListeners();
  }

  void setDescription(String value) {
    description.set(value);
    notifyListeners();
  }

  void setIsAuto(bool value) {
    isAuto.set(value);
    notifyListeners();
  }

  void setCurrencyCode(String value) {
    currencyCode.set(value);
    notifyListeners();
  }

  void setSigned(bool value) {
    signed.set(value);
    notifyListeners();
  }

  /// اعتبار‌سنجی تمام فیلدها
  bool validateAll({DateTime? now}) {
    final ok = _fields.values.every((f) => f.validate());
    if (ok) {
      _updateJournal(now ?? DateTime.now());
    }
    notifyListeners();
    return ok;
  }

  /// به‌روزرسانی سند با مقادیر جدید
  void _updateJournal(DateTime now) {
    final timestamp = now.millisecondsSinceEpoch;
    final refNumber = getField<int>('referenceNumber').value;

    _journal = Journal(
      id: _journalId,
      referenceNumber: refNumber == 0 ? null : refNumber,
      date: getField<DateTime>('date').value.millisecondsSinceEpoch,
      description: getField<String>('description').value.trim(),
      isAuto: getField<bool>('isAuto').value,
      currencyCode: getField<String>('currencyCode').value,
      signed: getField<bool>('signed').value,
      createdAt: _journal?.createdAt ?? timestamp,
      updatedAt: timestamp,
      version: _journal?.version ?? 0,
      isDeleted: false,
      deletedAt: null,
    );
  }

  /// ساخت Journal از فرم (بعد از تایید اعتبار)
  Journal buildJournal({required DateTime now}) {
    if (!validateAll(now: now)) {
      throw Exception('فرم سند نامعتبر است');
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
