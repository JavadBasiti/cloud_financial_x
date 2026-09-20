import 'package:cloud_financial_x/domain/journal.dart';
import 'package:cloud_financial_x/domain/journal_row.dart';
import 'package:cloud_financial_x/domain/sync_queue_record.dart';
import 'package:drift/drift.dart';
import '../../ui/common/form_mod.dart';
import '../drift/app_database.dart' as drift_db;
import '../mapper/journal_mapper.dart';
import '../mapper/journal_row_mapper.dart';
import '../../domain/services/journal_service.dart';
import 'sync_queue_repository.dart';

/// Repository برای مدیریت Journal و JournalRow
///
/// مسئولیت‌های معماری:
/// - هماهنگی تراکنش‌های سطح Repository
/// - اطمینان از جفت شدن mutations با sync_queue enqueues
/// - بسته‌بندی mutations در db.transaction() برای اتمی بودن
/// - تفویض منطق دامنه به لایهٔ Domain
///
/// الگوی تراکنش:
/// تمام عملیات نوشتن (insert، update، softDelete) این الگو را دنبال می‌کنند:
/// 1. اجرای منطق Business در domain layer (بیرون تراکنش)
/// 2. شروع تراکنش
/// 3. ماندگاری تغییر entity
/// 4. صف‌بندی sync_queue مربوطه
/// 5. Commit یا rollback اتمی
class JournalRepository implements JournalRepositoryContract {
  final drift_db.AppDatabase db;
  final SyncQueueRepository syncQueueRepo;

  JournalRepository(this.db, {SyncQueueRepository? syncQueueRepo})
      : syncQueueRepo = syncQueueRepo ?? SyncQueueRepository(db);

  /// مشاهدهٔ تمام اسناد فعال به صورت stream
  /// 
  /// رفتار جریان واکنش‌پذیر که هر زمان پایگاه‌داده تغییر می‌کند، لیستی از اسناد فعال را ارسال می‌کند.
  @override
  Stream<List<Journal>> watchAll() {
    final query = (db.select(db.journals)..where((tbl) => tbl.isDeleted.equals(false)));
    return query.watch().map((rows) {
      return rows.map(JournalMapper.toDomain).toList();
    });
  }

  /// مشاهدهٔ سند بر اساس شناسه
  Stream<Journal?> watchById(String id) {
    final query = (db.select(db.journals)
      ..where((tbl) => tbl.id.equals(id) & tbl.isDeleted.equals(false)));
    return query.watchSingleOrNull().map((row) {
      return row != null ? JournalMapper.toDomain(row) : null;
    });
  }

  /// مشاهدهٔ سند بر اساس شماره سند
  Stream<Journal?> watchByReferenceNumber(int rn) {
    final query = (db.select(db.journals)
      ..where((tbl) => tbl.referenceNumber.equals(rn) & tbl.isDeleted.equals(false)));
    return query.watchSingleOrNull().map((row) {
      return row != null ? JournalMapper.toDomain(row) : null;
    });
  }

  /// درج (ایجاد) یا به‌روزرسانی سند در تراکنش
  @override
  Future<void> save(Journal journal, FormMode mode) async {
    await db.transaction(() async {
      if (mode == FormMode.create) {
        await db.into(db.journals).insert(JournalMapper.toInsert(journal));
        await syncQueueRepo.enqueue(journal, SyncOperation.insert);
      } else {
        await (db.update(db.journals)
          ..where((t) => t.id.equals(journal.id)))
            .write(JournalMapper.toUpdate(journal));
        await syncQueueRepo.enqueue(journal, SyncOperation.update);
      }
    });
  }

  /// حذف نرم سند با علامت‌زنی به عنوان حذف‌شده
  ///
  /// این روش:
  /// 1. منطق domain را اعمال می‌کند (تحقق و افزایش نسخه)
  /// 2. تراکنش را آغاز می‌کند
  /// 3. سند را با isDeleted=true و deletedAt timestamp به‌روزرسانی می‌کند
  /// 4. یک رکورد DELETE سنک را صف‌بندی می‌کند
  /// 5. اتمی commit می‌شود
  ///
  /// سند از پایگاه‌داده حذف نمی‌شود، فقط به عنوان حذف‌شده علامت‌گذاری می‌شود.
  @override
  Future<void> softDelete(Journal journal) async {
    final now = DateTime.now().millisecondsSinceEpoch;
    
    await db.transaction(() async {
      await (db.update(db.journals)
          ..where((tbl) => tbl.id.equals(journal.id)))
          .write(
        drift_db.JournalsCompanion(
          isDeleted: const Value(true),
          deletedAt: Value(now),
          updatedAt: Value(now),
          version: Value(journal.version + 1),
        ),
      );
      
      await syncQueueRepo.enqueue(journal, SyncOperation.delete);
    });
  }

