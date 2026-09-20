import 'package:cloud_financial_x/domain/journal.dart';
import 'package:cloud_financial_x/domain/journal_row.dart';
import 'package:cloud_financial_x/domain/services/journal_service.dart';
import 'package:cloud_financial_x/ui/common/form_mod.dart';
import 'package:flutter_test/flutter_test.dart';

/// پیاده‌سازی ساختگی Repository برای تست منطق دامنه
class FakeJournalStore implements JournalRepositoryContract {
  final List<JournalRow> rows = [];

  Journal? savedJournal;
  FormMode? savedMode;
  Journal? deletedJournal;

  List<JournalRow> insertedRows = [];
  List<JournalRow> updatedRows = [];
  List<JournalRow> deletedRows = [];

  int referenceNumber = 100;

  @override
  Stream<List<Journal>> watchAll() => Stream.value(const []);

  @override
  Future<void> save(Journal journal, FormMode mode) async {
    savedJournal = journal;
    savedMode = mode;
  }

  @override
  Future<void> softDelete(Journal journal) async {
    deletedJournal = journal;
  }

  @override
  Stream<List<JournalRow>> watchJournalRows() => Stream.value(rows);

  @override
  Stream<List<JournalRow>> watchJournalRowsByJournalId(String journalId) =>
      Stream.value(rows.where((r) => r.journalId == journalId).toList());

  @override
  Stream<List<JournalRow>> watchJournalRowsByNoSnd(int noSnd) =>
      Stream.value(rows.where((r) => r.noSnd == noSnd).toList());

  @override
  Future<List<JournalRow>> getJournalRowsByJournalId(String journalId) async =>
      rows.where((r) => r.journalId == journalId).toList();

  @override
  Future<List<JournalRow>> getJournalRowsByNoSnd(int noSnd) async =>
      rows.where((r) => r.noSnd == noSnd).toList();

  @override
  Future<void> saveJournalRow(JournalRow journalRow, FormMode mode) async {
    rows.add(journalRow);
  }

  @override
  Future<void> deleteJournalRow(JournalRow journalRow) async {
    rows.removeWhere((r) => r.id == journalRow.id);
  }

  @override
  Future<void> saveJournalWithRows({
    required Journal journal,
    required FormMode mode,
    required List<JournalRow> insertedRows,
    required List<JournalRow> updatedRows,
    required List<JournalRow> deletedRows,
  }) async {
    savedJournal = journal;
    savedMode = mode;
    this.insertedRows = insertedRows;
    this.updatedRows = updatedRows;
    this.deletedRows = deletedRows;
  }

  @override
  Future<void> softDeleteWithRows(Journal journal, List<JournalRow> rows) async {
    deletedJournal = journal;
    deletedRows = rows;
  }

  @override
  Future<int> nextReferenceNumber() async => referenceNumber;
}

Journal buildJournal({
  String id = 'journal-1',
  int? referenceNumber,
  String description = 'سند تست',
  String currencyCode = 'IRR',
  int version = 1,
}) {
  return Journal(
    id: id,
    referenceNumber: referenceNumber,
    date: 1700000000000,
    description: description,
    currencyCode: currencyCode,
    createdAt: 1700000000000,
    updatedAt: 1700000000000,
    version: version,
    isDeleted: false,
  );
}

JournalRow buildRow({
  required String id,
  double debit = 0,
  double credit = 0,
  String hesabId = 'hesab-1',
  String journalId = 'journal-1',
  String currencyCode = 'IRR',
  int rowF = 1,
}) {
  return JournalRow(
    id: id,
    date: 1700000000000,
    noSnd: 0,
    rowF: rowF,
    hesabId: hesabId,
    prBed: debit,
    prBest: credit,
    descRow: '',
    currencyCode: currencyCode,
    costCenterId: '',
    journalId: journalId,
    createdAt: 1700000000000,
    updatedAt: 1700000000000,
    version: 1,
    isDeleted: false,
  );
}

