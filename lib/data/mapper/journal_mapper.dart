import 'package:drift/drift.dart';
import '../../domain/journal.dart';
import '../drift/app_database.dart' as drift_db;

/// Mapper برای تبدیل بین لایه Data و Domain برای Journal
class JournalMapper {
  /// تبدیل رکورد Drift به Journal Domain
  static Journal toDomain(drift_db.Journal r) => Journal(
    id: r.id,
    // noSnd: r.noSnd,
    referenceNumber: r.referenceNumber,
    date: r.date,
    description: r.description,
    isAuto: r.isAuto,
    currencyCode: r.currencyCode,
    signed: r.signed,
    createdAt: r.createdAt,
    updatedAt: r.updatedAt ?? r.createdAt,
    version: r.version,
    isDeleted: r.isDeleted,
    deletedAt: r.deletedAt,
  );

  /// تبدیل Journal Domain به Companion برای درج
  static drift_db.JournalsCompanion toInsert(Journal j) {
    final now = DateTime.now().millisecondsSinceEpoch;
    return drift_db.JournalsCompanion.insert(
      id: j.id,
      // noSnd: const Value.absent(), // auto-increment
      referenceNumber: Value(j.referenceNumber),
      date: j.date,
      description: j.description,
      isAuto: Value(j.isAuto),
      currencyCode: Value(j.currencyCode),
      signed: Value(j.signed),
      createdAt: now,
      updatedAt: Value(now),
      version: const Value(1),
    );
  }

  /// تبدیل Journal Domain به Companion برای به‌روزرسانی
  static drift_db.JournalsCompanion toUpdate(Journal j) {
    final now = DateTime.now().millisecondsSinceEpoch;
    return drift_db.JournalsCompanion(
      id: Value(j.id),
      referenceNumber: Value(j.referenceNumber),
      date: Value(j.date),
      description: Value(j.description),
      isAuto: Value(j.isAuto),
      currencyCode: Value(j.currencyCode),
      signed: Value(j.signed),
      updatedAt: Value(now),
      version: Value(j.version),
    );
  }
}
