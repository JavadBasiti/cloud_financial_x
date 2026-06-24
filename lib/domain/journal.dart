import 'package:cloud_financial_x/domain/sync_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'journal.freezed.dart';

/// سند حسابداری (Accounting Journal / Document)
/// هر سند شامل یک یا بیشتر ردیف است و بر اساس اصل دوجانبه حسابداری متوازن است.
@freezed
class Journal with _$Journal implements SyncEntity {
  const Journal._();

  const factory Journal({
    /// شناسه یکتا (UUID)
    required String id,
    
    /// شماره مبنا سند (Auto-increment) **حذف شده
    // required int noSnd,
    
    /// شماره مرجع سند (بر اساس تاریخ)
    int? referenceNumber,
    
    /// تاریخ سند (میلی‌ثانیه)
    required int date,
    
    /// توضیحات سند
    @Default('')
    String description,
    
    /// آیا سند به‌طور خودکار تولید شده است؟
    @Default(false)
    bool isAuto,
    
    /// کد ارز (مثث IRR، USD)
    @Default('IRR')
    String currencyCode,
    
    /// آیا سند امضا شده است؟
    @Default(false)
    bool signed,
    
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
  }) = _Journal;

  /// لمس کردن سند (به‌روزرسانی زمان و نسخه)
  Journal touch(int now) =>
      copyWith(updatedAt: now, version: version + 1);

  /// --- Sync ---
  @override
  String get entityType => 'journal';

  @override
  Map<String, dynamic> toSyncJson() => {
    'id': id,
    // 'noSnd': noSnd,
    'referenceNumber': referenceNumber,
    'date': date,
    'description': description,
    'isAuto': isAuto,
    'currencyCode': currencyCode,
    'signed': signed,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    'version': version,
    'isDeleted': isDeleted,
    'deletedAt': deletedAt,
  };
}
