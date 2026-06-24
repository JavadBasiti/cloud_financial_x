// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cost_center.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CostCenter {
  /// شناسه یکتا (UUID)
  String get id => throw _privateConstructorUsedError;

  /// کد مرکز هزینه
  String get code => throw _privateConstructorUsedError;

  /// نام مرکز هزینه
  String get name => throw _privateConstructorUsedError;

  /// توضیحات مرکز هزینه
  String? get description => throw _privateConstructorUsedError;

  /// آیا فعال است؟
  bool get isActive => throw _privateConstructorUsedError;

  /// نوع مرکز هزینه
  CostCenterType get type => throw _privateConstructorUsedError;

  /// کد ارز (اختیاری)
  String? get currencyCode => throw _privateConstructorUsedError;

  /// سقف بودجه
  double? get budget => throw _privateConstructorUsedError;

  /// زمان ایجاد (میلی‌ثانیه)
  int get createdAt => throw _privateConstructorUsedError;

  /// زمان آخرین به‌روزرسانی (میلی‌ثانیه)
  int get updatedAt => throw _privateConstructorUsedError;

  /// نسخه برای تعارض‌زدایی
  int get version => throw _privateConstructorUsedError;

  /// آیا حذف شده است؟
  bool get isDeleted => throw _privateConstructorUsedError;

  /// زمان حذف (میلی‌ثانیه)
  int? get deletedAt => throw _privateConstructorUsedError;

  /// Create a copy of CostCenter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CostCenterCopyWith<CostCenter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CostCenterCopyWith<$Res> {
  factory $CostCenterCopyWith(
    CostCenter value,
    $Res Function(CostCenter) then,
  ) = _$CostCenterCopyWithImpl<$Res, CostCenter>;
  @useResult
  $Res call({
    String id,
    String code,
    String name,
    String? description,
    bool isActive,
    CostCenterType type,
    String? currencyCode,
    double? budget,
    int createdAt,
    int updatedAt,
    int version,
    bool isDeleted,
    int? deletedAt,
  });
}

/// @nodoc
class _$CostCenterCopyWithImpl<$Res, $Val extends CostCenter>
    implements $CostCenterCopyWith<$Res> {
  _$CostCenterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CostCenter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? description = freezed,
    Object? isActive = null,
    Object? type = null,
    Object? currencyCode = freezed,
    Object? budget = freezed,
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
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as CostCenterType,
            currencyCode: freezed == currencyCode
                ? _value.currencyCode
                : currencyCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            budget: freezed == budget
                ? _value.budget
                : budget // ignore: cast_nullable_to_non_nullable
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
abstract class _$$CostCenterImplCopyWith<$Res>
    implements $CostCenterCopyWith<$Res> {
  factory _$$CostCenterImplCopyWith(
    _$CostCenterImpl value,
    $Res Function(_$CostCenterImpl) then,
  ) = __$$CostCenterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String code,
    String name,
    String? description,
    bool isActive,
    CostCenterType type,
    String? currencyCode,
    double? budget,
    int createdAt,
    int updatedAt,
    int version,
    bool isDeleted,
    int? deletedAt,
  });
}

