import 'package:cloud_financial_x/domain/sync_queue_record.dart';
import 'package:drift/drift.dart';
import '../../domain/cost_center.dart';
import '../../ui/common/form_mod.dart';
import '../drift/app_database.dart' as drift_db;
import '../mapper/cost_center_mapper.dart';
import 'sync_queue_repository.dart';

/// Repository برای مدیریت CostCenter (مراکز هزینه)
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
class CostCenterRepository {
  final drift_db.AppDatabase db;
  final SyncQueueRepository syncQueueRepo;

  CostCenterRepository(this.db, {SyncQueueRepository? syncQueueRepo})
      : syncQueueRepo = syncQueueRepo ?? SyncQueueRepository(db);

  /// مشاهدهٔ تمام مراکز هزینه فعال به صورت stream
  /// 
  /// رفتار جریان واکنش‌پذیر که هر زمان پایگاه‌داده تغییر می‌کند، لیستی از مراکز هزینه فعال را ارسال می‌کند.
  Stream<List<CostCenter>> watchAll() {
    final query = (db.select(db.costCenters)..where((tbl) => tbl.isDeleted.equals(false)));
    return query.watch().map((rows) {
      return rows.map(CostCenterMapper.toDomain).toList();
    });
  }

  /// مشاهدهٔ مرکز هزینه بر اساس شناسه
  Stream<CostCenter?> watchById(String id) {
    final query = (db.select(db.costCenters)
      ..where((tbl) => tbl.id.equals(id) & tbl.isDeleted.equals(false)));
    return query.watchSingleOrNull().map((row) {
      return row != null ? CostCenterMapper.toDomain(row) : null;
    });
  }

  /// مشاهدهٔ مرکز هزینه بر اساس کد
  Stream<CostCenter?> watchByCode(String code) {
    final query = (db.select(db.costCenters)
      ..where((tbl) => tbl.code.equals(code) & tbl.isDeleted.equals(false)));
    return query.watchSingleOrNull().map((row) {
      return row != null ? CostCenterMapper.toDomain(row) : null;
    });
  }

  /// درج (ایجاد) یا به‌روزرسانی در تراکنش
  Future<void> save(CostCenter costCenter, FormMode mode) async {
    await db.transaction(() async {
      if (mode == FormMode.create) {
        await db.into(db.costCenters).insert(CostCenterMapper.toInsert(costCenter));
        await syncQueueRepo.enqueue(costCenter, SyncOperation.insert);
      } else {
        await (db.update(db.costCenters)
          ..where((t) => t.id.equals(costCenter.id)))
            .write(CostCenterMapper.toUpdate(costCenter));
        await syncQueueRepo.enqueue(costCenter, SyncOperation.update);
      }
    });
  }

  /// حذف نرم مرکز هزینه با علامت‌زنی به عنوان حذف‌شده
  ///
  /// این روش:
  /// 1. منطق domain را اعمال می‌کند (تحقق و افزایش نسخه)
  /// 2. تراکنش را آغاز می‌کند
  /// 3. مرکز هزینه را با isDeleted=true و deletedAt timestamp به‌روزرسانی می‌کند
  /// 4. یک رکورد DELETE سنک را صف‌بندی می‌کند
  /// 5. اتمی commit می‌شود
  ///
  /// مرکز هزینه از پایگاه‌داده حذف نمی‌شود، فقط به عنوان حذف‌شده علامت‌گذاری می‌شود.
  Future<void> softDelete(CostCenter costCenter) async {
    final now = DateTime.now().millisecondsSinceEpoch;
    
    await db.transaction(() async {
      await (db.update(db.costCenters)
          ..where((tbl) => tbl.id.equals(costCenter.id)))
          .write(
        drift_db.CostCentersCompanion(
          isDeleted: const Value(true),
          deletedAt: Value(now),
          updatedAt: Value(now),
          version: Value(costCenter.version + 1),
        ),
      );
      
      await syncQueueRepo.enqueue(costCenter, SyncOperation.delete);
    });
  }

  /// دسترسی یکبار خواند برای تمام مراکز هزینه فعال
  Future<List<CostCenter>> getAllActive() async {
    final rows = await (db.select(db.costCenters)
      ..where((tbl) => tbl.isDeleted.equals(false)))
        .get();
    return rows.map(CostCenterMapper.toDomain).toList();
  }

  /// دسترسی یکبار خواند برای مرکز هزینه بر اساس کد
  Future<CostCenter?> getByCode(String code) async {
    final row = await (db.select(db.costCenters)
      ..where((tbl) => tbl.code.equals(code) & tbl.isDeleted.equals(false)))
        .getSingleOrNull();
    return row != null ? CostCenterMapper.toDomain(row) : null;
  }

  /// حذف سخت بر اساس کد (فقط برای توسعه/تست)
  ///
  /// هشدار: این عملیات مرکز هزینه را برای‌ایکل از پایگاه‌داده حذف می‌کند.
  /// در تولید استفاده نکنید. به جای آن از softDelete() استفاده کنید.
  Future<void> hardDeleteByCode(String code) {
    return (db.delete(db.costCenters)..where((t) => t.code.equals(code))).go();
  }

  /// حذف سخت بر اساس شناسه (فقط برای توسعه/تست)
  ///
  /// هشدار: این عملیات مرکز هزینه را برای‌ایکل از پایگاه‌داده حذف می‌کند.
  /// در تولید استفاده نکنید. به جای آن از softDelete() استفاده کنید.
  Future<void> hardDeleteById(String id) {
    return (db.delete(db.costCenters)..where((t) => t.id.equals(id))).go();
  }
}
