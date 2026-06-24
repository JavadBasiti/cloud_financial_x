import 'package:cloud_financial_x/domain/sync_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

@freezed
class Product with _$Product  implements SyncEntity {
  const Product._();

  const factory Product({
    required String id,
    required String code,
    required String descF,
    required String unit,
    @Default('')
    String unit2,
    double? fee,
    double? zaribU2,
    double? buyFee,
    double? buyFee2,
    double? buyPercent,
    double? saleFee,
    double? minLm,
    double? maxLm,
    double? formFee,

    required int createdAt ,
    required int updatedAt,
    required int version,
    required bool isDeleted,
    int? deletedAt,

  }) = _Product;

  Product touch(int now) =>
      copyWith( updatedAt: now, version: version + 1);


  ///--- for Sync  ---
  @override
  String get entityType => 'product';

  @override
  Map<String, dynamic> toSyncJson() => {
    'id': id,
    'code': code,
    'descF': descF,
    'unit':unit,
    'unit2':unit2,
    'fee': fee,
    'zaribU2': zaribU2,
    'buyFee': buyFee,
    'buyFee2': buyFee2,
    'buyPercent': buyPercent,
    'saleFee': saleFee,
    'minLm': minLm,
    'maxLm': maxLm,
    'formFee': formFee,

    'createdAt': createdAt,
    'updatedAt': updatedAt,
    'version': version,
    'isDeleted': isDeleted,
    'deletedAt': deletedAt,
  };

  /// --- Business rules ---

}