void main() {
  group('JournalService - تراز و اعتبارسنجی', () {
    final service = JournalService(FakeJournalStore());

    test('جمع بدهکار و بستانکار را درست محاسبه می‌کند', () {
      final balance = service.calculateBalance([
        buildRow(id: 'r1', debit: 1000),
        buildRow(id: 'r2', credit: 400),
        buildRow(id: 'r3', credit: 600),
      ]);

      expect(balance.totalDebit, 1000);
      expect(balance.totalCredit, 1000);
      expect(balance.isBalanced, isTrue);
      expect(balance.total, 1000);
    });

    test('سند نامتوازن را رد می‌کند', () {
      final errors = service.validateJournal(buildJournal(), [
        buildRow(id: 'r1', debit: 1000),
        buildRow(id: 'r2', credit: 900),
      ]);

      expect(errors, isNotEmpty);
      expect(errors.any((e) => e.contains('متوازن')), isTrue);
    });

    test('سند با کمتر از دو ردیف مجاز نیست', () {
      final errors = service.validateJournal(buildJournal(), [
        buildRow(id: 'r1', debit: 1000),
      ]);

      expect(errors.any((e) => e.contains('دو ردیف')), isTrue);
    });

    test('ردیف با بدهکار و بستانکار هم‌زمان مجاز نیست', () {
      final errors = service.validateJournal(buildJournal(), [
        buildRow(id: 'r1', debit: 1000, credit: 1000),
        buildRow(id: 'r2', credit: 1000),
      ]);

      expect(errors.any((e) => e.contains('بدهکار یا بستانکار')), isTrue);
    });

    test('ناسازگاری ارز ردیف با سند شناسایی می‌شود', () {
      final errors = service.validateJournal(buildJournal(), [
        buildRow(id: 'r1', debit: 1000, currencyCode: 'USD'),
        buildRow(id: 'r2', credit: 1000),
      ]);

      expect(errors.any((e) => e.contains('ارز')), isTrue);
    });
  });

  group('JournalService - ذخیره سند به همراه ردیف‌ها', () {
    test('شماره سند خودکار و شماره ردیف‌ها تخصیص داده می‌شود', () async {
      final store = FakeJournalStore()..referenceNumber = 42;
      final service = JournalService(store);

      await service.saveJournalWithRows(
        journal: buildJournal(version: 0),
        rows: [
          buildRow(id: 'r1', debit: 1000),
          buildRow(id: 'r2', credit: 1000),
        ],
        mode: FormMode.create,
        now: DateTime.fromMillisecondsSinceEpoch(1700000005000),
      );

      expect(store.savedMode, FormMode.create);
      expect(store.savedJournal!.referenceNumber, 42);
      expect(store.savedJournal!.version, 1);
      expect(store.insertedRows.length, 2);
      expect(store.insertedRows[0].rowF, 1);
      expect(store.insertedRows[1].rowF, 2);
      expect(store.insertedRows.every((r) => r.noSnd == 42), isTrue);
      expect(store.insertedRows.every((r) => r.journalId == 'journal-1'), isTrue);
      expect(store.deletedRows, isEmpty);
    });

    test('در حالت ویرایش، ردیف حذف‌شده به‌صورت نرم حذف می‌شود', () async {
      final store = FakeJournalStore();
      store.rows.addAll([
        buildRow(id: 'r1', debit: 1000),
        buildRow(id: 'r2', credit: 1000, rowF: 2),
      ]);
      final service = JournalService(store);

      await service.saveJournalWithRows(
        journal: buildJournal(referenceNumber: 7),
        rows: [
          buildRow(id: 'r1', debit: 500),
          buildRow(id: 'r3', credit: 500),
        ],
        mode: FormMode.edit,
        now: DateTime.fromMillisecondsSinceEpoch(1700000005000),
      );

      expect(store.updatedRows.map((r) => r.id), ['r1']);
      expect(store.insertedRows.map((r) => r.id), ['r3']);
      expect(store.deletedRows.map((r) => r.id), ['r2']);
      expect(store.deletedRows.first.isDeleted, isTrue);
    });

    test('سند نامعتبر ذخیره نمی‌شود', () async {
      final store = FakeJournalStore();
      final service = JournalService(store);

      expect(
        () => service.saveJournalWithRows(
          journal: buildJournal(),
          rows: [buildRow(id: 'r1', debit: 1000)],
          mode: FormMode.create,
          now: DateTime.fromMillisecondsSinceEpoch(1700000005000),
        ),
        throwsA(isA<JournalValidationException>()),
      );
    });
  });

  group('JournalService - حذف سند', () {
    test('حذف سند، ردیف‌های آن را نیز حذف نرم می‌کند', () async {
      final store = FakeJournalStore();
      store.rows.addAll([
        buildRow(id: 'r1', debit: 1000),
        buildRow(id: 'r2', credit: 1000, rowF: 2),
      ]);
      final service = JournalService(store);

      await service.deleteJournal(
        buildJournal(),
        now: DateTime.fromMillisecondsSinceEpoch(1700000009000),
      );

      expect(store.deletedJournal!.isDeleted, isTrue);
      expect(store.deletedJournal!.deletedAt, 1700000009000);
      expect(store.deletedRows.length, 2);
      expect(store.deletedRows.every((r) => r.isDeleted), isTrue);
    });
  });
}
