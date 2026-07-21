import 'package:cloud_financial_x/domain/sync_queue_record.dart';
import 'package:drift/drift.dart';
import '../../domain/journal_row.dart';
import '../../ui/common/form_mod.dart';
import '../drift/app_database.dart' as drift_db;
import '../mapper/journal_row_mapper.dart';
import '../../domain/services/journal_row_service.dart';
import 'sync_queue_repository.dart';

/// Repository برای مدیریت JournalRow (ردیفهای اسناد حسابداری)
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
class JournalRowRepository implements JournalRowRepositoryContract {
  final drift_db.AppDatabase db;
  final SyncQueueRepository syncQueueRepo;

  JournalRowRepository(this.db, {SyncQueueRepository? syncQueueRepo})
      : syncQueueRepo = syncQueueRepo ?? SyncQueueRepository(db);

  /// مشاهدهٔ تمام ردیفهای فعال به صورت stream
  /// 
  /// رفتار جریان واکنش‌پذیر که هر زمان پایگاه‌داده تغییر می‌کند، لیستی از ردیفهای فعال را ارسال می‌کند.
  Stream<List<JournalRow>> watchAll() {
    final query = (db.select(db.journalRows)..where((tbl) => tbl.isDeleted.equals(false)));
    return query.watch().map((rows) {
      return rows.map(JournalRowMapper.toDomain).toList();
    });
  }

  /// مشاهدهٔ ردیف بر اساس شناسه
  Stream<JournalRow?> watchById(String id) {
    final query = (db.select(db.journalRows)
      ..where((tbl) => tbl.id.equals(id) & tbl.isDeleted.equals(false)));
    return query.watchSingleOrNull().map((row) {
      return row != null ? JournalRowMapper.toDomain(row) : null;
    });
  }

  /// مشاهدهٔ ردیفهای یک سند
  Stream<List<JournalRow>> watchByJournalId(String journalId) {
    final query = (db.select(db.journalRows)
      ..where((tbl) => tbl.journalId.equals(journalId) & tbl.isDeleted.equals(false))
      ..orderBy([(tbl) => OrderingTerm(expression: tbl.rowF)]));
    return query.watch().map((rows) {
      return rows.map(JournalRowMapper.toDomain).toList();
    });
  }

  /// مشاهدهٔ ردیفهای یک سند بر اساس شماره سند
  Stream<List<JournalRow>> watchByNoSnd(int noSnd) {
    final query = (db.select(db.journalRows)
      ..where((tbl) => tbl.noSnd.equals(noSnd) & tbl.isDeleted.equals(false))
      ..orderBy([(tbl) => OrderingTerm(expression: tbl.rowF)]));
    return query.watch().map((rows) {
      return rows.map(JournalRowMapper.toDomain).toList();
    });
  }

  /// درج (ایجاد) یا به‌روزرسانی در تراکنش
  Future<void> save(JournalRow journalRow, FormMode mode) async {
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

  /// حذف نرم ردیف با علامت‌زنی به عنوان حذف‌شده
  ///
  /// این روش:
  /// 1. منطق domain را اعمال می‌کند (تحقق و افزایش نسخه)
  /// 2. تراکنش را آغاز می‌کند
  /// 3. ردیف را با isDeleted=true و deletedAt timestamp به‌روزرسانی می‌کند
  /// 4. یک رکورد DELETE سنک را صف‌بندی می‌کند
  /// 5. اتمی commit می‌شود
  ///
  /// ردیف از پایگاه‌داده حذف نمی‌شود، فقط به عنوان حذف‌شده علامت‌گذاری می‌شود.
  Future<void> softDelete(JournalRow journalRow) async {
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

  /// دسترسی یکبار خواند برای تمام ردیفهای فعال
  Future<List<JournalRow>> getAllActive() async {
    final rows = await (db.select(db.journalRows)
      ..where((tbl) => tbl.isDeleted.equals(false)))
        .get();
    return rows.map(JournalRowMapper.toDomain).toList();
  }

  /// دسترسی یکبار خواند برای ردیفهای یک سند
  Future<List<JournalRow>> getByJournalId(String journalId) async {
    final rows = await (db.select(db.journalRows)
      ..where((tbl) => tbl.journalId.equals(journalId) & tbl.isDeleted.equals(false))
      ..orderBy([(tbl) => OrderingTerm(expression: tbl.rowF)]))
        .get();
    return rows.map(JournalRowMapper.toDomain).toList();
  }

  /// دسترسی یکبار خواند برای ردیفهای یک سند بر اساس شماره سند
  Future<List<JournalRow>> getByNoSnd(int noSnd) async {
    final rows = await (db.select(db.journalRows)
      ..where((tbl) => tbl.noSnd.equals(noSnd) & tbl.isDeleted.equals(false))
      ..orderBy([(tbl) => OrderingTerm(expression: tbl.rowF)]))
        .get();
    return rows.map(JournalRowMapper.toDomain).toList();
  }

  /// حذف سخت بر اساس شناسه (فقط برای توسعه/تست)
  ///
  /// هشدار: این عملیات ردیف را برای‌ایکل از پایگاه‌داده حذف می‌کند.
  /// در تولید استفاده نکنید. به جای آن از softDelete() استفاده کنید.
  Future<void> hardDeleteById(String id) {
    return (db.delete(db.journalRows)..where((t) => t.id.equals(id))).go();
  }

  /// حذف سخت برای تمامی ردیفهای یک سند (فقط برای توسعه/تست)
  ///
  /// هشدار: این عملیات تمام ردیفهای سند را برای‌ایکل از پایگاه‌داده حذف می‌کند.
  /// در تولید استفاده نکنید. به جای آن از softDelete() استفاده کنید.
  Future<void> hardDeleteByJournalId(String journalId) {
    return (db.delete(db.journalRows)..where((t) => t.journalId.equals(journalId))).go();
  }
}
