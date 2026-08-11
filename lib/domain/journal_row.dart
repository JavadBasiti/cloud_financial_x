import 'package:cloud_financial_x/domain/sync_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'journal_row.freezed.dart';

/// ردیف سند حسابداری (Journal Entry Row)
/// هر ردیف شامل یک حساب (Hesab) و مبلغ است و به یک سند (Journal) متعلق است.
@freezed
class JournalRow with _$JournalRow implements SyncEntity {
  const JournalRow._();

  const factory JournalRow({
    /// شناسه یکتا (UUID)
    required String id,
    
    /// تاریخ سند (میلی‌ثانیه)
    required int date,
    
    /// شماره سند
    required int noSnd,
    
    /// شماره ردیف در سند
    required int rowF,
    
    /// شناسه سرفصل (Hesab ID)
    required String hesabId,
    
    /// مبلغ بستانکار ردیف
    @Default(0)
    double prBest,

    /// مبلغ بدهکار ردیف
    @Default(0)
    double prBed,
    
    /// لینک مدیا (عکس، صوت، فایل مستند)
    @Default('')
    String media,

    /// توضیحات ردیف
    @Default('')
    String descRow,
    
    /// کد ارز (مثلاً IRR، USD)
    @Default('IRR')
    String currencyCode,
    
    /// شناسه مرکز هزینه (Cost Center ID)
    required String costCenterId,
    
    /// آیا ردیف به‌طور خودکار تولید شده است؟
    @Default(false)
    bool isAuto,
    
    /// شناسه سند (Journal ID)
    required String journalId,
    
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
  }) = _JournalRow;

  /// لمس کردن ردیف (به‌روزرسانی زمان و نسخه)
  JournalRow touch(int now) =>
      copyWith(updatedAt: now, version: version + 1);

  /// --- Sync ---
  @override
  String get entityType => 'journal_row';

  @override
  Map<String, dynamic> toSyncJson() => {
    'id': id,
    'date': date,
    'noSnd': noSnd,
    'rowF': rowF,
    'hesabId': hesabId,
    'prBest': prBest,
    'descRow': descRow,
    'currencyCode': currencyCode,
    'costCenterId': costCenterId,
    'isAuto': isAuto,
    'journalId': journalId,
    'prBed': prBed,
    'media': media,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    'version': version,
    'isDeleted': isDeleted,
    'deletedAt': deletedAt,
  };
}
