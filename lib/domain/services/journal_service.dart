import 'package:cloud_financial_x/domain/journal.dart';
import 'package:cloud_financial_x/domain/journal_row.dart';
import 'package:cloud_financial_x/ui/common/form_mod.dart';

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
}

class JournalService {
  final JournalRepositoryContract repository;

  JournalService(this.repository);

  Stream<List<Journal>> watchJournals() => repository.watchAll();

  Future<void> saveJournal(Journal journal, FormMode mode, {required DateTime now}) async {
    final prepared = _prepareForPersist(journal, mode, now);
    await repository.save(prepared, mode);
  }

  Future<void> deleteJournal(Journal journal, {required DateTime now}) async {
    final deleted = journal.copyWith(
      updatedAt: now.millisecondsSinceEpoch,
      version: journal.version + 1,
      isDeleted: true,
      deletedAt: now.millisecondsSinceEpoch,
    );
    await repository.softDelete(deleted);
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
