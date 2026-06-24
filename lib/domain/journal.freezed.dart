// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'journal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Journal {
  /// شناسه یکتا (UUID)
  String get id => throw _privateConstructorUsedError;

  /// شماره مبنا سند (Auto-increment) **حذف شده
  // required int noSnd,
  /// شماره مرجع سند (بر اساس تاریخ)
  int? get referenceNumber => throw _privateConstructorUsedError;

  /// تاریخ سند (میلی‌ثانیه)
  int get date => throw _privateConstructorUsedError;

  /// توضیحات سند
  String get description => throw _privateConstructorUsedError;

  /// آیا سند به‌طور خودکار تولید شده است؟
  bool get isAuto => throw _privateConstructorUsedError;

  /// کد ارز (مثث IRR، USD)
  String get currencyCode => throw _privateConstructorUsedError;

  /// آیا سند امضا شده است؟
  bool get signed => throw _privateConstructorUsedError;

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

  /// Create a copy of Journal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JournalCopyWith<Journal> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JournalCopyWith<$Res> {
  factory $JournalCopyWith(Journal value, $Res Function(Journal) then) =
      _$JournalCopyWithImpl<$Res, Journal>;
  @useResult
  $Res call({
    String id,
    int? referenceNumber,
    int date,
    String description,
    bool isAuto,
    String currencyCode,
    bool signed,
    int createdAt,
    int updatedAt,
    int version,
    bool isDeleted,
    int? deletedAt,
  });
}

/// @nodoc
class _$JournalCopyWithImpl<$Res, $Val extends Journal>
    implements $JournalCopyWith<$Res> {
  _$JournalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Journal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? referenceNumber = freezed,
    Object? date = null,
    Object? description = null,
    Object? isAuto = null,
    Object? currencyCode = null,
    Object? signed = null,
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
            referenceNumber: freezed == referenceNumber
                ? _value.referenceNumber
                : referenceNumber // ignore: cast_nullable_to_non_nullable
                      as int?,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as int,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            isAuto: null == isAuto
                ? _value.isAuto
                : isAuto // ignore: cast_nullable_to_non_nullable
                      as bool,
            currencyCode: null == currencyCode
                ? _value.currencyCode
                : currencyCode // ignore: cast_nullable_to_non_nullable
                      as String,
            signed: null == signed
                ? _value.signed
                : signed // ignore: cast_nullable_to_non_nullable
                      as bool,
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
abstract class _$$JournalImplCopyWith<$Res> implements $JournalCopyWith<$Res> {
  factory _$$JournalImplCopyWith(
    _$JournalImpl value,
    $Res Function(_$JournalImpl) then,
  ) = __$$JournalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    int? referenceNumber,
    int date,
    String description,
    bool isAuto,
    String currencyCode,
    bool signed,
    int createdAt,
    int updatedAt,
    int version,
    bool isDeleted,
    int? deletedAt,
  });
}

/// @nodoc
class __$$JournalImplCopyWithImpl<$Res>
    extends _$JournalCopyWithImpl<$Res, _$JournalImpl>
    implements _$$JournalImplCopyWith<$Res> {
  __$$JournalImplCopyWithImpl(
    _$JournalImpl _value,
    $Res Function(_$JournalImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Journal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? referenceNumber = freezed,
    Object? date = null,
    Object? description = null,
    Object? isAuto = null,
    Object? currencyCode = null,
    Object? signed = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? version = null,
    Object? isDeleted = null,
    Object? deletedAt = freezed,
  }) {
    return _then(
      _$JournalImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        referenceNumber: freezed == referenceNumber
            ? _value.referenceNumber
            : referenceNumber // ignore: cast_nullable_to_non_nullable
                  as int?,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as int,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        isAuto: null == isAuto
            ? _value.isAuto
            : isAuto // ignore: cast_nullable_to_non_nullable
                  as bool,
        currencyCode: null == currencyCode
            ? _value.currencyCode
            : currencyCode // ignore: cast_nullable_to_non_nullable
                  as String,
        signed: null == signed
            ? _value.signed
            : signed // ignore: cast_nullable_to_non_nullable
                  as bool,
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

class _$JournalImpl extends _Journal {
  const _$JournalImpl({
    required this.id,
    this.referenceNumber,
    required this.date,
    this.description = '',
    this.isAuto = false,
    this.currencyCode = 'IRR',
    this.signed = false,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
    required this.isDeleted,
    this.deletedAt,
  }) : super._();

  /// شناسه یکتا (UUID)
  @override
  final String id;

  /// شماره مبنا سند (Auto-increment) **حذف شده
  // required int noSnd,
  /// شماره مرجع سند (بر اساس تاریخ)
  @override
  final int? referenceNumber;

  /// تاریخ سند (میلی‌ثانیه)
  @override
  final int date;

  /// توضیحات سند
  @override
  @JsonKey()
  final String description;

  /// آیا سند به‌طور خودکار تولید شده است؟
  @override
  @JsonKey()
  final bool isAuto;

  /// کد ارز (مثث IRR، USD)
  @override
  @JsonKey()
  final String currencyCode;

  /// آیا سند امضا شده است؟
  @override
  @JsonKey()
  final bool signed;

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
    return 'Journal(id: $id, referenceNumber: $referenceNumber, date: $date, description: $description, isAuto: $isAuto, currencyCode: $currencyCode, signed: $signed, createdAt: $createdAt, updatedAt: $updatedAt, version: $version, isDeleted: $isDeleted, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JournalImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.referenceNumber, referenceNumber) ||
                other.referenceNumber == referenceNumber) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isAuto, isAuto) || other.isAuto == isAuto) &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode) &&
            (identical(other.signed, signed) || other.signed == signed) &&
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
    referenceNumber,
    date,
    description,
    isAuto,
    currencyCode,
    signed,
    createdAt,
    updatedAt,
    version,
    isDeleted,
    deletedAt,
  );

  /// Create a copy of Journal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JournalImplCopyWith<_$JournalImpl> get copyWith =>
      __$$JournalImplCopyWithImpl<_$JournalImpl>(this, _$identity);
}

abstract class _Journal extends Journal {
  const factory _Journal({
    required final String id,
    final int? referenceNumber,
    required final int date,
    final String description,
    final bool isAuto,
    final String currencyCode,
    final bool signed,
    required final int createdAt,
    required final int updatedAt,
    required final int version,
    required final bool isDeleted,
    final int? deletedAt,
  }) = _$JournalImpl;
  const _Journal._() : super._();

  /// شناسه یکتا (UUID)
  @override
  String get id;

  /// شماره مبنا سند (Auto-increment) **حذف شده
  // required int noSnd,
  /// شماره مرجع سند (بر اساس تاریخ)
  @override
  int? get referenceNumber;

  /// تاریخ سند (میلی‌ثانیه)
  @override
  int get date;

  /// توضیحات سند
  @override
  String get description;

  /// آیا سند به‌طور خودکار تولید شده است؟
  @override
  bool get isAuto;

  /// کد ارز (مثث IRR، USD)
  @override
  String get currencyCode;

  /// آیا سند امضا شده است؟
  @override
  bool get signed;

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

  /// Create a copy of Journal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JournalImplCopyWith<_$JournalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
