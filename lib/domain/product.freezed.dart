// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Product {
  String get id => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get descF => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  String get unit2 => throw _privateConstructorUsedError;
  double? get fee => throw _privateConstructorUsedError;
  double? get zaribU2 => throw _privateConstructorUsedError;
  double? get buyFee => throw _privateConstructorUsedError;
  double? get buyFee2 => throw _privateConstructorUsedError;
  double? get buyPercent => throw _privateConstructorUsedError;
  double? get saleFee => throw _privateConstructorUsedError;
  double? get minLm => throw _privateConstructorUsedError;
  double? get maxLm => throw _privateConstructorUsedError;
  double? get formFee => throw _privateConstructorUsedError;
  int get createdAt => throw _privateConstructorUsedError;
  int get updatedAt => throw _privateConstructorUsedError;
  int get version => throw _privateConstructorUsedError;
  bool get isDeleted => throw _privateConstructorUsedError;
  int? get deletedAt => throw _privateConstructorUsedError;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call({
    String id,
    String code,
    String descF,
    String unit,
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
    int createdAt,
    int updatedAt,
    int version,
    bool isDeleted,
    int? deletedAt,
  });
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? descF = null,
    Object? unit = null,
    Object? unit2 = null,
    Object? fee = freezed,
    Object? zaribU2 = freezed,
    Object? buyFee = freezed,
    Object? buyFee2 = freezed,
    Object? buyPercent = freezed,
    Object? saleFee = freezed,
    Object? minLm = freezed,
    Object? maxLm = freezed,
    Object? formFee = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? version = null,
    Object? isDeleted = null,
    Object? deletedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
            descF: null == descF
                ? _value.descF
                : descF // ignore: cast_nullable_to_non_nullable
                      as String,
            unit: null == unit
                ? _value.unit
                : unit // ignore: cast_nullable_to_non_nullable
                      as String,
            unit2: null == unit2
                ? _value.unit2
                : unit2 // ignore: cast_nullable_to_non_nullable
                      as String,
            fee: freezed == fee
                ? _value.fee
                : fee // ignore: cast_nullable_to_non_nullable
                      as double?,
            zaribU2: freezed == zaribU2
                ? _value.zaribU2
                : zaribU2 // ignore: cast_nullable_to_non_nullable
                      as double?,
            buyFee: freezed == buyFee
                ? _value.buyFee
                : buyFee // ignore: cast_nullable_to_non_nullable
                      as double?,
            buyFee2: freezed == buyFee2
                ? _value.buyFee2
                : buyFee2 // ignore: cast_nullable_to_non_nullable
                      as double?,
            buyPercent: freezed == buyPercent
                ? _value.buyPercent
                : buyPercent // ignore: cast_nullable_to_non_nullable
                      as double?,
            saleFee: freezed == saleFee
                ? _value.saleFee
                : saleFee // ignore: cast_nullable_to_non_nullable
                      as double?,
            minLm: freezed == minLm
                ? _value.minLm
                : minLm // ignore: cast_nullable_to_non_nullable
                      as double?,
            maxLm: freezed == maxLm
                ? _value.maxLm
                : maxLm // ignore: cast_nullable_to_non_nullable
                      as double?,
            formFee: freezed == formFee
                ? _value.formFee
                : formFee // ignore: cast_nullable_to_non_nullable
                      as double?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as int,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as int,
            version: null == version
                ? _value.version
                : version // ignore: cast_nullable_to_non_nullable
                      as int,
            isDeleted: null == isDeleted
                ? _value.isDeleted
                : isDeleted // ignore: cast_nullable_to_non_nullable
                      as bool,
            deletedAt: freezed == deletedAt
                ? _value.deletedAt
                : deletedAt // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
    _$ProductImpl value,
    $Res Function(_$ProductImpl) then,
  ) = __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String code,
    String descF,
    String unit,
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
    int createdAt,
    int updatedAt,
    int version,
    bool isDeleted,
    int? deletedAt,
  });
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
    _$ProductImpl _value,
    $Res Function(_$ProductImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? descF = null,
    Object? unit = null,
    Object? unit2 = null,
    Object? fee = freezed,
    Object? zaribU2 = freezed,
    Object? buyFee = freezed,
    Object? buyFee2 = freezed,
    Object? buyPercent = freezed,
    Object? saleFee = freezed,
    Object? minLm = freezed,
    Object? maxLm = freezed,
    Object? formFee = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? version = null,
    Object? isDeleted = null,
    Object? deletedAt = freezed,
  }) {
    return _then(
      _$ProductImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        descF: null == descF
            ? _value.descF
            : descF // ignore: cast_nullable_to_non_nullable
                  as String,
        unit: null == unit
            ? _value.unit
            : unit // ignore: cast_nullable_to_non_nullable
                  as String,
        unit2: null == unit2
            ? _value.unit2
            : unit2 // ignore: cast_nullable_to_non_nullable
                  as String,
        fee: freezed == fee
            ? _value.fee
            : fee // ignore: cast_nullable_to_non_nullable
                  as double?,
        zaribU2: freezed == zaribU2
            ? _value.zaribU2
            : zaribU2 // ignore: cast_nullable_to_non_nullable
                  as double?,
        buyFee: freezed == buyFee
            ? _value.buyFee
            : buyFee // ignore: cast_nullable_to_non_nullable
                  as double?,
        buyFee2: freezed == buyFee2
            ? _value.buyFee2
            : buyFee2 // ignore: cast_nullable_to_non_nullable
                  as double?,
        buyPercent: freezed == buyPercent
            ? _value.buyPercent
            : buyPercent // ignore: cast_nullable_to_non_nullable
                  as double?,
        saleFee: freezed == saleFee
            ? _value.saleFee
            : saleFee // ignore: cast_nullable_to_non_nullable
                  as double?,
        minLm: freezed == minLm
            ? _value.minLm
            : minLm // ignore: cast_nullable_to_non_nullable
                  as double?,
        maxLm: freezed == maxLm
            ? _value.maxLm
            : maxLm // ignore: cast_nullable_to_non_nullable
                  as double?,
        formFee: freezed == formFee
            ? _value.formFee
            : formFee // ignore: cast_nullable_to_non_nullable
                  as double?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as int,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as int,
        version: null == version
            ? _value.version
            : version // ignore: cast_nullable_to_non_nullable
                  as int,
        isDeleted: null == isDeleted
            ? _value.isDeleted
            : isDeleted // ignore: cast_nullable_to_non_nullable
                  as bool,
        deletedAt: freezed == deletedAt
            ? _value.deletedAt
            : deletedAt // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc

class _$ProductImpl extends _Product {
  const _$ProductImpl({
    required this.id,
    required this.code,
    required this.descF,
    required this.unit,
    this.unit2 = '',
    this.fee,
    this.zaribU2,
    this.buyFee,
    this.buyFee2,
    this.buyPercent,
    this.saleFee,
    this.minLm,
    this.maxLm,
    this.formFee,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
    required this.isDeleted,
    this.deletedAt,
  }) : super._();

  @override
  final String id;
  @override
  final String code;
  @override
  final String descF;
  @override
  final String unit;
  @override
  @JsonKey()
  final String unit2;
  @override
  final double? fee;
  @override
  final double? zaribU2;
  @override
  final double? buyFee;
  @override
  final double? buyFee2;
  @override
  final double? buyPercent;
  @override
  final double? saleFee;
  @override
  final double? minLm;
  @override
  final double? maxLm;
  @override
  final double? formFee;
  @override
  final int createdAt;
  @override
  final int updatedAt;
  @override
  final int version;
  @override
  final bool isDeleted;
  @override
  final int? deletedAt;

  @override
  String toString() {
    return 'Product(id: $id, code: $code, descF: $descF, unit: $unit, unit2: $unit2, fee: $fee, zaribU2: $zaribU2, buyFee: $buyFee, buyFee2: $buyFee2, buyPercent: $buyPercent, saleFee: $saleFee, minLm: $minLm, maxLm: $maxLm, formFee: $formFee, createdAt: $createdAt, updatedAt: $updatedAt, version: $version, isDeleted: $isDeleted, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.descF, descF) || other.descF == descF) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.unit2, unit2) || other.unit2 == unit2) &&
            (identical(other.fee, fee) || other.fee == fee) &&
            (identical(other.zaribU2, zaribU2) || other.zaribU2 == zaribU2) &&
            (identical(other.buyFee, buyFee) || other.buyFee == buyFee) &&
            (identical(other.buyFee2, buyFee2) || other.buyFee2 == buyFee2) &&
            (identical(other.buyPercent, buyPercent) ||
                other.buyPercent == buyPercent) &&
            (identical(other.saleFee, saleFee) || other.saleFee == saleFee) &&
            (identical(other.minLm, minLm) || other.minLm == minLm) &&
            (identical(other.maxLm, maxLm) || other.maxLm == maxLm) &&
            (identical(other.formFee, formFee) || other.formFee == formFee) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    code,
    descF,
    unit,
    unit2,
    fee,
    zaribU2,
    buyFee,
    buyFee2,
    buyPercent,
    saleFee,
    minLm,
    maxLm,
    formFee,
    createdAt,
    updatedAt,
    version,
    isDeleted,
    deletedAt,
  ]);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);
}

abstract class _Product extends Product {
  const factory _Product({
    required final String id,
    required final String code,
    required final String descF,
    required final String unit,
    final String unit2,
    final double? fee,
    final double? zaribU2,
    final double? buyFee,
    final double? buyFee2,
    final double? buyPercent,
    final double? saleFee,
    final double? minLm,
    final double? maxLm,
    final double? formFee,
    required final int createdAt,
    required final int updatedAt,
    required final int version,
    required final bool isDeleted,
    final int? deletedAt,
  }) = _$ProductImpl;
  const _Product._() : super._();

  @override
  String get id;
  @override
  String get code;
  @override
  String get descF;
  @override
  String get unit;
  @override
  String get unit2;
  @override
  double? get fee;
  @override
  double? get zaribU2;
  @override
  double? get buyFee;
  @override
  double? get buyFee2;
  @override
  double? get buyPercent;
  @override
  double? get saleFee;
  @override
  double? get minLm;
  @override
  double? get maxLm;
  @override
  double? get formFee;
  @override
  int get createdAt;
  @override
  int get updatedAt;
  @override
  int get version;
  @override
  bool get isDeleted;
  @override
  int? get deletedAt;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
