import 'package:cloud_financial_x/domain/sync_queue_record.dart';
import 'package:drift/drift.dart';
import '../../domain/hesab.dart';
import '../../ui/common/form_mod.dart';
import '../drift/app_database.dart' as drift_db;
import '../mapper/hesab_mapper.dart';
import 'sync_queue_repository.dart';

/// Repository برای مدیریت Hesab (سرفصلهای حسابداری)
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
class HesabRepository {
  final drift_db.AppDatabase db;
  final SyncQueueRepository syncQueueRepo;

  HesabRepository(this.db, {SyncQueueRepository? syncQueueRepo})
      : syncQueueRepo = syncQueueRepo ?? SyncQueueRepository(db);

  /// مشاهدهٔ تمام سرفصل‌های فعال به صورت stream
  /// 
  /// رفتار جریان واکنش‌پذیر که هر زمان پایگاه‌داده تغییر می‌کند، لیستی از سرفصل‌های فعال را ارسال می‌کند.
  Stream<List<Hesab>> watchAll() {
    final query = (db.select(db.hesabs)..where((tbl) => tbl.isDeleted.equals(false)));
    return query.watch().map((rows) {
      return rows.map(HesabMapper.toDomain).toList();
    });
  }

  /// مشاهدهٔ سرفصل بر اساس شناسه
  Stream<Hesab?> watchById(String id) {
    final query = (db.select(db.hesabs)
      ..where((tbl) => tbl.id.equals(id) & tbl.isDeleted.equals(false)));
    return query.watchSingleOrNull().map((row) {
      return row != null ? HesabMapper.toDomain(row) : null;
    });
  }

  /// مشاهدهٔ سرفصل بر اساس کد
  Stream<Hesab?> watchByCode(String code) {
    final query = (db.select(db.hesabs)
      ..where((tbl) => tbl.code.equals(code) & tbl.isDeleted.equals(false)));
    return query.watchSingleOrNull().map((row) {
      return row != null ? HesabMapper.toDomain(row) : null;
    });
  }

  /// درج (ایجاد) یا به‌روزرسانی در تراکنش
  Future<void> save(Hesab hesab, FormMode mode) async {
    await db.transaction(() async {
      if (mode == FormMode.create) {
        await db.into(db.hesabs).insert(HesabMapper.toInsert(hesab));
        await syncQueueRepo.enqueue(hesab, SyncOperation.insert);
      } else {
        await (db.update(db.hesabs)
          ..where((t) => t.id.equals(hesab.id)))
            .write(HesabMapper.toUpdate(hesab));
        await syncQueueRepo.enqueue(hesab, SyncOperation.update);
      }
    });
  }

  /// حذف نرم سرفصل با علامت‌زنی به عنوان حذف‌شده
  ///
  /// این روش:
  /// 1. منطق domain را اعمال می‌کند (تحقق و افزایش نسخه)
  /// 2. تراکنش را آغاز می‌کند
  /// 3. سرفصل را با isDeleted=true و deletedAt timestamp به‌روزرسانی می‌کند
  /// 4. یک رکورد DELETE سنک را صف‌بندی می‌کند
  /// 5. اتمی commit می‌شود
  ///
  /// سرفصل از پایگاه‌داده حذف نمی‌شود، فقط به عنوان حذف‌شده علامت‌گذاری می‌شود.
  Future<void> softDelete(Hesab hesab) async {
    final now = DateTime.now().millisecondsSinceEpoch;
    
    await db.transaction(() async {
      await (db.update(db.hesabs)
          ..where((tbl) => tbl.id.equals(hesab.id)))
          .write(
        drift_db.HesabsCompanion(
          isDeleted: const Value(true),
          deletedAt: Value(now),
          updatedAt: Value(now),
          version: Value(hesab.version + 1),
        ),
      );
      
      await syncQueueRepo.enqueue(hesab, SyncOperation.delete);
    });
  }

  /// دسترسی یکبار خواند برای تمام سرفصل‌های فعال
  Future<List<Hesab>> getAllActive() async {
    final rows = await (db.select(db.hesabs)
      ..where((tbl) => tbl.isDeleted.equals(false)))
        .get();
    return rows.map(HesabMapper.toDomain).toList();
  }

  /// دسترسی یکبار خواند برای سرفصل بر اساس کد
  Future<Hesab?> getByCode(String code) async {
    final row = await (db.select(db.hesabs)
      ..where((tbl) => tbl.code.equals(code) & tbl.isDeleted.equals(false)))
        .getSingleOrNull();
    return row != null ? HesabMapper.toDomain(row) : null;
  }

  /// حذف سخت بر اساس کد (فقط برای توسعه/تست)
  ///
  /// هشدار: این عملیات سرفصل را برای‌ایکل از پایگاه‌داده حذف می‌کند.
  /// در تولید استفاده نکنید. به جای آن از softDelete() استفاده کنید.
  Future<void> hardDeleteByCode(String code) {
    return (db.delete(db.hesabs)..where((t) => t.code.equals(code))).go();
  }

  /// حذف سخت بر اساس شناسه (فقط برای توسعه/تست)
  ///
  /// هشدار: این عملیات سرفصل را برای‌ایکل از پایگاه‌داده حذف می‌کند.
  /// در تولید استفاده نکنید. به جای آن از softDelete() استفاده کنید.
  Future<void> hardDeleteById(String id) {
    return (db.delete(db.hesabs)..where((t) => t.id.equals(id))).go();
  }
}
