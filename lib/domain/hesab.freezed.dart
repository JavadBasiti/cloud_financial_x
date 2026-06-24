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
  AccountLevel get levelF => throw _privateConstructorUsedError;

  ///سرفصل اصلی
  Hesab? get parent => throw _privateConstructorUsedError;

  /// کد سرفصل
  String get code => throw _privateConstructorUsedError;

  /// توضیحات سرفصل
  String get descF => throw _privateConstructorUsedError;

  /// قیمت به ارز بومی
  double? get crnPrice => throw _privateConstructorUsedError;

  /// قیمت به ارز خارجی
  double? get fuPrice => throw _privateConstructorUsedError;

  /// توضیحات اضافی
  String get exteraDesc => throw _privateConstructorUsedError;

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
    AccountLevel levelF,
    Hesab? parent,
    String code,
    String descF,
    double? crnPrice,
    double? fuPrice,
    String exteraDesc,
    int createdAt,
    int updatedAt,
    int version,
    bool isDeleted,
    int? deletedAt,
  });

  $HesabCopyWith<$Res>? get parent;
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
  $Res call({
    Object? id = null,
    Object? levelF = null,
    Object? parent = freezed,
    Object? code = null,
    Object? descF = null,
    Object? crnPrice = freezed,
    Object? fuPrice = freezed,
    Object? exteraDesc = null,
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
            levelF: null == levelF
                ? _value.levelF
                : levelF // ignore: cast_nullable_to_non_nullable
                      as AccountLevel,
            parent: freezed == parent
                ? _value.parent
                : parent // ignore: cast_nullable_to_non_nullable
                      as Hesab?,
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
            descF: null == descF
                ? _value.descF
                : descF // ignore: cast_nullable_to_non_nullable
                      as String,
            crnPrice: freezed == crnPrice
                ? _value.crnPrice
                : crnPrice // ignore: cast_nullable_to_non_nullable
                      as double?,
            fuPrice: freezed == fuPrice
                ? _value.fuPrice
                : fuPrice // ignore: cast_nullable_to_non_nullable
                      as double?,
            exteraDesc: null == exteraDesc
                ? _value.exteraDesc
                : exteraDesc // ignore: cast_nullable_to_non_nullable
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

  /// Create a copy of Hesab
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HesabCopyWith<$Res>? get parent {
    if (_value.parent == null) {
      return null;
    }

    return $HesabCopyWith<$Res>(_value.parent!, (value) {
      return _then(_value.copyWith(parent: value) as $Val);
    });
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
    AccountLevel levelF,
    Hesab? parent,
    String code,
    String descF,
    double? crnPrice,
    double? fuPrice,
    String exteraDesc,
    int createdAt,
    int updatedAt,
    int version,
    bool isDeleted,
    int? deletedAt,
  });

  @override
  $HesabCopyWith<$Res>? get parent;
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
  $Res call({
    Object? id = null,
    Object? levelF = null,
    Object? parent = freezed,
    Object? code = null,
    Object? descF = null,
    Object? crnPrice = freezed,
    Object? fuPrice = freezed,
    Object? exteraDesc = null,
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
        levelF: null == levelF
            ? _value.levelF
            : levelF // ignore: cast_nullable_to_non_nullable
                  as AccountLevel,
        parent: freezed == parent
            ? _value.parent
            : parent // ignore: cast_nullable_to_non_nullable
                  as Hesab?,
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        descF: null == descF
            ? _value.descF
            : descF // ignore: cast_nullable_to_non_nullable
                  as String,
        crnPrice: freezed == crnPrice
            ? _value.crnPrice
            : crnPrice // ignore: cast_nullable_to_non_nullable
                  as double?,
        fuPrice: freezed == fuPrice
            ? _value.fuPrice
            : fuPrice // ignore: cast_nullable_to_non_nullable
                  as double?,
        exteraDesc: null == exteraDesc
            ? _value.exteraDesc
            : exteraDesc // ignore: cast_nullable_to_non_nullable
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
    required this.levelF,
    this.parent,
    required this.code,
    required this.descF,
    this.crnPrice,
    this.fuPrice,
    this.exteraDesc = '',
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
  final AccountLevel levelF;

  ///سرفصل اصلی
  @override
  final Hesab? parent;

  /// کد سرفصل
  @override
  final String code;

  /// توضیحات سرفصل
  @override
  final String descF;

  /// قیمت به ارز بومی
  @override
  final double? crnPrice;

  /// قیمت به ارز خارجی
  @override
  final double? fuPrice;

  /// توضیحات اضافی
  @override
  @JsonKey()
  final String exteraDesc;

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
    return 'Hesab(id: $id, levelF: $levelF, parent: $parent, code: $code, descF: $descF, crnPrice: $crnPrice, fuPrice: $fuPrice, exteraDesc: $exteraDesc, createdAt: $createdAt, updatedAt: $updatedAt, version: $version, isDeleted: $isDeleted, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HesabImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.levelF, levelF) || other.levelF == levelF) &&
            (identical(other.parent, parent) || other.parent == parent) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.descF, descF) || other.descF == descF) &&
            (identical(other.crnPrice, crnPrice) ||
                other.crnPrice == crnPrice) &&
            (identical(other.fuPrice, fuPrice) || other.fuPrice == fuPrice) &&
            (identical(other.exteraDesc, exteraDesc) ||
                other.exteraDesc == exteraDesc) &&
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
    levelF,
    parent,
    code,
    descF,
    crnPrice,
    fuPrice,
    exteraDesc,
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
    required final AccountLevel levelF,
    final Hesab? parent,
    required final String code,
    required final String descF,
    final double? crnPrice,
    final double? fuPrice,
    final String exteraDesc,
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
  AccountLevel get levelF;

  ///سرفصل اصلی
  @override
  Hesab? get parent;

  /// کد سرفصل
  @override
  String get code;

  /// توضیحات سرفصل
  @override
  String get descF;

  /// قیمت به ارز بومی
  @override
  double? get crnPrice;

  /// قیمت به ارز خارجی
  @override
  double? get fuPrice;

  /// توضیحات اضافی
  @override
  String get exteraDesc;

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
