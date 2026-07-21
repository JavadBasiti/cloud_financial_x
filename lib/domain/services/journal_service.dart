import 'package:cloud_financial_x/domain/journal.dart';
import 'package:cloud_financial_x/ui/common/form_mod.dart';

abstract interface class JournalRepositoryContract {
  Stream<List<Journal>> watchAll();
  Future<void> save(Journal journal, FormMode mode);
  Future<void> softDelete(Journal journal);
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
}
