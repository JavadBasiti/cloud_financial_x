// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'journal_row.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$JournalRow {
  /// شناسه یکتا (UUID)
  String get id => throw _privateConstructorUsedError;

  /// تاریخ سند (میلی‌ثانیه)
  int get date => throw _privateConstructorUsedError;

  /// شماره سند
  int get noSnd => throw _privateConstructorUsedError;

  /// شماره ردیف در سند
  int get rowF => throw _privateConstructorUsedError;

  /// شناسه سرفصل (Hesab ID)
  String get hesabId => throw _privateConstructorUsedError;

  /// مبلغ بستانکار ردیف
  double get prBest => throw _privateConstructorUsedError;

  /// مبلغ بدهکار ردیف
  double get prBed => throw _privateConstructorUsedError;

  /// لینک مدیا (عکس، صوت، فایل مستند)
  String get media => throw _privateConstructorUsedError;

  /// توضیحات ردیف
  String get descRow => throw _privateConstructorUsedError;

  /// کد ارز (مثلاً IRR، USD)
  String get currencyCode => throw _privateConstructorUsedError;

  /// شناسه مرکز هزینه (Cost Center ID)
  String get costCenterId => throw _privateConstructorUsedError;

  /// آیا ردیف به‌طور خودکار تولید شده است؟
  bool get isAuto => throw _privateConstructorUsedError;

  /// شناسه سند (Journal ID)
  String get journalId => throw _privateConstructorUsedError;

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

  /// Create a copy of JournalRow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JournalRowCopyWith<JournalRow> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JournalRowCopyWith<$Res> {
  factory $JournalRowCopyWith(
    JournalRow value,
    $Res Function(JournalRow) then,
  ) = _$JournalRowCopyWithImpl<$Res, JournalRow>;
  @useResult
  $Res call({
    String id,
    int date,
    int noSnd,
    int rowF,
    String hesabId,
    double prBest,
    double prBed,
    String media,
    String descRow,
    String currencyCode,
    String costCenterId,
    bool isAuto,
    String journalId,
    int createdAt,
    int updatedAt,
    int version,
    bool isDeleted,
    int? deletedAt,
  });
}

/// @nodoc
class _$JournalRowCopyWithImpl<$Res, $Val extends JournalRow>
    implements $JournalRowCopyWith<$Res> {
  _$JournalRowCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JournalRow
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? noSnd = null,
    Object? rowF = null,
    Object? hesabId = null,
    Object? prBest = null,
    Object? prBed = null,
    Object? media = null,
    Object? descRow = null,
    Object? currencyCode = null,
    Object? costCenterId = null,
    Object? isAuto = null,
    Object? journalId = null,
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
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as int,
            noSnd: null == noSnd
                ? _value.noSnd
                : noSnd // ignore: cast_nullable_to_non_nullable
                      as int,
            rowF: null == rowF
                ? _value.rowF
                : rowF // ignore: cast_nullable_to_non_nullable
                      as int,
            hesabId: null == hesabId
                ? _value.hesabId
                : hesabId // ignore: cast_nullable_to_non_nullable
                      as String,
            prBest: null == prBest
                ? _value.prBest
                : prBest // ignore: cast_nullable_to_non_nullable
                      as double,
            prBed: null == prBed
                ? _value.prBed
                : prBed // ignore: cast_nullable_to_non_nullable
                      as double,
            media: null == media
                ? _value.media
                : media // ignore: cast_nullable_to_non_nullable
                      as String,
            descRow: null == descRow
                ? _value.descRow
                : descRow // ignore: cast_nullable_to_non_nullable
                      as String,
            currencyCode: null == currencyCode
                ? _value.currencyCode
                : currencyCode // ignore: cast_nullable_to_non_nullable
                      as String,
            costCenterId: null == costCenterId
                ? _value.costCenterId
                : costCenterId // ignore: cast_nullable_to_non_nullable
                      as String,
            isAuto: null == isAuto
                ? _value.isAuto
                : isAuto // ignore: cast_nullable_to_non_nullable
                      as bool,
            journalId: null == journalId
                ? _value.journalId
                : journalId // ignore: cast_nullable_to_non_nullable
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
abstract class _$$JournalRowImplCopyWith<$Res>
    implements $JournalRowCopyWith<$Res> {
  factory _$$JournalRowImplCopyWith(
    _$JournalRowImpl value,
    $Res Function(_$JournalRowImpl) then,
  ) = __$$JournalRowImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    int date,
    int noSnd,
    int rowF,
    String hesabId,
    double prBest,
    double prBed,
    String media,
    String descRow,
    String currencyCode,
    String costCenterId,
    bool isAuto,
    String journalId,
    int createdAt,
    int updatedAt,
    int version,
    bool isDeleted,
    int? deletedAt,
  });
}

