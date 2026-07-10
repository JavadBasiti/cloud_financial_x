import 'package:drift/drift.dart';
import 'package:cloud_financial_x/domain/hesab.dart';
import 'package:cloud_financial_x/data/drift/app_database.dart' as drift_db;

/// Mapper برای تبدیل بین لایه Data و Domain برای Hesab
class HesabMapper {
  /// تبدیل رکورد Drift به Hesab Domain
  static Hesab toDomain(drift_db.Hesab r) => Hesab(
    id: r.id,
    levelF: r.levelF,
    code: r.code,
    descF: r.descF,
    crnPrice: r.crnPrice,
    fuPrice: r.fuPrice,
    exteraDesc: r.exteraDesc,
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
      levelF: h.levelF,
      code: h.code,
      descF: h.descF,
      crnPrice: Value(h.crnPrice),
      fuPrice: Value(h.fuPrice),
      exteraDesc: h.exteraDesc,
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
      levelF: Value(h.levelF),
      code: Value(h.code),
      descF: Value(h.descF),
      crnPrice: Value(h.crnPrice),
      fuPrice: Value(h.fuPrice),
      exteraDesc: Value(h.exteraDesc),
      updatedAt: Value(now),
      version: Value(h.version),
    );
  }
}