  /// مشاهدهٔ تمام ردیفهای فعال سند به صورت stream
  @override
  Stream<List<JournalRow>> watchJournalRows() {
    final query = (db.select(db.journalRows)..where((tbl) => tbl.isDeleted.equals(false)));
    return query.watch().map((rows) {
      return rows.map(JournalRowMapper.toDomain).toList();
    });
  }

  /// مشاهدهٔ ردیفهای یک سند
  @override
  Stream<List<JournalRow>> watchJournalRowsByJournalId(String journalId) {
    final query = (db.select(db.journalRows)
      ..where((tbl) => tbl.journalId.equals(journalId) & tbl.isDeleted.equals(false))
      ..orderBy([(tbl) => OrderingTerm(expression: tbl.rowF)]));
    return query.watch().map((rows) {
      return rows.map(JournalRowMapper.toDomain).toList();
    });
  }

  /// مشاهدهٔ ردیفهای یک سند بر اساس شماره سند
  @override
  Stream<List<JournalRow>> watchJournalRowsByNoSnd(int noSnd) {
    final query = (db.select(db.journalRows)
      ..where((tbl) => tbl.noSnd.equals(noSnd) & tbl.isDeleted.equals(false))
      ..orderBy([(tbl) => OrderingTerm(expression: tbl.rowF)]));
    return query.watch().map((rows) {
      return rows.map(JournalRowMapper.toDomain).toList();
    });
  }

  /// درج (ایجاد) یا به‌روزرسانی ردیف سند در تراکنش
  @override
  Future<void> saveJournalRow(JournalRow journalRow, FormMode mode) async {
    await db.transaction(() async {
      if (mode == FormMode.create) {
        await db.into(db.journalRows).insert(JournalRowMapper.toInsert(journalRow));
        await syncQueueRepo.enqueue(journalRow, SyncOperation.insert);
      } else {
        await (db.update(db.journalRows)
          ..where((t) => t.id.equals(journalRow.id)))
            .write(JournalRowMapper.toUpdate(journalRow));
        await syncQueueRepo.enqueue(journalRow, SyncOperation.update);
      }
    });
  }

  /// حذف نرم ردیف سند با علامت‌گذاری به عنوان حذف‌شده
  @override
  Future<void> deleteJournalRow(JournalRow journalRow) async {
    final now = DateTime.now().millisecondsSinceEpoch;

    await db.transaction(() async {
      await (db.update(db.journalRows)
          ..where((tbl) => tbl.id.equals(journalRow.id)))
          .write(
        drift_db.JournalRowsCompanion(
          isDeleted: const Value(true),
          deletedAt: Value(now),
          updatedAt: Value(now),
          version: Value(journalRow.version + 1),
        ),
      );

      await syncQueueRepo.enqueue(journalRow, SyncOperation.delete);
    });
  }

  /// ذخیرهٔ اتمی سند به همراه ردیف‌های آن
  ///
  /// تمام تغییرات (سند، ردیف‌های جدید، ردیف‌های ویرایش‌شده و ردیف‌های حذف‌شده)
  /// در یک تراکنش انجام می‌شوند و برای هر تغییر یک رکورد در sync_queue ثبت می‌شود.
  /// در صورت خطا کل عملیات rollback می‌شود و سند نیمه‌کاره باقی نمی‌ماند.
  @override
  Future<void> saveJournalWithRows({
    required Journal journal,
    required FormMode mode,
    required List<JournalRow> insertedRows,
    required List<JournalRow> updatedRows,
    required List<JournalRow> deletedRows,
  }) async {
    await db.transaction(() async {
      if (mode == FormMode.create) {
        await db.into(db.journals).insert(JournalMapper.toInsert(journal));
        await syncQueueRepo.enqueue(journal, SyncOperation.insert);
      } else {
        await (db.update(db.journals)..where((t) => t.id.equals(journal.id)))
            .write(JournalMapper.toUpdate(journal));
        await syncQueueRepo.enqueue(journal, SyncOperation.update);
      }

      for (final row in insertedRows) {
        await db.into(db.journalRows).insert(JournalRowMapper.toInsert(row));
        await syncQueueRepo.enqueue(row, SyncOperation.insert);
      }

      for (final row in updatedRows) {
        await (db.update(db.journalRows)..where((t) => t.id.equals(row.id)))
            .write(JournalRowMapper.toUpdate(row));
        await syncQueueRepo.enqueue(row, SyncOperation.update);
      }

      for (final row in deletedRows) {
        await (db.update(db.journalRows)..where((t) => t.id.equals(row.id)))
            .write(
          drift_db.JournalRowsCompanion(
            isDeleted: const Value(true),
            deletedAt: Value(row.deletedAt),
            updatedAt: Value(row.updatedAt),
            version: Value(row.version),
          ),
        );
        await syncQueueRepo.enqueue(row, SyncOperation.delete);
      }
    });
  }

