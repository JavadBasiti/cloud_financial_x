import 'package:cloud_financial_x/domain/sync_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'enums/account_level.dart';

part 'hesab.freezed.dart';


/// سرفصل حسابداری (Accounting Code / Chart of Accounts)
/// هر سرفصل مربوط به یک یا چند حساب مالی است و می‌تواند تا ۵ سطح داشته باشد.
@freezed
class Hesab with _$Hesab implements SyncEntity {
  const Hesab._();

  const factory Hesab({
    /// شناسه یکتا (UUID)
    required String id,
    
    /// سطح سرفصل (۰ تا ۴)
    required AccountLevel levelF,
    ///سرفصل اصلی
    Hesab? parent,
    /// کد سرفصل
    required String code,
    
    /// توضیحات سرفصل
    required String descF,
    
    /// قیمت به ارز بومی
    double? crnPrice,
    
    /// قیمت به ارز خارجی
    double? fuPrice,
    
    /// توضیحات اضافی
    @Default('')
    String exteraDesc,
    
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
  }) = _Hesab;

  /// لمس کردن سرفصل (به‌روزرسانی زمان و نسخه)
  Hesab touch(int now) =>
      copyWith(updatedAt: now, version: version + 1);

  /// --- Sync ---
  @override
  String get entityType => 'hesab';

  @override
  Map<String, dynamic> toSyncJson() => {
    'id': id,
    'levelF': levelF.index,
    'parent':parent,
    'code': code,
    'descF': descF,
    'crnPrice': crnPrice,
    'fuPrice': fuPrice,
    'exteraDesc': exteraDesc,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    'version': version,
    'isDeleted': isDeleted,
    'deletedAt': deletedAt,
  };
}
