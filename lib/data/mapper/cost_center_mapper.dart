import 'package:drift/drift.dart';
import '../../domain/cost_center.dart';
import '../drift/app_database.dart' as drift_db;

/// Mapper برای تبدیل بین لایه Data و Domain برای CostCenter
class CostCenterMapper {
  /// تبدیل رکورد Drift به CostCenter Domain
  static CostCenter toDomain(drift_db.CostCenter r) => CostCenter(
    id: r.id,
    code: r.code,
    name: r.name,
    description: r.description,
    isActive: r.isActive,
    type: r.type,
    currencyCode: r.currencyCode,
    budget: r.budget,
    createdAt: r.createdAt,
    updatedAt: r.updatedAt ?? r.createdAt,
    version: r.version,
    isDeleted: r.isDeleted,
    deletedAt: r.deletedAt,
  );

  /// تبدیل CostCenter Domain به Companion برای درج
  static drift_db.CostCentersCompanion toInsert(CostCenter cc) {
    final now = DateTime.now().millisecondsSinceEpoch;

    return drift_db.CostCentersCompanion.insert(
      id: cc.id,
      code: cc.code,
      name: cc.name,
      description: Value(cc.description),
      isActive: Value(cc.isActive),
      type: cc.type,
      currencyCode: Value(cc.currencyCode),
      budget: Value(cc.budget),
      createdAt: now,
      updatedAt: Value(now),
      version: const Value(1),
    );
  }

  /// تبدیل CostCenter Domain به Companion برای به‌روزرسانی
  static drift_db.CostCentersCompanion toUpdate(CostCenter cc) {
    final now = DateTime.now().millisecondsSinceEpoch;

    return drift_db.CostCentersCompanion(
      id: Value(cc.id),
      code: Value(cc.code),
      name: Value(cc.name),
      description: Value(cc.description),
      isActive: Value(cc.isActive),
      type: Value(cc.type),
      currencyCode: Value(cc.currencyCode),
      budget: Value(cc.budget),
      updatedAt: Value(now),
      version: Value(cc.version),
    );
  }
}
