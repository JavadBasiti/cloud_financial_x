import 'package:flutter/foundation.dart';
import '../../domain/journal_row.dart';
import '../form/form_field.dart';
import '../form/validator.dart';
import 'package:uuid/uuid.dart';

/// کنترلر فرم برای مدیریت ردیف سند (JournalRow)
/// 
/// مسئولیت‌های این کلاس:
/// - نگه‌داری وضعیت فیلدهای فرم
/// - اعتبار‌سنجی تمام فیلدها
/// - تبدیل داده‌های فرم به JournalRow domain object
class JournalRowFormController extends ChangeNotifier {
  final _uuid = const Uuid();

  JournalRow? _journalRow;

  /// دسترسی به ردیف موجود
  JournalRow? get journalRow => _journalRow;

  /// فیلدهای فرم
  late final Map<String, FormField<dynamic>> _fields;

  /// Constructor که ردیف اختیاری را می‌گیرد
  JournalRowFormController({JournalRow? journalRow}) {
    _journalRow = journalRow;
    _initializeFields();
  }

  /// مقدارد‌هی اولیه فیلدها
  void _initializeFields() {
    _fields = {
      'noSnd': FormField<int>(
        value: _journalRow?.noSnd ?? 0,
        validators: [Validators.positive()],
      ),
      'rowF': FormField<int>(
        value: _journalRow?.rowF ?? 0,
        validators: [Validators.positive()],
      ),
      'hesabId': FormField<String>(
        value: _journalRow?.hesabId ?? '',
        validators: [Validators.required()],
      ),
      'prBest': FormField<double>(
        value: _journalRow?.prBest ?? 0.0,
        validators: [Validators.nonNegative()],
      ),
      'descRow': FormField<String>(
        value: _journalRow?.descRow ?? '',
        validators: [],
      ),
      'currencyCode': FormField<String>(
        value: _journalRow?.currencyCode ?? 'IRR',
        validators: [Validators.required()],
      ),
      'costCenterId': FormField<String>(
        value: _journalRow?.costCenterId ?? '',
        validators: [Validators.required()],
      ),
      'isAuto': FormField<bool>(
        value: _journalRow?.isAuto ?? false,
        validators: [],
      ),
      'journalId': FormField<String>(
        value: _journalRow?.journalId ?? '',
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
  FormField<int> get rowF => getField<int>('rowF');
  FormField<String> get hesabId => getField<String>('hesabId');
  FormField<double> get prBest => getField<double>('prBest');
  FormField<String> get descRow => getField<String>('descRow');
  FormField<String> get currencyCode => getField<String>('currencyCode');
  FormField<String> get costCenterId => getField<String>('costCenterId');
  FormField<bool> get isAuto => getField<bool>('isAuto');
  FormField<String> get journalId => getField<String>('journalId');

  /// اعتبار‌سنجی تمام فیلدها
  bool validateAll() {
    final ok = _fields.values.every((f) => f.validate());
    if (ok) {
      _updateJournalRow();
    }
    notifyListeners();
    return ok;
  }

  /// به‌روزرسانی ردیف با مقادیر جدید
  void _updateJournalRow() {
    _journalRow = JournalRow(
      id: _journalRow?.id ?? _uuid.v4(),
      date: _journalRow?.date ?? DateTime.now().millisecondsSinceEpoch,
      noSnd: getField<int>('noSnd').value,
      rowF: getField<int>('rowF').value,
      hesabId: getField<String>('hesabId').value.trim(),
      prBest: getField<double>('prBest').value,
      descRow: getField<String>('descRow').value.trim(),
      currencyCode: getField<String>('currencyCode').value,
      costCenterId: getField<String>('costCenterId').value.trim(),
      isAuto: getField<bool>('isAuto').value,
      journalId: getField<String>('journalId').value.trim(),
      createdAt: _journalRow?.createdAt ?? DateTime.now().millisecondsSinceEpoch,
      updatedAt: DateTime.now().millisecondsSinceEpoch,
      version: (_journalRow?.version ?? 0) + 1,
      isDeleted: false,
    );
  }

  /// ساخت JournalRow از فرم (بعد از تایید اعتبار)
  JournalRow buildJournalRow() {
    if (!validateAll()) {
      throw Exception('فرم نامعتبر است');
    }
    return _journalRow!;
  }

  /// ریست کردن فرم
  void reset() {
    _journalRow = null;
    _initializeFields();
    notifyListeners();
  }

  /// به‌روزرسانی ردیف
  void setJournalRow(JournalRow? journalRow) {
    _journalRow = journalRow;
    _initializeFields();
    notifyListeners();
  }
}
