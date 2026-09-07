import 'package:cloud_financial_x/domain/journal.dart';
import 'package:cloud_financial_x/domain/journal_row.dart';
import 'package:cloud_financial_x/ui/common/form_mod.dart';

/// قرارداد لایه داده برای سند حسابداری و ردیف‌های آن
abstract interface class JournalRepositoryContract {
  Stream<List<Journal>> watchAll();
  Future<void> save(Journal journal, FormMode mode);
  Future<void> softDelete(Journal journal);

  Stream<List<JournalRow>> watchJournalRows();
  Stream<List<JournalRow>> watchJournalRowsByJournalId(String journalId);
  Stream<List<JournalRow>> watchJournalRowsByNoSnd(int noSnd);

  Future<List<JournalRow>> getJournalRowsByJournalId(String journalId);
  Future<List<JournalRow>> getJournalRowsByNoSnd(int noSnd);

  Future<void> saveJournalRow(JournalRow journalRow, FormMode mode);
  Future<void> deleteJournalRow(JournalRow journalRow);

  /// ذخیرهٔ اتمی سند به همراه ردیف‌های آن (درج/به‌روزرسانی/حذف نرم) در یک تراکنش
  Future<void> saveJournalWithRows({
    required Journal journal,
    required FormMode mode,
    required List<JournalRow> insertedRows,
    required List<JournalRow> updatedRows,
    required List<JournalRow> deletedRows,
  });

  /// حذف نرم سند به همراه تمام ردیف‌های آن در یک تراکنش
  Future<void> softDeleteWithRows(Journal journal, List<JournalRow> rows);

  /// شماره مرجع بعدی برای سند جدید
  Future<int> nextReferenceNumber();
}

/// تراز سند (جمع بدهکار/بستانکار و اختلاف آنها)
class JournalBalance {
  final double totalDebit;
  final double totalCredit;

  const JournalBalance({required this.totalDebit, required this.totalCredit});

  static const JournalBalance zero =
      JournalBalance(totalDebit: 0, totalCredit: 0);

  /// اختلاف بدهکار و بستانکار
  double get difference => totalDebit - totalCredit;

  /// آیا سند متوازن است؟ (با تلورانس گِرد کردن)
  bool get isBalanced => difference.abs() < 0.005;

  /// مبلغ کل سند (در حالت متوازن برابر جمع بدهکار)
  double get total => totalDebit >= totalCredit ? totalDebit : totalCredit;
}

/// خطای اعتبارسنجی سند (قواعد حسابداری دوبل)
class JournalValidationException implements Exception {
  final List<String> errors;

  const JournalValidationException(this.errors);

  String get message => errors.join('\n');

  @override
  String toString() => message;
}

/// سرویس دامنه برای سند حسابداری (Journal) و ردیف‌های آن (JournalRow)
///
/// مسئولیت‌ها:
/// - آماده‌سازی موجودیت‌ها پیش از ماندگاری (timestamp/version/soft delete)
/// - اعمال قواعد حسابداری دوبل (توازن بدهکار و بستانکار)
/// - هماهنگ‌سازی ردیف‌ها با سند والد (شماره سند، تاریخ، شماره ردیف)
class JournalService {
  final JournalRepositoryContract repository;

  JournalService(this.repository);

  Stream<List<Journal>> watchJournals() => repository.watchAll();

  Future<void> saveJournal(Journal journal, FormMode mode, {required DateTime now}) async {
    final prepared = _prepareForPersist(journal, mode, now);
    await repository.save(prepared, mode);
  }

  /// حذف نرم سند به همراه تمام ردیف‌های آن
  Future<void> deleteJournal(Journal journal, {required DateTime now}) async {
    final timestamp = now.millisecondsSinceEpoch;

    final deleted = journal.copyWith(
      updatedAt: timestamp,
      version: journal.version + 1,
      isDeleted: true,
      deletedAt: timestamp,
    );

    final rows = await repository.getJournalRowsByJournalId(journal.id);
    final deletedRows = rows
        .map((row) => row.copyWith(
              updatedAt: timestamp,
              version: row.version + 1,
              isDeleted: true,
              deletedAt: timestamp,
            ))
        .toList();

    await repository.softDeleteWithRows(deleted, deletedRows);
  }