/// @nodoc
class __$$CostCenterImplCopyWithImpl<$Res>
    extends _$CostCenterCopyWithImpl<$Res, _$CostCenterImpl>
    implements _$$CostCenterImplCopyWith<$Res> {
  __$$CostCenterImplCopyWithImpl(
    _$CostCenterImpl _value,
    $Res Function(_$CostCenterImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CostCenter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? description = freezed,
    Object? isActive = null,
    Object? type = null,
    Object? currencyCode = freezed,
    Object? budget = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? version = null,
    Object? isDeleted = null,
    Object? deletedAt = freezed,
  }) {
    return _then(
      _$CostCenterImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as CostCenterType,
        currencyCode: freezed == currencyCode
            ? _value.currencyCode
            : currencyCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        budget: freezed == budget
            ? _value.budget
            : budget // ignore: cast_nullable_to_non_nullable
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

class _$CostCenterImpl extends _CostCenter {
  const _$CostCenterImpl({
    required this.id,
    required this.code,
    required this.name,
    this.description,
    this.isActive = true,
    required this.type,
    this.currencyCode,
    this.budget,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
    required this.isDeleted,
    this.deletedAt,
  }) : super._();

  /// شناسه یکتا (UUID)
  @override
  final String id;

  /// کد مرکز هزینه
  @override
  final String code;

  /// نام مرکز هزینه
  @override
  final String name;

  /// توضیحات مرکز هزینه
  @override
  final String? description;

  /// آیا فعال است؟
  @override
  @JsonKey()
  final bool isActive;

  /// نوع مرکز هزینه
  @override
  final CostCenterType type;

  /// کد ارز (اختیاری)
  @override
  final String? currencyCode;

  /// سقف بودجه
  @override
  final double? budget;

  /// زمان ایجاد (میلی‌ثانیه)
  @override
  final int createdAt;

  /// زمان آخرین به‌روزرسانی (میلی‌ثانیه)
  @override
  final int updatedAt;

  /// نسخه برای تعارض‌زدایی
  @override
  final int version;

  /// آیا حذف شده است؟
  @override
  final bool isDeleted;

  /// زمان حذف (میلی‌ثانیه)
  @override
  final int? deletedAt;

  @override
  String toString() {
    return 'CostCenter(id: $id, code: $code, name: $name, description: $description, isActive: $isActive, type: $type, currencyCode: $currencyCode, budget: $budget, createdAt: $createdAt, updatedAt: $updatedAt, version: $version, isDeleted: $isDeleted, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CostCenterImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode) &&
            (identical(other.budget, budget) || other.budget == budget) &&
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
  int get hashCode => Object.hash(
    runtimeType,
    id,
    code,
    name,
    description,
    isActive,
    type,
    currencyCode,
    budget,
    createdAt,
    updatedAt,
    version,
    isDeleted,
    deletedAt,
  );

  /// Create a copy of CostCenter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CostCenterImplCopyWith<_$CostCenterImpl> get copyWith =>
      __$$CostCenterImplCopyWithImpl<_$CostCenterImpl>(this, _$identity);
}

abstract class _CostCenter extends CostCenter {
  const factory _CostCenter({
    required final String id,
    required final String code,
    required final String name,
    final String? description,
    final bool isActive,
    required final CostCenterType type,
    final String? currencyCode,
    final double? budget,
    required final int createdAt,
    required final int updatedAt,
    required final int version,
    required final bool isDeleted,
    final int? deletedAt,
  }) = _$CostCenterImpl;
  const _CostCenter._() : super._();

  /// شناسه یکتا (UUID)
  @override
  String get id;

  /// کد مرکز هزینه
  @override
  String get code;

  /// نام مرکز هزینه
  @override
  String get name;

  /// توضیحات مرکز هزینه
  @override
  String? get description;

  /// آیا فعال است؟
  @override
  bool get isActive;

  /// نوع مرکز هزینه
  @override
  CostCenterType get type;

  /// کد ارز (اختیاری)
  @override
  String? get currencyCode;

  /// سقف بودجه
  @override
  double? get budget;

  /// زمان ایجاد (میلی‌ثانیه)
  @override
  int get createdAt;

  /// زمان آخرین به‌روزرسانی (میلی‌ثانیه)
  @override
  int get updatedAt;

  /// نسخه برای تعارض‌زدایی
  @override
  int get version;

  /// آیا حذف شده است؟
  @override
  bool get isDeleted;

  /// زمان حذف (میلی‌ثانیه)
  @override
  int? get deletedAt;

  /// Create a copy of CostCenter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CostCenterImplCopyWith<_$CostCenterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
