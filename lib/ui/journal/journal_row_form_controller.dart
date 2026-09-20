import 'package:flutter/foundation.dart';
import '../../domain/journal_row.dart';
import '../form/form_field.dart';
import '../form/validator.dart';
import 'package:uuid/uuid.dart';

/// سمت حسابداری ردیف سند (بدهکار / بستانکار)
enum JournalRowSide { debit, credit }

/// کنترلر فرم برای مدیریت ردیف سند (JournalRow)
///
/// مسئولیت‌های این کلاس:
/// - نگه‌داری وضعیت فیلدهای فرم (بر اساس فیلدهای واقعی JournalRow در لایه Domain)
/// - اعتبار‌سنجی تمام فیلدها (شامل قاعدهٔ «هر ردیف فقط بدهکار یا فقط بستانکار»)
/// - تبدیل داده‌های فرم به JournalRow domain object
///
/// اطلاعات سیاقی ردیف (journalId، noSnd، date و rowF) از سند والد گرفته می‌شود
/// تا ردیف همیشه با سند خود هماهنگ بماند.
class JournalRowFormController extends ChangeNotifier {
  final _uuid = const Uuid();

  JournalRow? _journalRow;

  /// شناسهٔ ردیف (پایدار در طول ویرایش)
  late String _rowId;

  /// سمت انتخاب‌شدهٔ ردیف
  late JournalRowSide _side;

  /// مبلغ ردیف (بر اساس سمت انتخاب‌شده روی prBed یا prBest می‌نشیند)
  late double _amount;

  /// خطای اعتبارسنجی مبلغ/سمت
  String? _amountError;

  /// دسترسی به ردیف موجود
  JournalRow? get journalRow => _journalRow;

  /// فیلدهای فرم
  late Map<String, FormField<dynamic>> _fields;

  /// Constructor که ردیف اختیاری و اطلاعات سند والد را می‌گیرد
  JournalRowFormController({
    JournalRow? journalRow,
    String? journalId,
    int? noSnd,
    DateTime? date,
    int? rowF,
    String? currencyCode,
  }) {
    _journalRow = journalRow;
    _initializeFields(
      journalId: journalId,
      noSnd: noSnd,
      date: date,
      rowF: rowF,
      currencyCode: currencyCode,
    );
  }

  /// مقدارد‌هی اولیه فیلدها
  void _initializeFields({
    String? journalId,
    int? noSnd,
    DateTime? date,
    int? rowF,
    String? currencyCode,
  }) {
    _rowId = _journalRow?.id ?? _uuid.v4();
    _amountError = null;

    final row = _journalRow;
    _side = (row != null && row.prBest > 0) ? JournalRowSide.credit : JournalRowSide.debit;
    _amount = row == null
        ? 0
        : (_side == JournalRowSide.credit ? row.prBest : row.prBed);

    _fields = {
      'date': FormField<DateTime>(
        value: date ??
            (row != null
                ? DateTime.fromMillisecondsSinceEpoch(row.date)
                : DateTime.now()),
        validators: [],
      ),
      'noSnd': FormField<int>(
        value: noSnd ?? row?.noSnd ?? 0,
        validators: [Validators.nonNegativeInt()],
      ),
      'rowF': FormField<int>(
        value: rowF ?? row?.rowF ?? 1,
        validators: [Validators.positive()],
      ),
      'hesabId': FormField<String>(
        value: row?.hesabId ?? '',
        validators: [Validators.required(message: 'انتخاب سرفصل الزامی است')],
      ),
      'prBest': FormField<double>(
        value: row?.prBest ?? 0.0,
        validators: [Validators.nonNegative()],
      ),
      'prBed': FormField<double>(
        value: row?.prBed ?? 0.0,
        validators: [Validators.nonNegative()],
      ),
      'media': FormField<String>(
        value: row?.media ?? '',
        validators: [],
      ),
      'descRow': FormField<String>(
        value: row?.descRow ?? '',
        validators: [Validators.maxLength(255)],
      ),
      'currencyCode': FormField<String>(
        value: row?.currencyCode ?? currencyCode ?? 'IRR',
        validators: [Validators.required()],
      ),
      // مرکز هزینه اختیاری است (در صورت خالی بودن، ردیف به مرکز هزینه‌ای وصل نمی‌شود)
      'costCenterId': FormField<String>(
        value: row?.costCenterId ?? '',
        validators: [],
      ),
      'isAuto': FormField<bool>(
        value: row?.isAuto ?? false,
        validators: [],
      ),
      'journalId': FormField<String>(
        value: journalId ?? row?.journalId ?? '',
        validators: [Validators.required(message: 'سند مرجع مشخص نیست')],
      ),
    };
  }

  /// دسترسی به فیلد به صورت generic
  FormField<T> getField<T>(String name) {
    return _fields[name]! as FormField<T>;
  }