  /// حذف نرم سند به همراه تمام ردیف‌های آن در یک تراکنش
  @override
  Future<void> softDeleteWithRows(Journal journal, List<JournalRow> rows) async {
    await db.transaction(() async {
      await (db.update(db.journals)..where((tbl) => tbl.id.equals(journal.id)))
          .write(
        drift_db.JournalsCompanion(
          isDeleted: const Value(true),
          deletedAt: Value(journal.deletedAt),
          updatedAt: Value(journal.updatedAt),
          version: Value(journal.version),
        ),
      );
      await syncQueueRepo.enqueue(journal, SyncOperation.delete);

      for (final row in rows) {
        await (db.update(db.journalRows)..where((tbl) => tbl.id.equals(row.id)))
            .write(
          drift_db.JournalRowsCompanion(
            isDeleted: const Value(true),
            deletedAt: Value(row.deletedAt),
            updatedAt: Value(row.updatedAt),
            version: Value(row.version),
          ),
        );
        await syncQueueRepo.enqueue(row, SyncOperation.delete);
      }
    });
  }

  /// شماره مرجع بعدی سند (بر اساس بیشترین شمارهٔ موجود)
  ///
  /// در معماری local-first شماره سند به صورت محلی تخصیص می‌یابد و در زمان
  /// همگام‌سازی می‌تواند توسط سرور بازنویسی شود.
  @override
  Future<int> nextReferenceNumber() async {
    final maxExpression = db.journals.referenceNumber.max();
    final query = db.selectOnly(db.journals)..addColumns([maxExpression]);
    final row = await query.getSingleOrNull();
    final current = row?.read(maxExpression) ?? 0;
    return current + 1;
  }

  /// دسترسی یکبار خواند برای تمام اسناد فعال
  Future<List<Journal>> getAllActive() async {
    final rows = await (db.select(db.journals)
      ..where((tbl) => tbl.isDeleted.equals(false)))
        .get();
    return rows.map(JournalMapper.toDomain).toList();
  }

  /// دسترسی یکبار خواند برای ردیفهای یک سند
  @override
  Future<List<JournalRow>> getJournalRowsByJournalId(String journalId) async {
    final rows = await (db.select(db.journalRows)
      ..where((tbl) => tbl.journalId.equals(journalId) & tbl.isDeleted.equals(false))
      ..orderBy([(tbl) => OrderingTerm(expression: tbl.rowF)]))
        .get();
    return rows.map(JournalRowMapper.toDomain).toList();
  }

  /// دسترسی یکبار خواند برای ردیفهای یک سند بر اساس شماره سند
  @override
  Future<List<JournalRow>> getJournalRowsByNoSnd(int noSnd) async {
    final rows = await (db.select(db.journalRows)
      ..where((tbl) => tbl.noSnd.equals(noSnd) & tbl.isDeleted.equals(false))
      ..orderBy([(tbl) => OrderingTerm(expression: tbl.rowF)]))
        .get();
    return rows.map(JournalRowMapper.toDomain).toList();
  }

  /// دسترسی یکبار خواند برای سند بر اساس شماره
  Future<Journal?> getByNoSnd(int noSnd) async {
    final row = await (db.select(db.journals)
      ..where((tbl) => tbl.referenceNumber.equals(noSnd) & tbl.isDeleted.equals(false)))
        .getSingleOrNull();
    return row != null ? JournalMapper.toDomain(row) : null;
  }

  /// حذف سخت بر اساس شماره سند (فقط برای توسعه/تست)
  ///
  /// هشدار: این عملیات سند را برای‌ایکل از پایگاه‌داده حذف می‌کند.
  /// در تولید استفاده نکنید. به جای آن از softDelete() استفاده کنید.
  Future<void> hardDeleteByNoSnd(int noSnd) {
    return (db.delete(db.journals)..where((t) => t.referenceNumber.equals(noSnd))).go();
  }

  /// حذف سخت بر اساس شناسه (فقط برای توسعه/تست)
  ///
  /// هشدار: این عملیات سند را برای‌ایکل از پایگاه‌داده حذف می‌کند.
  /// در تولید استفاده نکنید. به جای آن از softDelete() استفاده کنید.
  Future<void> hardDeleteById(String id) {
    return (db.delete(db.journals)..where((t) => t.id.equals(id))).go();
  }
}
