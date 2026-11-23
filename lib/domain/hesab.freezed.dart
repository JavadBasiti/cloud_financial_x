// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hesab.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Hesab {
  /// شناسه یکتا (UUID)
  String get id => throw _privateConstructorUsedError;

  /// سطح سرفصل (۰ تا ۴)
  AccountLevel get level => throw _privateConstructorUsedError;

  /// شناسه سرفصل اصلی - null یعنی سرفصل ریشه
  String? get parentId => throw _privateConstructorUsedError;

  /// کد سرفصل
  String get code => throw _privateConstructorUsedError;

  /// نام سرفصل
  String get name => throw _privateConstructorUsedError;

  /// موجودی حساب به ارز بومی
  double? get balance => throw _privateConstructorUsedError;

  /// قیمت به ارز خارجی
  double? get fuPrice => throw _privateConstructorUsedError;

  /// نام انگلیسی سرفصل
  String get nameEn => throw _privateConstructorUsedError;

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

  /// Create a copy of Hesab
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HesabCopyWith<Hesab> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HesabCopyWith<$Res> {
  factory $HesabCopyWith(Hesab value, $Res Function(Hesab) then) =
      _$HesabCopyWithImpl<$Res, Hesab>;
  @useResult
  $Res call({
    String id,
    AccountLevel level,
    String? parentId,
    String code,
    String name,
    double? balance,
    double? fuPrice,
    String nameEn,
    int createdAt,
    int updatedAt,
    int version,
    bool isDeleted,
    int? deletedAt,
  });
}

/// @nodoc
class _$HesabCopyWithImpl<$Res, $Val extends Hesab>
    implements $HesabCopyWith<$Res> {
  _$HesabCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Hesab
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call(
      {
        Object? id = null,
        Object? level = null,
        Object? parentId = freezed,
        Object? code = null,
        Object? name = null,
        Object? balance = freezed,
        Object? fuPrice = freezed,
        Object? nameEn = null,
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
            level: null == level
                ? _value.level
                : level // ignore: cast_nullable_to_non_nullable
                      as AccountLevel,
            parentId: freezed == parentId
                ? _value.parentId
                : parentId // ignore: cast_nullable_to_non_nullable
                      as String?,
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            balance: freezed == balance
                ? _value.balance
                : balance // ignore: cast_nullable_to_non_nullable
                      as double?,
            fuPrice: freezed == fuPrice
                ? _value.fuPrice
                : fuPrice // ignore: cast_nullable_to_non_nullable
                      as double?,
            nameEn: null == nameEn
                ? _value.nameEn
                : nameEn // ignore: cast_nullable_to_non_nullable
                      as String,
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
abstract class _$$HesabImplCopyWith<$Res> implements $HesabCopyWith<$Res> {
  factory _$$HesabImplCopyWith(
    _$HesabImpl value,
    $Res Function(_$HesabImpl) then,
  ) = __$$HesabImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    AccountLevel level,
    String? parentId,
    String code,
    String name,
    double? balance,
    double? fuPrice,
    String nameEn,
    int createdAt,
    int updatedAt,
    int version,
    bool isDeleted,
    int? deletedAt,
  });
}

/// @nodoc
class __$$HesabImplCopyWithImpl<$Res>
    extends _$HesabCopyWithImpl<$Res, _$HesabImpl>
    implements _$$HesabImplCopyWith<$Res> {
  __$$HesabImplCopyWithImpl(
    _$HesabImpl _value,
    $Res Function(_$HesabImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Hesab
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call(
      {
        Object? id = null,
        Object? level = null,
        Object? parentId = freezed,
        Object? code = null,
        Object? name = null,
        Object? balance = freezed,
        Object? fuPrice = freezed,
        Object? nameEn = null,
        Object? createdAt = null,
        Object? updatedAt = null,
        Object? version = null,
        Object? isDeleted = null,
        Object? deletedAt = freezed,
      }) {
    return _then(
      _$HesabImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        level: null == level
            ? _value.level
            : level // ignore: cast_nullable_to_non_nullable
                  as AccountLevel,
        parentId: freezed == parentId
            ? _value.parentId
            : parentId // ignore: cast_nullable_to_non_nullable
                  as String?,
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        balance: freezed == balance
            ? _value.balance
            : balance // ignore: cast_nullable_to_non_nullable
                  as double?,
        fuPrice: freezed == fuPrice
            ? _value.fuPrice
            : fuPrice // ignore: cast_nullable_to_non_nullable
                  as double?,
        nameEn: null == nameEn
            ? _value.nameEn
            : nameEn // ignore: cast_nullable_to_non_nullable
                  as String,
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

class _$HesabImpl extends _Hesab {
  const _$HesabImpl({
    required this.id,
    required this.level,
    this.parentId,
    required this.code,
    required this.name,
    this.balance,
    this.fuPrice,
    this.nameEn = '',
    required this.createdAt,
    required this.updatedAt,
    required this.version,
    required this.isDeleted,
    this.deletedAt,
  }) : super._();

  /// شناسه یکتا (UUID)
  @override
  final String id;

  /// سطح سرفصل (۰ تا ۴)
  @override
  final AccountLevel level;

  /// شناسه سرفصل اصلی - null یعنی سرفصل ریشه
  @override
  final String? parentId;

  /// کد سرفصل
  @override
  final String code;

  /// نام سرفصل
  @override
  final String name;

  /// موجودی حساب به ارز بومی
  @override
  final double? balance;

  /// قیمت به ارز خارجی
  @override
  final double? fuPrice;

  /// نام انگلیسی سرفصل
  @override
  @JsonKey()
  final String nameEn;

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
    return 'Hesab(id: $id, level: $level, parentId: $parentId, code: $code, name: $name, balance: $balance, fuPrice: $fuPrice, nameEn: $nameEn, createdAt: $createdAt, updatedAt: $updatedAt, version: $version, isDeleted: $isDeleted, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HesabImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.fuPrice, fuPrice) || other.fuPrice == fuPrice) &&
            (identical(other.nameEn, nameEn) || other.nameEn == nameEn) &&
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
    level,
    parentId,
    code,
    name,
    balance,
    fuPrice,
    nameEn,
    createdAt,
    updatedAt,
    version,
    isDeleted,
    deletedAt,
  );

  /// Create a copy of Hesab
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HesabImplCopyWith<_$HesabImpl> get copyWith =>
      __$$HesabImplCopyWithImpl<_$HesabImpl>(this, _$identity);
}

abstract class _Hesab extends Hesab {
  const factory _Hesab({
    required final String id,
    required final AccountLevel level,
    final String? parentId,
    required final String code,
    required final String name,
    final double? balance,
    final double? fuPrice,
    final String nameEn,
    required final int createdAt,
    required final int updatedAt,
    required final int version,
    required final bool isDeleted,
    final int? deletedAt,
  }) = _$HesabImpl;
  const _Hesab._() : super._();

  /// شناسه یکتا (UUID)
  @override
  String get id;

  /// سطح سرفصل (۰ تا ۴)
  @override
  AccountLevel get level;

  /// شناسه سرفصل اصلی - null یعنی سرفصل ریشه
  @override
  String? get parentId;

  /// کد سرفصل
  @override
  String get code;

  /// نام سرفصل
  @override
  String get name;

  /// موجودی حساب به ارز بومی
  @override
  double? get balance;

  /// قیمت به ارز خارجی
  @override
  double? get fuPrice;

  /// نام انگلیسی سرفصل
  @override
  String get nameEn;

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

  /// Create a copy of Hesab
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HesabImplCopyWith<_$HesabImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