  /// getterهای اختصاصی برای فیلدها
  FormField<DateTime> get date => getField<DateTime>('date');
  FormField<int> get noSnd => getField<int>('noSnd');
  FormField<int> get rowF => getField<int>('rowF');
  FormField<String> get hesabId => getField<String>('hesabId');
  FormField<double> get prBest => getField<double>('prBest');
  FormField<double> get prBed => getField<double>('prBed');
  FormField<String> get media => getField<String>('media');
  FormField<String> get descRow => getField<String>('descRow');
  FormField<String> get currencyCode => getField<String>('currencyCode');
  FormField<String> get costCenterId => getField<String>('costCenterId');
  FormField<bool> get isAuto => getField<bool>('isAuto');
  FormField<String> get journalId => getField<String>('journalId');

  /// سمت ردیف (بدهکار/بستانکار)
  JournalRowSide get side => _side;

  /// مبلغ ردیف
  double get amount => _amount;

  /// خطای مربوط به مبلغ/سمت
  String? get amountError => _amountError;

  /// --- setterهای کمکی برای UI ---

  void setSide(JournalRowSide value) {
    _side = value;
    _applyAmount();
    notifyListeners();
  }

  void setAmount(double value) {
    _amount = value;
    _applyAmount();
    notifyListeners();
  }

  void setHesabId(String value) {
    hesabId.set(value);
    notifyListeners();
  }

  void setCostCenterId(String value) {
    costCenterId.set(value);
    notifyListeners();
  }

  void setDescRow(String value) {
    descRow.set(value);
    notifyListeners();
  }

  void setMedia(String value) {
    media.set(value);
    notifyListeners();
  }

  void setCurrencyCode(String value) {
    currencyCode.set(value);
    notifyListeners();
  }

  void setIsAuto(bool value) {
    isAuto.set(value);
    notifyListeners();
  }

  /// به‌روزرسانی اطلاعات سیاقی ردیف از سند والد
  void applyJournalContext({
    required String journalId,
    required int noSnd,
    required DateTime date,
    required int rowF,
  }) {
    this.journalId.set(journalId);
    this.noSnd.set(noSnd);
    this.date.set(date);
    this.rowF.set(rowF);
    notifyListeners();
  }

  /// انتقال مبلغ به فیلد درست (بدهکار یا بستانکار)
  void _applyAmount() {
    if (_side == JournalRowSide.debit) {
      prBed.set(_amount);
      prBest.set(0);
    } else {
      prBest.set(_amount);
      prBed.set(0);
    }
  }

  /// قاعدهٔ حسابداری دوبل: هر ردیف یا بدهکار است یا بستانکار (نه هر دو، نه هیچ‌کدام)
  String? _validateAmount() {
    if (prBed.value <= 0 && prBest.value <= 0) {
      return 'مبلغ ردیف باید بزرگتر از صفر باشد';
    }
    if (prBed.value > 0 && prBest.value > 0) {
      return 'هر ردیف فقط می‌تواند بدهکار یا بستانکار باشد';
    }
    return null;
  }

  /// اعتبار‌سنجی تمام فیلدها
  bool validateAll({DateTime? now}) {
    _applyAmount();
    var ok = _fields.values.every((f) => f.validate());
    _amountError = _validateAmount();
    if (_amountError != null) ok = false;

    if (ok) {
      _updateJournalRow(now ?? DateTime.now());
    }
    notifyListeners();
    return ok;
  }

  /// به‌روزرسانی ردیف با مقادیر جدید
  void _updateJournalRow(DateTime now) {
    final timestamp = now.millisecondsSinceEpoch;

    _journalRow = JournalRow(
      id: _rowId,
      date: getField<DateTime>('date').value.millisecondsSinceEpoch,
      noSnd: getField<int>('noSnd').value,
      rowF: getField<int>('rowF').value,
      hesabId: getField<String>('hesabId').value.trim(),
      prBest: getField<double>('prBest').value,
      prBed: getField<double>('prBed').value,
      media: getField<String>('media').value.trim(),
      descRow: getField<String>('descRow').value.trim(),
      currencyCode: getField<String>('currencyCode').value,
      costCenterId: getField<String>('costCenterId').value.trim(),
      isAuto: getField<bool>('isAuto').value,
      journalId: getField<String>('journalId').value.trim(),
      createdAt: _journalRow?.createdAt ?? timestamp,
      updatedAt: timestamp,
      version: _journalRow?.version ?? 0,
      isDeleted: false,
      deletedAt: null,
    );
  }

  /// ساخت JournalRow از فرم (بعد از تایید اعتبار)
  JournalRow buildJournalRow({required DateTime now}) {
    if (!validateAll(now: now)) {
      throw Exception(_amountError ?? 'فرم ردیف سند نامعتبر است');
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
