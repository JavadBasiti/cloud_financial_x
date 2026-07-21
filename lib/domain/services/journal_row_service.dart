import 'package:cloud_financial_x/domain/journal_row.dart';
import 'package:cloud_financial_x/ui/common/form_mod.dart';

abstract interface class JournalRowRepositoryContract {
  Stream<List<JournalRow>> watchAll();
  Future<void> save(JournalRow journalRow, FormMode mode);
  Future<void> softDelete(JournalRow journalRow);
}

class JournalRowService {
  final JournalRowRepositoryContract repository;

  JournalRowService(this.repository);

  Stream<List<JournalRow>> watchJournalRows() => repository.watchAll();

  Future<void> saveJournalRow(JournalRow journalRow, FormMode mode, {required DateTime now}) async {
    final prepared = _prepareForPersist(journalRow, mode, now);
    await repository.save(prepared, mode);
  }

  Future<void> deleteJournalRow(JournalRow journalRow, {required DateTime now}) async {
    final deleted = journalRow.copyWith(
      updatedAt: now.millisecondsSinceEpoch,
      version: journalRow.version + 1,
      isDeleted: true,
      deletedAt: now.millisecondsSinceEpoch,
    );
    await repository.softDelete(deleted);
  }

  JournalRow _prepareForPersist(JournalRow journalRow, FormMode mode, DateTime now) {
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