  /// امضا/لغو امضای سند
  ///
  /// سند امضاشده قابل ویرایش نیست؛ برای اصلاح باید ابتدا امضا برداشته شود.
  Future<void> setSigned(Journal journal, bool signed, {required DateTime now}) async {
    final prepared = _prepareForPersist(
      journal.copyWith(signed: signed),
      FormMode.edit,
      now,
    );
    await repository.save(prepared, FormMode.edit);
  }

  Stream<List<JournalRow>> watchJournalRows() => repository.watchJournalRows();

  Stream<List<JournalRow>> watchJournalRowsByJournalId(String journalId) =>
      repository.watchJournalRowsByJournalId(journalId);

  Stream<List<JournalRow>> watchJournalRowsByNoSnd(int noSnd) =>
      repository.watchJournalRowsByNoSnd(noSnd);

  Future<List<JournalRow>> getJournalRowsByJournalId(String journalId) =>
      repository.getJournalRowsByJournalId(journalId);

  Future<List<JournalRow>> getJournalRowsByNoSnd(int noSnd) =>
      repository.getJournalRowsByNoSnd(noSnd);

  Future<void> saveJournalRow(JournalRow journalRow, FormMode mode, {required DateTime now}) async {
    final prepared = _prepareJournalRowForPersist(journalRow, mode, now);
    await repository.saveJournalRow(prepared, mode);
  }

  Future<void> deleteJournalRow(JournalRow journalRow, {required DateTime now}) async {
    final deleted = journalRow.copyWith(
      updatedAt: now.millisecondsSinceEpoch,
      version: journalRow.version + 1,
      isDeleted: true,
      deletedAt: now.millisecondsSinceEpoch,
    );
    await repository.deleteJournalRow(deleted);
  }

  /// شماره مرجع پیشنهادی برای سند جدید
  Future<int> nextReferenceNumber() => repository.nextReferenceNumber();

  /// محاسبهٔ تراز سند بر اساس ردیف‌های آن
  JournalBalance calculateBalance(Iterable<JournalRow> rows) {
    var debit = 0.0;
    var credit = 0.0;
    for (final row in rows) {
      if (row.isDeleted) continue;
      debit += row.prBed;
      credit += row.prBest;
    }
    return JournalBalance(totalDebit: debit, totalCredit: credit);
  }

  /// اعتبارسنجی قواعد حسابداری دوبل برای سند و ردیف‌های آن
  List<String> validateJournal(Journal journal, List<JournalRow> rows) {
    final errors = <String>[];

    if (journal.description.trim().isEmpty) {
      errors.add('شرح سند الزامی است');
    }

    if (rows.length < 2) {
      errors.add('سند حسابداری باید حداقل دو ردیف داشته باشد');
    }

    for (var i = 0; i < rows.length; i++) {
      final row = rows[i];
      final label = 'ردیف ${i + 1}';

      if (row.hesabId.trim().isEmpty) {
        errors.add('$label: سرفصل حساب انتخاب نشده است');
      }
      if (row.prBed < 0 || row.prBest < 0) {
        errors.add('$label: مبلغ نمی‌تواند منفی باشد');
      }
      if (row.prBed > 0 && row.prBest > 0) {
        errors.add('$label: هر ردیف فقط می‌تواند بدهکار یا بستانکار باشد');
      }
      if (row.prBed <= 0 && row.prBest <= 0) {
        errors.add('$label: مبلغ ردیف باید بزرگتر از صفر باشد');
      }
      if (row.currencyCode != journal.currencyCode) {
        errors.add('$label: ارز ردیف با ارز سند یکسان نیست');
      }
    }

    final balance = calculateBalance(rows);
    if (rows.isNotEmpty && balance.total <= 0) {
      errors.add('جمع مبالغ سند نمی‌تواند صفر باشد');
    }
    if (!balance.isBalanced) {
      errors.add(
        'سند متوازن نیست؛ اختلاف بدهکار و بستانکار: '
        '${balance.difference.abs().toStringAsFixed(2)}',
      );
    }

    return errors;
  }

