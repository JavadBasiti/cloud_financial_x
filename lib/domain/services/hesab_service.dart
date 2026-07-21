import 'package:cloud_financial_x/domain/hesab.dart';
import 'package:cloud_financial_x/ui/common/form_mod.dart';

abstract interface class HesabRepositoryContract {
  Stream<List<Hesab>> watchAll();
  Future<void> save(Hesab hesab, FormMode mode);
  Future<void> softDelete(Hesab hesab);
}

class HesabService {
  final HesabRepositoryContract repository;

  HesabService(this.repository);

  Stream<List<Hesab>> watchHesabs() => repository.watchAll();

  Future<void> saveHesab(Hesab hesab, FormMode mode, {required DateTime now}) async {
    final prepared = _prepareForPersist(hesab, mode, now);
    await repository.save(prepared, mode);
  }

  Future<void> deleteHesab(Hesab hesab, {required DateTime now}) async {
    final deleted = hesab.copyWith(
      updatedAt: now.millisecondsSinceEpoch,
      version: hesab.version + 1,
      isDeleted: true,
      deletedAt: now.millisecondsSinceEpoch,
    );
    await repository.softDelete(deleted);
  }

  Hesab _prepareForPersist(Hesab hesab, FormMode mode, DateTime now) {
    final timestamp = now.millisecondsSinceEpoch;
    if (mode == FormMode.create) {
      return hesab.copyWith(
        createdAt: hesab.createdAt == 0 ? timestamp : hesab.createdAt,
        updatedAt: timestamp,
        version: hesab.version + 1,
        isDeleted: false,
      );
    }

    return hesab.copyWith(
      updatedAt: timestamp,
      version: hesab.version + 1,
      isDeleted: false,
    );
  }
}
