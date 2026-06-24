import 'package:cloud_financial_x/domain/sync_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'enums/cost_center_type.dart';

// import '../data/drift/cost_center_table.dart';

part 'cost_center.freezed.dart';


/// مرکز هزینه (Cost Center)
/// برای تخصیص هزینه‌ها و مسئولیت‌های حسابداری به بخش‌های مختلف سازمان استفاده می‌شود.
@freezed
class CostCenter with _$CostCenter implements SyncEntity {
  const CostCenter._();

  const factory CostCenter({
    /// شناسه یکتا (UUID)
    required String id,
    
    /// کد مرکز هزینه
    required String code,
    
    /// نام مرکز هزینه
    required String name,
    
    /// توضیحات مرکز هزینه
    String? description,
    
    /// آیا فعال است؟
    @Default(true)
    bool isActive,
    
    /// نوع مرکز هزینه
    required CostCenterType type,
    
    /// کد ارز (اختیاری)
    String? currencyCode,
    
    /// سقف بودجه
    double? budget,
    
    /// زمان ایجاد (میلی‌ثانیه)
    required int createdAt,
    
    /// زمان آخرین به‌روزرسانی (میلی‌ثانیه)
    required int updatedAt,
    
    /// نسخه برای تعارض‌زدایی
    required int version,
    
    /// آیا حذف شده است؟
    required bool isDeleted,
    
    /// زمان حذف (میلی‌ثانیه)
    int? deletedAt,
  }) = _CostCenter;

  /// لمس کردن مرکز (به‌روزرسانی زمان و نسخه)
  CostCenter touch(int now) =>
      copyWith(updatedAt: now, version: version + 1);

  /// --- Sync ---
  @override
  String get entityType => 'cost_center';

  @override
  Map<String, dynamic> toSyncJson() => {
    'id': id,
    'code': code,
    'name': name,
    'description': description,
    'isActive': isActive,
    'type': type.index,
    'currencyCode': currencyCode,
    'budget': budget,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    'version': version,
    'isDeleted': isDeleted,
    'deletedAt': deletedAt,
  };
}
