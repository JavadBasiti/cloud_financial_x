import 'package:drift/drift.dart';
import '../../domain/journal_row.dart';
import '../drift/app_database.dart' as drift_db;

/// Mapper برای تبدیل بین لایه Data و Domain برای JournalRow
class JournalRowMapper {
  /// تبدیل رکورد Drift به JournalRow Domain
  static JournalRow toDomain(drift_db.JournalRow r) => JournalRow(
    id: r.id,
    date: r.date,
    noSnd: r.noSnd,
    rowF: r.rowF,
    hesabId: r.hesabId,
    prBest: r.prBest,
    prBed: r.prBed,
    media: r.media,
    descRow: r.descRow,
    currencyCode: r.currencyCode,
    costCenterId: r.constCenterId,
    isAuto: r.isAuto,
    journalId: r.journalId,
    createdAt: r.createdAt,
    updatedAt: r.updatedAt ?? r.createdAt,
    version: r.version,
    isDeleted: r.isDeleted,
    deletedAt: r.deletedAt,
  );

  /// تبدیل JournalRow Domain به Companion برای درج
  static drift_db.JournalRowsCompanion toInsert(JournalRow jr) {
    final now = DateTime.now().millisecondsSinceEpoch;
    return drift_db.JournalRowsCompanion.insert(
      id: jr.id,
      date: jr.date,
      noSnd: jr.noSnd,
      rowF: jr.rowF,
      hesabId: jr.hesabId,
      prBest: Value(jr.prBest),
      prBed: Value(jr.prBed),
      media: Value(jr.media),
      descRow: jr.descRow,
      currencyCode: Value(jr.currencyCode),
      constCenterId: jr.costCenterId,
      isAuto: Value(jr.isAuto),
      journalId: jr.journalId,
      createdAt: now,
      updatedAt: Value(now),
      version: const Value(1),
    );
  }

  /// تبدیل JournalRow Domain به Companion برای به‌روزرسانی
  static drift_db.JournalRowsCompanion toUpdate(JournalRow jr) {
    final now = DateTime.now().millisecondsSinceEpoch;
    return drift_db.JournalRowsCompanion(
      id: Value(jr.id),
      date: Value(jr.date),
      noSnd: Value(jr.noSnd),
      rowF: Value(jr.rowF),
      hesabId: Value(jr.hesabId),
      prBest: Value(jr.prBest),
      prBed: Value(jr.prBed),
      media: Value(jr.media),
      descRow: Value(jr.descRow),
      currencyCode: Value(jr.currencyCode),
      constCenterId: Value(jr.costCenterId),
      isAuto: Value(jr.isAuto),
      journalId: Value(jr.journalId),
      updatedAt: Value(now),
      version: Value(jr.version),
    );
  }
}
