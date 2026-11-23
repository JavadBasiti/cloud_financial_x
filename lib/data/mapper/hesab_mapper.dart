import 'package:drift/drift.dart';
import 'package:cloud_financial_x/domain/hesab.dart';
import 'package:cloud_financial_x/data/drift/app_database.dart' as drift_db;

/// Mapper برای تبدیل بین لایه Data و Domain برای Hesab
class HesabMapper {
  /// تبدیل رکورد Drift به Hesab Domain
  static Hesab toDomain(drift_db.Hesab r) => Hesab(
    id: r.id,
    level: r.level,
    parentId: r.parentId,
    code: r.code,
    name: r.name,
    balance: r.balance,
    fuPrice: r.fuPrice,
    nameEn: r.nameEn,
    createdAt: r.createdAt,
    updatedAt: r.updatedAt ?? r.createdAt,
    version: r.version,
    isDeleted: r.isDeleted,
    deletedAt: r.deletedAt,
  );

  /// تبدیل Hesab Domain به Companion برای درج
  static drift_db.HesabsCompanion toInsert(Hesab h) {
    final now = DateTime.now().millisecondsSinceEpoch;

    return drift_db.HesabsCompanion.insert(
      id: h.id,
      level: h.level,
      parentId: Value(h.parentId),
      code: h.code,
      name: h.name,
      balance: Value(h.balance),
      fuPrice: Value(h.fuPrice),
      nameEn: h.nameEn,
      createdAt: Value(now),
      updatedAt: Value(now),
      version: const Value(1),
    );
  }

  /// تبدیل Hesab Domain به Companion برای به‌روزرسانی
  static drift_db.HesabsCompanion toUpdate(Hesab h) {
    final now = DateTime.now().millisecondsSinceEpoch;

    return drift_db.HesabsCompanion(
      id: Value(h.id),
      level: Value(h.level),
      parentId: Value(h.parentId),
      code: Value(h.code),
      name: Value(h.name),
      balance: Value(h.balance),
      fuPrice: Value(h.fuPrice),
      nameEn: Value(h.nameEn),
      updatedAt: Value(now),
      version: Value(h.version),
    );
  }
}