/// @nodoc
class __$$JournalRowImplCopyWithImpl<$Res>
    extends _$JournalRowCopyWithImpl<$Res, _$JournalRowImpl>
    implements _$$JournalRowImplCopyWith<$Res> {
  __$$JournalRowImplCopyWithImpl(
    _$JournalRowImpl _value,
    $Res Function(_$JournalRowImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of JournalRow
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? noSnd = null,
    Object? rowF = null,
    Object? hesabId = null,
    Object? prBest = null,
    Object? prBed = null,
    Object? media = null,
    Object? descRow = null,
    Object? currencyCode = null,
    Object? costCenterId = null,
    Object? isAuto = null,
    Object? journalId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? version = null,
    Object? isDeleted = null,
    Object? deletedAt = freezed,
  }) {
    return _then(
      _$JournalRowImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as int,
        noSnd: null == noSnd
            ? _value.noSnd
            : noSnd // ignore: cast_nullable_to_non_nullable
                  as int,
        rowF: null == rowF
            ? _value.rowF
            : rowF // ignore: cast_nullable_to_non_nullable
                  as int,
        hesabId: null == hesabId
            ? _value.hesabId
            : hesabId // ignore: cast_nullable_to_non_nullable
                  as String,
        prBest: null == prBest
            ? _value.prBest
            : prBest // ignore: cast_nullable_to_non_nullable
                  as double,
        prBed: null == prBed
            ? _value.prBed
            : prBed // ignore: cast_nullable_to_non_nullable
                  as double,
        media: null == media
            ? _value.media
            : media // ignore: cast_nullable_to_non_nullable
                  as String,
        descRow: null == descRow
            ? _value.descRow
            : descRow // ignore: cast_nullable_to_non_nullable
                  as String,
        currencyCode: null == currencyCode
            ? _value.currencyCode
            : currencyCode // ignore: cast_nullable_to_non_nullable
                  as String,
        costCenterId: null == costCenterId
            ? _value.costCenterId
            : costCenterId // ignore: cast_nullable_to_non_nullable
                  as String,
        isAuto: null == isAuto
            ? _value.isAuto
            : isAuto // ignore: cast_nullable_to_non_nullable
                  as bool,
        journalId: null == journalId
            ? _value.journalId
            : journalId // ignore: cast_nullable_to_non_nullable
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

class _$JournalRowImpl extends _JournalRow {
  const _$JournalRowImpl({
    required this.id,
    required this.date,
    required this.noSnd,
    required this.rowF,
    required this.hesabId,
    this.prBest = 0,
    this.prBed = 0,
    this.media = '',
    this.descRow = '',
    this.currencyCode = 'IRR',
    required this.costCenterId,
    this.isAuto = false,
    required this.journalId,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
    required this.isDeleted,
    this.deletedAt,
  }) : super._();

  /// شناسه یکتا (UUID)
  @override
  final String id;

  /// تاریخ سند (میلی‌ثانیه)
  @override
  final int date;

  /// شماره سند
  @override
  final int noSnd;

  /// شماره ردیف در سند
  @override
  final int rowF;

  /// شناسه سرفصل (Hesab ID)
  @override
  final String hesabId;

  /// مبلغ بستانکار ردیف
  @override
  @JsonKey()
  final double prBest;

  /// مبلغ بدهکار ردیف
  @override
  @JsonKey()
  final double prBed;

  /// لینک مدیا (عکس، صوت، فایل مستند)
  @override
  @JsonKey()
  final String media;

  /// توضیحات ردیف
  @override
  @JsonKey()
  final String descRow;

  /// کد ارز (مثلاً IRR، USD)
  @override
  @JsonKey()
  final String currencyCode;

  /// شناسه مرکز هزینه (Cost Center ID)
  @override
  final String costCenterId;

  /// آیا ردیف به‌طور خودکار تولید شده است؟
  @override
  @JsonKey()
  final bool isAuto;

  /// شناسه سند (Journal ID)
  @override
  final String journalId;

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
    return 'JournalRow(id: $id, date: $date, noSnd: $noSnd, rowF: $rowF, hesabId: $hesabId, prBest: $prBest, prBed: $prBed, media: $media, descRow: $descRow, currencyCode: $currencyCode, costCenterId: $costCenterId, isAuto: $isAuto, journalId: $journalId, createdAt: $createdAt, updatedAt: $updatedAt, version: $version, isDeleted: $isDeleted, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JournalRowImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.noSnd, noSnd) || other.noSnd == noSnd) &&
            (identical(other.rowF, rowF) || other.rowF == rowF) &&
            (identical(other.hesabId, hesabId) || other.hesabId == hesabId) &&
            (identical(other.prBest, prBest) || other.prBest == prBest) &&
            (identical(other.prBed, prBed) || other.prBed == prBed) &&
            (identical(other.media, media) || other.media == media) &&
            (identical(other.descRow, descRow) || other.descRow == descRow) &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode) &&
            (identical(other.costCenterId, costCenterId) ||
                other.costCenterId == costCenterId) &&
            (identical(other.isAuto, isAuto) || other.isAuto == isAuto) &&
            (identical(other.journalId, journalId) ||
                other.journalId == journalId) &&
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
    date,
    noSnd,
    rowF,
    hesabId,
    prBest,
    prBed,
    media,
    descRow,
    currencyCode,
    costCenterId,
    isAuto,
    journalId,
    createdAt,
    updatedAt,
    version,
    isDeleted,
    deletedAt,
  );

  /// Create a copy of JournalRow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JournalRowImplCopyWith<_$JournalRowImpl> get copyWith =>
      __$$JournalRowImplCopyWithImpl<_$JournalRowImpl>(this, _$identity);
}

abstract class _JournalRow extends JournalRow {
  const factory _JournalRow({
    required final String id,
    required final int date,
    required final int noSnd,
    required final int rowF,
    required final String hesabId,
    final double prBest,
    final double prBed,
    final String media,
    final String descRow,
    final String currencyCode,
    required final String costCenterId,
    final bool isAuto,
    required final String journalId,
    required final int createdAt,
    required final int updatedAt,
    required final int version,
    required final bool isDeleted,
    final int? deletedAt,
  }) = _$JournalRowImpl;
  const _JournalRow._() : super._();

  /// شناسه یکتا (UUID)
  @override
  String get id;

  /// تاریخ سند (میلی‌ثانیه)
  @override
  int get date;

  /// شماره سند
  @override
  int get noSnd;

  /// شماره ردیف در سند
  @override
  int get rowF;

  /// شناسه سرفصل (Hesab ID)
  @override
  String get hesabId;

  /// مبلغ بستانکار ردیف
  @override
  double get prBest;

  /// مبلغ بدهکار ردیف
  @override
  double get prBed;

  /// لینک مدیا (عکس، صوت، فایل مستند)
  @override
  String get media;

  /// توضیحات ردیف
  @override
  String get descRow;

  /// کد ارز (مثلاً IRR، USD)
  @override
  String get currencyCode;

  /// شناسه مرکز هزینه (Cost Center ID)
  @override
  String get costCenterId;

  /// آیا ردیف به‌طور خودکار تولید شده است؟
  @override
  bool get isAuto;

  /// شناسه سند (Journal ID)
  @override
  String get journalId;

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

  /// Create a copy of JournalRow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JournalRowImplCopyWith<_$JournalRowImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
