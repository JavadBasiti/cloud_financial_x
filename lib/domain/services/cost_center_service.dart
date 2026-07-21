import 'package:cloud_financial_x/domain/cost_center.dart';
import 'package:cloud_financial_x/ui/common/form_mod.dart';

abstract interface class CostCenterRepositoryContract {
  Stream<List<CostCenter>> watchAll();
  Future<void> save(CostCenter costCenter, FormMode mode);
  Future<void> softDelete(CostCenter costCenter);
}

class CostCenterService {
  final CostCenterRepositoryContract repository;

  CostCenterService(this.repository);

  Stream<List<CostCenter>> watchCostCenters() => repository.watchAll();

  Future<void> saveCostCenter(CostCenter costCenter, FormMode mode, {required DateTime now}) async {
    final prepared = _prepareForPersist(costCenter, mode, now);
    await repository.save(prepared, mode);
  }

  Future<void> deleteCostCenter(CostCenter costCenter, {required DateTime now}) async {
    final deleted = costCenter.copyWith(
      updatedAt: now.millisecondsSinceEpoch,
      version: costCenter.version + 1,
      isDeleted: true,
      deletedAt: now.millisecondsSinceEpoch,
    );
    await repository.softDelete(deleted);
  }

  CostCenter _prepareForPersist(CostCenter costCenter, FormMode mode, DateTime now) {
    final timestamp = now.millisecondsSinceEpoch;
    if (mode == FormMode.create) {
      return costCenter.copyWith(
        createdAt: costCenter.createdAt == 0 ? timestamp : costCenter.createdAt,
        updatedAt: timestamp,
        version: costCenter.version + 1,
        isDeleted: false,
      );
    }

    return costCenter.copyWith(
      updatedAt: timestamp,
      version: costCenter.version + 1,
      isDeleted: false,
    );
  }
}