  /// ذخیرهٔ کامل یک سند به همراه ردیف‌های آن (Create/Update) به صورت اتمی
  ///
  /// مراحل:
  /// 1. اعتبارسنجی قواعد حسابداری دوبل
  /// 2. تخصیص شمارهٔ مرجع در صورت نیاز
  /// 3. هماهنگ‌سازی ردیف‌ها با سند (journalId، noSnd، date، rowF، ارز)
  /// 4. تفکیک ردیف‌های جدید/ویرایش‌شده/حذف‌شده
  /// 5. تحویل به Repository برای ذخیره در یک تراکنش
  Future<Journal> saveJournalWithRows({
    required Journal journal,
    required List<JournalRow> rows,
    required FormMode mode,
    required DateTime now,
  }) async {
    final errors = validateJournal(journal, rows);
    if (errors.isNotEmpty) {
      throw JournalValidationException(errors);
    }

    final referenceNumber = (journal.referenceNumber == null || journal.referenceNumber == 0)
        ? await repository.nextReferenceNumber()
        : journal.referenceNumber!;

    final preparedJournal = _prepareForPersist(
      journal.copyWith(referenceNumber: referenceNumber),
      mode,
      now,
    );

    final existingRows = mode == FormMode.create
        ? const <JournalRow>[]
        : await repository.getJournalRowsByJournalId(journal.id);
    final existingIds = existingRows.map((r) => r.id).toSet();
    final keptIds = rows.map((r) => r.id).toSet();

    final insertedRows = <JournalRow>[];
    final updatedRows = <JournalRow>[];

    for (var i = 0; i < rows.length; i++) {
      final rowMode = existingIds.contains(rows[i].id) ? FormMode.edit : FormMode.create;
      final normalized = _syncRowWithJournal(rows[i], preparedJournal, i + 1);
      final prepared = _prepareJournalRowForPersist(normalized, rowMode, now);

      if (rowMode == FormMode.create) {
        insertedRows.add(prepared);
      } else {
        updatedRows.add(prepared);
      }
    }

    final timestamp = now.millisecondsSinceEpoch;
    final deletedRows = existingRows
        .where((row) => !keptIds.contains(row.id))
        .map((row) => row.copyWith(
              updatedAt: timestamp,
              version: row.version + 1,
              isDeleted: true,
              deletedAt: timestamp,
            ))
        .toList();

    await repository.saveJournalWithRows(
      journal: preparedJournal,
      mode: mode,
      insertedRows: insertedRows,
      updatedRows: updatedRows,
      deletedRows: deletedRows,
    );

    return preparedJournal;
  }

  /// هماهنگ‌سازی ردیف با سند والد
  JournalRow _syncRowWithJournal(JournalRow row, Journal journal, int rowNumber) {
    return row.copyWith(
      journalId: journal.id,
      noSnd: journal.referenceNumber ?? 0,
      date: journal.date,
      rowF: rowNumber,
      currencyCode: row.currencyCode.isEmpty ? journal.currencyCode : row.currencyCode,
      isAuto: journal.isAuto ? true : row.isAuto,
    );
  }

  Journal _prepareForPersist(Journal journal, FormMode mode, DateTime now) {
    final timestamp = now.millisecondsSinceEpoch;
    if (mode == FormMode.create) {
      return journal.copyWith(
        createdAt: journal.createdAt == 0 ? timestamp : journal.createdAt,
        updatedAt: timestamp,
        version: journal.version + 1,
        isDeleted: false,
      );
    }

    return journal.copyWith(
      updatedAt: timestamp,
      version: journal.version + 1,
      isDeleted: false,
    );
  }

  JournalRow _prepareJournalRowForPersist(JournalRow journalRow, FormMode mode, DateTime now) {
    final timestamp = now.millisecondsSinceEpoch;
    if (mode == FormMode.create) {
      return journalRow.copyWith(
        createdAt: journalRow.createdAt == 0 ? timestamp : journalRow.createdAt,
        updatedAt: timestamp,
        version: journalRow.version + 1,
        isDeleted: false,
      );
    }

    return journalRow.copyWith(
      updatedAt: timestamp,
      version: journalRow.version + 1,
      isDeleted: false,
    );
  }
}
