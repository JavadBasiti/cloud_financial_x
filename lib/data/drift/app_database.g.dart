// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ProductsTable extends Products with TableInfo<$ProductsTable, Product> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 36,
      maxTextLength: 36,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descFMeta = const VerificationMeta('descF');
  @override
  late final GeneratedColumn<String> descF = GeneratedColumn<String>(
    'desc_f',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
    'unit',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unit2Meta = const VerificationMeta('unit2');
  @override
  late final GeneratedColumn<String> unit2 = GeneratedColumn<String>(
    'unit2',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 80,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _feeMeta = const VerificationMeta('fee');
  @override
  late final GeneratedColumn<double> fee = GeneratedColumn<double>(
    'fee',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _zaribU2Meta = const VerificationMeta(
    'zaribU2',
  );
  @override
  late final GeneratedColumn<double> zaribU2 = GeneratedColumn<double>(
    'zarib_u2',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(1.0),
  );
  static const VerificationMeta _buyFeeMeta = const VerificationMeta('buyFee');
  @override
  late final GeneratedColumn<double> buyFee = GeneratedColumn<double>(
    'buy_fee',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _buyFee2Meta = const VerificationMeta(
    'buyFee2',
  );
  @override
  late final GeneratedColumn<double> buyFee2 = GeneratedColumn<double>(
    'buy_fee2',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _buyPercentMeta = const VerificationMeta(
    'buyPercent',
  );
  @override
  late final GeneratedColumn<double> buyPercent = GeneratedColumn<double>(
    'buy_percent',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _saleFeeMeta = const VerificationMeta(
    'saleFee',
  );
  @override
  late final GeneratedColumn<double> saleFee = GeneratedColumn<double>(
    'sale_fee',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _minLmMeta = const VerificationMeta('minLm');
  @override
  late final GeneratedColumn<double> minLm = GeneratedColumn<double>(
    'min_lm',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _maxLmMeta = const VerificationMeta('maxLm');
  @override
  late final GeneratedColumn<double> maxLm = GeneratedColumn<double>(
    'max_lm',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _formFeeMeta = const VerificationMeta(
    'formFee',
  );
  @override
  late final GeneratedColumn<double> formFee = GeneratedColumn<double>(
    'form_fee',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<int> deletedAt = GeneratedColumn<int>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
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
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(
    Insertable<Product> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('desc_f')) {
      context.handle(
        _descFMeta,
        descF.isAcceptableOrUnknown(data['desc_f']!, _descFMeta),
      );
    } else if (isInserting) {
      context.missing(_descFMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
        _unitMeta,
        unit.isAcceptableOrUnknown(data['unit']!, _unitMeta),
      );
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('unit2')) {
      context.handle(
        _unit2Meta,
        unit2.isAcceptableOrUnknown(data['unit2']!, _unit2Meta),
      );
    } else if (isInserting) {
      context.missing(_unit2Meta);
    }
    if (data.containsKey('fee')) {
      context.handle(
        _feeMeta,
        fee.isAcceptableOrUnknown(data['fee']!, _feeMeta),
      );
    }
    if (data.containsKey('zarib_u2')) {
      context.handle(
        _zaribU2Meta,
        zaribU2.isAcceptableOrUnknown(data['zarib_u2']!, _zaribU2Meta),
      );
    }
    if (data.containsKey('buy_fee')) {
      context.handle(
        _buyFeeMeta,
        buyFee.isAcceptableOrUnknown(data['buy_fee']!, _buyFeeMeta),
      );
    }
    if (data.containsKey('buy_fee2')) {
      context.handle(
        _buyFee2Meta,
        buyFee2.isAcceptableOrUnknown(data['buy_fee2']!, _buyFee2Meta),
      );
    }
    if (data.containsKey('buy_percent')) {
      context.handle(
        _buyPercentMeta,
        buyPercent.isAcceptableOrUnknown(data['buy_percent']!, _buyPercentMeta),
      );
    }
    if (data.containsKey('sale_fee')) {
      context.handle(
        _saleFeeMeta,
        saleFee.isAcceptableOrUnknown(data['sale_fee']!, _saleFeeMeta),
      );
    }
    if (data.containsKey('min_lm')) {
      context.handle(
        _minLmMeta,
        minLm.isAcceptableOrUnknown(data['min_lm']!, _minLmMeta),
      );
    }
    if (data.containsKey('max_lm')) {
      context.handle(
        _maxLmMeta,
        maxLm.isAcceptableOrUnknown(data['max_lm']!, _maxLmMeta),
      );
    }
    if (data.containsKey('form_fee')) {
      context.handle(
        _formFeeMeta,
        formFee.isAcceptableOrUnknown(data['form_fee']!, _formFeeMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {code},
  ];
  @override
  Product map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Product(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      descF: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}desc_f'],
      )!,
      unit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit'],
      )!,
      unit2: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit2'],
      )!,
      fee: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}fee'],
      ),
      zaribU2: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}zarib_u2'],
      ),
      buyFee: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}buy_fee'],
      ),
      buyFee2: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}buy_fee2'],
      ),
      buyPercent: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}buy_percent'],
      ),
      saleFee: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}sale_fee'],
      ),
      minLm: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}min_lm'],
      ),
      maxLm: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}max_lm'],
      ),
      formFee: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}form_fee'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}deleted_at'],
      ),
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }
}

class Product extends DataClass implements Insertable<Product> {
  final String id;
  final String code;
  final String descF;
  final String unit;
  final String unit2;
  final double? fee;
  final double? zaribU2;
  final double? buyFee;
  final double? buyFee2;
  final double? buyPercent;
  final double? saleFee;
  final double? minLm;
  final double? maxLm;
  final double? formFee;
  final int createdAt;
  final int updatedAt;
  final int version;
  final bool isDeleted;
  final int? deletedAt;
  const Product({
    required this.id,
    required this.code,
    required this.descF,
    required this.unit,
    required this.unit2,
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
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['code'] = Variable<String>(code);
    map['desc_f'] = Variable<String>(descF);
    map['unit'] = Variable<String>(unit);
    map['unit2'] = Variable<String>(unit2);
    if (!nullToAbsent || fee != null) {
      map['fee'] = Variable<double>(fee);
    }
    if (!nullToAbsent || zaribU2 != null) {
      map['zarib_u2'] = Variable<double>(zaribU2);
    }
    if (!nullToAbsent || buyFee != null) {
      map['buy_fee'] = Variable<double>(buyFee);
    }
    if (!nullToAbsent || buyFee2 != null) {
      map['buy_fee2'] = Variable<double>(buyFee2);
    }
    if (!nullToAbsent || buyPercent != null) {
      map['buy_percent'] = Variable<double>(buyPercent);
    }
    if (!nullToAbsent || saleFee != null) {
      map['sale_fee'] = Variable<double>(saleFee);
    }
    if (!nullToAbsent || minLm != null) {
      map['min_lm'] = Variable<double>(minLm);
    }
    if (!nullToAbsent || maxLm != null) {
      map['max_lm'] = Variable<double>(maxLm);
    }
    if (!nullToAbsent || formFee != null) {
      map['form_fee'] = Variable<double>(formFee);
    }
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    map['version'] = Variable<int>(version);
    map['is_deleted'] = Variable<bool>(isDeleted);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<int>(deletedAt);
    }
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      id: Value(id),
      code: Value(code),
      descF: Value(descF),
      unit: Value(unit),
      unit2: Value(unit2),
      fee: fee == null && nullToAbsent ? const Value.absent() : Value(fee),
      zaribU2: zaribU2 == null && nullToAbsent
          ? const Value.absent()
          : Value(zaribU2),
      buyFee: buyFee == null && nullToAbsent
          ? const Value.absent()
          : Value(buyFee),
      buyFee2: buyFee2 == null && nullToAbsent
          ? const Value.absent()
          : Value(buyFee2),
      buyPercent: buyPercent == null && nullToAbsent
          ? const Value.absent()
          : Value(buyPercent),
      saleFee: saleFee == null && nullToAbsent
          ? const Value.absent()
          : Value(saleFee),
      minLm: minLm == null && nullToAbsent
          ? const Value.absent()
          : Value(minLm),
      maxLm: maxLm == null && nullToAbsent
          ? const Value.absent()
          : Value(maxLm),
      formFee: formFee == null && nullToAbsent
          ? const Value.absent()
          : Value(formFee),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      version: Value(version),
      isDeleted: Value(isDeleted),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory Product.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Product(
      id: serializer.fromJson<String>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      descF: serializer.fromJson<String>(json['descF']),
      unit: serializer.fromJson<String>(json['unit']),
      unit2: serializer.fromJson<String>(json['unit2']),
      fee: serializer.fromJson<double?>(json['fee']),
      zaribU2: serializer.fromJson<double?>(json['zaribU2']),
      buyFee: serializer.fromJson<double?>(json['buyFee']),
      buyFee2: serializer.fromJson<double?>(json['buyFee2']),
      buyPercent: serializer.fromJson<double?>(json['buyPercent']),
      saleFee: serializer.fromJson<double?>(json['saleFee']),
      minLm: serializer.fromJson<double?>(json['minLm']),
      maxLm: serializer.fromJson<double?>(json['maxLm']),
      formFee: serializer.fromJson<double?>(json['formFee']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
      version: serializer.fromJson<int>(json['version']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      deletedAt: serializer.fromJson<int?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'code': serializer.toJson<String>(code),
      'descF': serializer.toJson<String>(descF),
      'unit': serializer.toJson<String>(unit),
      'unit2': serializer.toJson<String>(unit2),
      'fee': serializer.toJson<double?>(fee),
      'zaribU2': serializer.toJson<double?>(zaribU2),
      'buyFee': serializer.toJson<double?>(buyFee),
      'buyFee2': serializer.toJson<double?>(buyFee2),
      'buyPercent': serializer.toJson<double?>(buyPercent),
      'saleFee': serializer.toJson<double?>(saleFee),
      'minLm': serializer.toJson<double?>(minLm),
      'maxLm': serializer.toJson<double?>(maxLm),
      'formFee': serializer.toJson<double?>(formFee),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
      'version': serializer.toJson<int>(version),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'deletedAt': serializer.toJson<int?>(deletedAt),
    };
  }

  Product copyWith({
    String? id,
    String? code,
    String? descF,
    String? unit,
    String? unit2,
    Value<double?> fee = const Value.absent(),
    Value<double?> zaribU2 = const Value.absent(),
    Value<double?> buyFee = const Value.absent(),
    Value<double?> buyFee2 = const Value.absent(),
    Value<double?> buyPercent = const Value.absent(),
    Value<double?> saleFee = const Value.absent(),
    Value<double?> minLm = const Value.absent(),
    Value<double?> maxLm = const Value.absent(),
    Value<double?> formFee = const Value.absent(),
    int? createdAt,
    int? updatedAt,
    int? version,
    bool? isDeleted,
    Value<int?> deletedAt = const Value.absent(),
  }) => Product(
    id: id ?? this.id,
    code: code ?? this.code,
    descF: descF ?? this.descF,
    unit: unit ?? this.unit,
    unit2: unit2 ?? this.unit2,
    fee: fee.present ? fee.value : this.fee,
    zaribU2: zaribU2.present ? zaribU2.value : this.zaribU2,
    buyFee: buyFee.present ? buyFee.value : this.buyFee,
    buyFee2: buyFee2.present ? buyFee2.value : this.buyFee2,
    buyPercent: buyPercent.present ? buyPercent.value : this.buyPercent,
    saleFee: saleFee.present ? saleFee.value : this.saleFee,
    minLm: minLm.present ? minLm.value : this.minLm,
    maxLm: maxLm.present ? maxLm.value : this.maxLm,
    formFee: formFee.present ? formFee.value : this.formFee,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    version: version ?? this.version,
    isDeleted: isDeleted ?? this.isDeleted,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
  );
  Product copyWithCompanion(ProductsCompanion data) {
    return Product(
      id: data.id.present ? data.id.value : this.id,
      code: data.code.present ? data.code.value : this.code,
      descF: data.descF.present ? data.descF.value : this.descF,
      unit: data.unit.present ? data.unit.value : this.unit,
      unit2: data.unit2.present ? data.unit2.value : this.unit2,
      fee: data.fee.present ? data.fee.value : this.fee,
      zaribU2: data.zaribU2.present ? data.zaribU2.value : this.zaribU2,
      buyFee: data.buyFee.present ? data.buyFee.value : this.buyFee,
      buyFee2: data.buyFee2.present ? data.buyFee2.value : this.buyFee2,
      buyPercent: data.buyPercent.present
          ? data.buyPercent.value
          : this.buyPercent,
      saleFee: data.saleFee.present ? data.saleFee.value : this.saleFee,
      minLm: data.minLm.present ? data.minLm.value : this.minLm,
      maxLm: data.maxLm.present ? data.maxLm.value : this.maxLm,
      formFee: data.formFee.present ? data.formFee.value : this.formFee,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      version: data.version.present ? data.version.value : this.version,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Product(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('descF: $descF, ')
          ..write('unit: $unit, ')
          ..write('unit2: $unit2, ')
          ..write('fee: $fee, ')
          ..write('zaribU2: $zaribU2, ')
          ..write('buyFee: $buyFee, ')
          ..write('buyFee2: $buyFee2, ')
          ..write('buyPercent: $buyPercent, ')
          ..write('saleFee: $saleFee, ')
          ..write('minLm: $minLm, ')
          ..write('maxLm: $maxLm, ')
          ..write('formFee: $formFee, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
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
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          other.id == this.id &&
          other.code == this.code &&
          other.descF == this.descF &&
          other.unit == this.unit &&
          other.unit2 == this.unit2 &&
          other.fee == this.fee &&
          other.zaribU2 == this.zaribU2 &&
          other.buyFee == this.buyFee &&
          other.buyFee2 == this.buyFee2 &&
          other.buyPercent == this.buyPercent &&
          other.saleFee == this.saleFee &&
          other.minLm == this.minLm &&
          other.maxLm == this.maxLm &&
          other.formFee == this.formFee &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.version == this.version &&
          other.isDeleted == this.isDeleted &&
          other.deletedAt == this.deletedAt);
}

class ProductsCompanion extends UpdateCompanion<Product> {
  final Value<String> id;
  final Value<String> code;
  final Value<String> descF;
  final Value<String> unit;
  final Value<String> unit2;
  final Value<double?> fee;
  final Value<double?> zaribU2;
  final Value<double?> buyFee;
  final Value<double?> buyFee2;
  final Value<double?> buyPercent;
  final Value<double?> saleFee;
  final Value<double?> minLm;
  final Value<double?> maxLm;
  final Value<double?> formFee;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int> version;
  final Value<bool> isDeleted;
  final Value<int?> deletedAt;
  final Value<int> rowid;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.descF = const Value.absent(),
    this.unit = const Value.absent(),
    this.unit2 = const Value.absent(),
    this.fee = const Value.absent(),
    this.zaribU2 = const Value.absent(),
    this.buyFee = const Value.absent(),
    this.buyFee2 = const Value.absent(),
    this.buyPercent = const Value.absent(),
    this.saleFee = const Value.absent(),
    this.minLm = const Value.absent(),
    this.maxLm = const Value.absent(),
    this.formFee = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductsCompanion.insert({
    required String id,
    required String code,
    required String descF,
    required String unit,
    required String unit2,
    this.fee = const Value.absent(),
    this.zaribU2 = const Value.absent(),
    this.buyFee = const Value.absent(),
    this.buyFee2 = const Value.absent(),
    this.buyPercent = const Value.absent(),
    this.saleFee = const Value.absent(),
    this.minLm = const Value.absent(),
    this.maxLm = const Value.absent(),
    this.formFee = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.version = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       code = Value(code),
       descF = Value(descF),
       unit = Value(unit),
       unit2 = Value(unit2),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Product> custom({
    Expression<String>? id,
    Expression<String>? code,
    Expression<String>? descF,
    Expression<String>? unit,
    Expression<String>? unit2,
    Expression<double>? fee,
    Expression<double>? zaribU2,
    Expression<double>? buyFee,
    Expression<double>? buyFee2,
    Expression<double>? buyPercent,
    Expression<double>? saleFee,
    Expression<double>? minLm,
    Expression<double>? maxLm,
    Expression<double>? formFee,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? version,
    Expression<bool>? isDeleted,
    Expression<int>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (descF != null) 'desc_f': descF,
      if (unit != null) 'unit': unit,
      if (unit2 != null) 'unit2': unit2,
      if (fee != null) 'fee': fee,
      if (zaribU2 != null) 'zarib_u2': zaribU2,
      if (buyFee != null) 'buy_fee': buyFee,
      if (buyFee2 != null) 'buy_fee2': buyFee2,
      if (buyPercent != null) 'buy_percent': buyPercent,
      if (saleFee != null) 'sale_fee': saleFee,
      if (minLm != null) 'min_lm': minLm,
      if (maxLm != null) 'max_lm': maxLm,
      if (formFee != null) 'form_fee': formFee,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (version != null) 'version': version,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductsCompanion copyWith({
    Value<String>? id,
    Value<String>? code,
    Value<String>? descF,
    Value<String>? unit,
    Value<String>? unit2,
    Value<double?>? fee,
    Value<double?>? zaribU2,
    Value<double?>? buyFee,
    Value<double?>? buyFee2,
    Value<double?>? buyPercent,
    Value<double?>? saleFee,
    Value<double?>? minLm,
    Value<double?>? maxLm,
    Value<double?>? formFee,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int>? version,
    Value<bool>? isDeleted,
    Value<int?>? deletedAt,
    Value<int>? rowid,
  }) {
    return ProductsCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      descF: descF ?? this.descF,
      unit: unit ?? this.unit,
      unit2: unit2 ?? this.unit2,
      fee: fee ?? this.fee,
      zaribU2: zaribU2 ?? this.zaribU2,
      buyFee: buyFee ?? this.buyFee,
      buyFee2: buyFee2 ?? this.buyFee2,
      buyPercent: buyPercent ?? this.buyPercent,
      saleFee: saleFee ?? this.saleFee,
      minLm: minLm ?? this.minLm,
      maxLm: maxLm ?? this.maxLm,
      formFee: formFee ?? this.formFee,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      version: version ?? this.version,
      isDeleted: isDeleted ?? this.isDeleted,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (descF.present) {
      map['desc_f'] = Variable<String>(descF.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (unit2.present) {
      map['unit2'] = Variable<String>(unit2.value);
    }
    if (fee.present) {
      map['fee'] = Variable<double>(fee.value);
    }
    if (zaribU2.present) {
      map['zarib_u2'] = Variable<double>(zaribU2.value);
    }
    if (buyFee.present) {
      map['buy_fee'] = Variable<double>(buyFee.value);
    }
    if (buyFee2.present) {
      map['buy_fee2'] = Variable<double>(buyFee2.value);
    }
    if (buyPercent.present) {
      map['buy_percent'] = Variable<double>(buyPercent.value);
    }
    if (saleFee.present) {
      map['sale_fee'] = Variable<double>(saleFee.value);
    }
    if (minLm.present) {
      map['min_lm'] = Variable<double>(minLm.value);
    }
    if (maxLm.present) {
      map['max_lm'] = Variable<double>(maxLm.value);
    }
    if (formFee.present) {
      map['form_fee'] = Variable<double>(formFee.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<int>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('descF: $descF, ')
          ..write('unit: $unit, ')
          ..write('unit2: $unit2, ')
          ..write('fee: $fee, ')
          ..write('zaribU2: $zaribU2, ')
          ..write('buyFee: $buyFee, ')
          ..write('buyFee2: $buyFee2, ')
          ..write('buyPercent: $buyPercent, ')
          ..write('saleFee: $saleFee, ')
          ..write('minLm: $minLm, ')
          ..write('maxLm: $maxLm, ')
          ..write('formFee: $formFee, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncQueueTable extends SyncQueue
    with TableInfo<$SyncQueueTable, SyncQueueData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncQueueTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _entityTypeMeta = const VerificationMeta(
    'entityType',
  );
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
    'entity_type',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityIdMeta = const VerificationMeta(
    'entityId',
  );
  @override
  late final GeneratedColumn<String> entityId = GeneratedColumn<String>(
    'entity_id',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 36,
      maxTextLength: 36,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _operationMeta = const VerificationMeta(
    'operation',
  );
  @override
  late final GeneratedColumn<String> operation = GeneratedColumn<String>(
    'operation',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 6,
      maxTextLength: 6,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _retryCountMeta = const VerificationMeta(
    'retryCount',
  );
  @override
  late final GeneratedColumn<int> retryCount = GeneratedColumn<int>(
    'retry_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastErrorMeta = const VerificationMeta(
    'lastError',
  );
  @override
  late final GeneratedColumn<String> lastError = GeneratedColumn<String>(
    'last_error',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lockedAtMeta = const VerificationMeta(
    'lockedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lockedAt = GeneratedColumn<DateTime>(
    'locked_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    entityType,
    entityId,
    operation,
    payload,
    status,
    version,
    createdAt,
    retryCount,
    lastError,
    lockedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_queue';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncQueueData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('entity_type')) {
      context.handle(
        _entityTypeMeta,
        entityType.isAcceptableOrUnknown(data['entity_type']!, _entityTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(
        _entityIdMeta,
        entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta),
      );
    } else if (isInserting) {
      context.missing(_entityIdMeta);
    }
    if (data.containsKey('operation')) {
      context.handle(
        _operationMeta,
        operation.isAcceptableOrUnknown(data['operation']!, _operationMeta),
      );
    } else if (isInserting) {
      context.missing(_operationMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    } else if (isInserting) {
      context.missing(_versionMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('retry_count')) {
      context.handle(
        _retryCountMeta,
        retryCount.isAcceptableOrUnknown(data['retry_count']!, _retryCountMeta),
      );
    }
    if (data.containsKey('last_error')) {
      context.handle(
        _lastErrorMeta,
        lastError.isAcceptableOrUnknown(data['last_error']!, _lastErrorMeta),
      );
    }
    if (data.containsKey('locked_at')) {
      context.handle(
        _lockedAtMeta,
        lockedAt.isAcceptableOrUnknown(data['locked_at']!, _lockedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncQueueData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncQueueData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      entityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_type'],
      )!,
      entityId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_id'],
      )!,
      operation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}operation'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}status'],
      )!,
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      retryCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}retry_count'],
      )!,
      lastError: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_error'],
      ),
      lockedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}locked_at'],
      ),
    );
  }

  @override
  $SyncQueueTable createAlias(String alias) {
    return $SyncQueueTable(attachedDatabase, alias);
  }
}

class SyncQueueData extends DataClass implements Insertable<SyncQueueData> {
  /// Unique identifier for this sync record.
  /// Generated as UUID to ensure global uniqueness.
  final int id;

  /// Type of entity being synchronized (e.g., "product").
  /// Allows the system to route sync messages to appropriate handlers.
  /// Logical entity type (product, stock, factor, ...)
  final String entityType;

  /// UUID of the affected entity.
  /// Links this sync record to the actual entity in its respective table.
  final String entityId;

  /// Type of operation: INSERT, UPDATE, or DELETE.
  /// Used by sync logic to apply the correct mutation on the server.
  final String operation;

  /// JSON snapshot of the entity AFTER the mutation.
  /// Allows the server to receive the complete entity state without querying local DB.
  /// The payload is the source of truth for what to send to the server.
  final String payload;

  /// وضعیت پردازش
  final int status;

  /// Entity version at the time of the mutation.
  /// Used by the server's conflict resolution to determine which version is newer.
  final int version;

  /// Timestamp when the mutation occurred (epoch milliseconds).
  /// Used to establish ordering and for conflict resolution as a tiebreaker.
  /// Ordering + audit
  final int createdAt;

  /// Number of failed attempts to synchronize this record.
  /// Allows the system to implement exponential backoff and abandon hopelessly failed records.
  final int retryCount;

  /// Error message from the most recent failed sync attempt.
  /// Nullable, present only if a sync has been attempted and failed.
  /// Useful for debugging and monitoring.
  final String? lastError;

  /// برای lock خوش‌ساخت
  final DateTime? lockedAt;
  const SyncQueueData({
    required this.id,
    required this.entityType,
    required this.entityId,
    required this.operation,
    required this.payload,
    required this.status,
    required this.version,
    required this.createdAt,
    required this.retryCount,
    this.lastError,
    this.lockedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['entity_type'] = Variable<String>(entityType);
    map['entity_id'] = Variable<String>(entityId);
    map['operation'] = Variable<String>(operation);
    map['payload'] = Variable<String>(payload);
    map['status'] = Variable<int>(status);
    map['version'] = Variable<int>(version);
    map['created_at'] = Variable<int>(createdAt);
    map['retry_count'] = Variable<int>(retryCount);
    if (!nullToAbsent || lastError != null) {
      map['last_error'] = Variable<String>(lastError);
    }
    if (!nullToAbsent || lockedAt != null) {
      map['locked_at'] = Variable<DateTime>(lockedAt);
    }
    return map;
  }

  SyncQueueCompanion toCompanion(bool nullToAbsent) {
    return SyncQueueCompanion(
      id: Value(id),
      entityType: Value(entityType),
      entityId: Value(entityId),
      operation: Value(operation),
      payload: Value(payload),
      status: Value(status),
      version: Value(version),
      createdAt: Value(createdAt),
      retryCount: Value(retryCount),
      lastError: lastError == null && nullToAbsent
          ? const Value.absent()
          : Value(lastError),
      lockedAt: lockedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lockedAt),
    );
  }

  factory SyncQueueData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncQueueData(
      id: serializer.fromJson<int>(json['id']),
      entityType: serializer.fromJson<String>(json['entityType']),
      entityId: serializer.fromJson<String>(json['entityId']),
      operation: serializer.fromJson<String>(json['operation']),
      payload: serializer.fromJson<String>(json['payload']),
      status: serializer.fromJson<int>(json['status']),
      version: serializer.fromJson<int>(json['version']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      retryCount: serializer.fromJson<int>(json['retryCount']),
      lastError: serializer.fromJson<String?>(json['lastError']),
      lockedAt: serializer.fromJson<DateTime?>(json['lockedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'entityType': serializer.toJson<String>(entityType),
      'entityId': serializer.toJson<String>(entityId),
      'operation': serializer.toJson<String>(operation),
      'payload': serializer.toJson<String>(payload),
      'status': serializer.toJson<int>(status),
      'version': serializer.toJson<int>(version),
      'createdAt': serializer.toJson<int>(createdAt),
      'retryCount': serializer.toJson<int>(retryCount),
      'lastError': serializer.toJson<String?>(lastError),
      'lockedAt': serializer.toJson<DateTime?>(lockedAt),
    };
  }

  SyncQueueData copyWith({
    int? id,
    String? entityType,
    String? entityId,
    String? operation,
    String? payload,
    int? status,
    int? version,
    int? createdAt,
    int? retryCount,
    Value<String?> lastError = const Value.absent(),
    Value<DateTime?> lockedAt = const Value.absent(),
  }) => SyncQueueData(
    id: id ?? this.id,
    entityType: entityType ?? this.entityType,
    entityId: entityId ?? this.entityId,
    operation: operation ?? this.operation,
    payload: payload ?? this.payload,
    status: status ?? this.status,
    version: version ?? this.version,
    createdAt: createdAt ?? this.createdAt,
    retryCount: retryCount ?? this.retryCount,
    lastError: lastError.present ? lastError.value : this.lastError,
    lockedAt: lockedAt.present ? lockedAt.value : this.lockedAt,
  );
  SyncQueueData copyWithCompanion(SyncQueueCompanion data) {
    return SyncQueueData(
      id: data.id.present ? data.id.value : this.id,
      entityType: data.entityType.present
          ? data.entityType.value
          : this.entityType,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      operation: data.operation.present ? data.operation.value : this.operation,
      payload: data.payload.present ? data.payload.value : this.payload,
      status: data.status.present ? data.status.value : this.status,
      version: data.version.present ? data.version.value : this.version,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      retryCount: data.retryCount.present
          ? data.retryCount.value
          : this.retryCount,
      lastError: data.lastError.present ? data.lastError.value : this.lastError,
      lockedAt: data.lockedAt.present ? data.lockedAt.value : this.lockedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueData(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('operation: $operation, ')
          ..write('payload: $payload, ')
          ..write('status: $status, ')
          ..write('version: $version, ')
          ..write('createdAt: $createdAt, ')
          ..write('retryCount: $retryCount, ')
          ..write('lastError: $lastError, ')
          ..write('lockedAt: $lockedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    entityType,
    entityId,
    operation,
    payload,
    status,
    version,
    createdAt,
    retryCount,
    lastError,
    lockedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncQueueData &&
          other.id == this.id &&
          other.entityType == this.entityType &&
          other.entityId == this.entityId &&
          other.operation == this.operation &&
          other.payload == this.payload &&
          other.status == this.status &&
          other.version == this.version &&
          other.createdAt == this.createdAt &&
          other.retryCount == this.retryCount &&
          other.lastError == this.lastError &&
          other.lockedAt == this.lockedAt);
}

class SyncQueueCompanion extends UpdateCompanion<SyncQueueData> {
  final Value<int> id;
  final Value<String> entityType;
  final Value<String> entityId;
  final Value<String> operation;
  final Value<String> payload;
  final Value<int> status;
  final Value<int> version;
  final Value<int> createdAt;
  final Value<int> retryCount;
  final Value<String?> lastError;
  final Value<DateTime?> lockedAt;
  const SyncQueueCompanion({
    this.id = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
    this.operation = const Value.absent(),
    this.payload = const Value.absent(),
    this.status = const Value.absent(),
    this.version = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.retryCount = const Value.absent(),
    this.lastError = const Value.absent(),
    this.lockedAt = const Value.absent(),
  });
  SyncQueueCompanion.insert({
    this.id = const Value.absent(),
    required String entityType,
    required String entityId,
    required String operation,
    required String payload,
    this.status = const Value.absent(),
    required int version,
    required int createdAt,
    this.retryCount = const Value.absent(),
    this.lastError = const Value.absent(),
    this.lockedAt = const Value.absent(),
  }) : entityType = Value(entityType),
       entityId = Value(entityId),
       operation = Value(operation),
       payload = Value(payload),
       version = Value(version),
       createdAt = Value(createdAt);
  static Insertable<SyncQueueData> custom({
    Expression<int>? id,
    Expression<String>? entityType,
    Expression<String>? entityId,
    Expression<String>? operation,
    Expression<String>? payload,
    Expression<int>? status,
    Expression<int>? version,
    Expression<int>? createdAt,
    Expression<int>? retryCount,
    Expression<String>? lastError,
    Expression<DateTime>? lockedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entityType != null) 'entity_type': entityType,
      if (entityId != null) 'entity_id': entityId,
      if (operation != null) 'operation': operation,
      if (payload != null) 'payload': payload,
      if (status != null) 'status': status,
      if (version != null) 'version': version,
      if (createdAt != null) 'created_at': createdAt,
      if (retryCount != null) 'retry_count': retryCount,
      if (lastError != null) 'last_error': lastError,
      if (lockedAt != null) 'locked_at': lockedAt,
    });
  }

  SyncQueueCompanion copyWith({
    Value<int>? id,
    Value<String>? entityType,
    Value<String>? entityId,
    Value<String>? operation,
    Value<String>? payload,
    Value<int>? status,
    Value<int>? version,
    Value<int>? createdAt,
    Value<int>? retryCount,
    Value<String?>? lastError,
    Value<DateTime?>? lockedAt,
  }) {
    return SyncQueueCompanion(
      id: id ?? this.id,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      operation: operation ?? this.operation,
      payload: payload ?? this.payload,
      status: status ?? this.status,
      version: version ?? this.version,
      createdAt: createdAt ?? this.createdAt,
      retryCount: retryCount ?? this.retryCount,
      lastError: lastError ?? this.lastError,
      lockedAt: lockedAt ?? this.lockedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<String>(entityId.value);
    }
    if (operation.present) {
      map['operation'] = Variable<String>(operation.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (retryCount.present) {
      map['retry_count'] = Variable<int>(retryCount.value);
    }
    if (lastError.present) {
      map['last_error'] = Variable<String>(lastError.value);
    }
    if (lockedAt.present) {
      map['locked_at'] = Variable<DateTime>(lockedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueCompanion(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('operation: $operation, ')
          ..write('payload: $payload, ')
          ..write('status: $status, ')
          ..write('version: $version, ')
          ..write('createdAt: $createdAt, ')
          ..write('retryCount: $retryCount, ')
          ..write('lastError: $lastError, ')
          ..write('lockedAt: $lockedAt')
          ..write(')'))
        .toString();
  }
}

class $HesabsTable extends Hesabs with TableInfo<$HesabsTable, Hesab> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HesabsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 36,
      maxTextLength: 36,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<AccountLevel, int> levelF =
      GeneratedColumn<int>(
        'level_f',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<AccountLevel>($HesabsTable.$converterlevelF);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descFMeta = const VerificationMeta('descF');
  @override
  late final GeneratedColumn<String> descF = GeneratedColumn<String>(
    'desc_f',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _crnPriceMeta = const VerificationMeta(
    'crnPrice',
  );
  @override
  late final GeneratedColumn<double> crnPrice = GeneratedColumn<double>(
    'crn_price',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fuPriceMeta = const VerificationMeta(
    'fuPrice',
  );
  @override
  late final GeneratedColumn<double> fuPrice = GeneratedColumn<double>(
    'fu_price',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _exteraDescMeta = const VerificationMeta(
    'exteraDesc',
  );
  @override
  late final GeneratedColumn<String> exteraDesc = GeneratedColumn<String>(
    'extera_desc',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 1500,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: currentDate.unixepoch,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<int> deletedAt = GeneratedColumn<int>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    levelF,
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
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'hesabs';
  @override
  VerificationContext validateIntegrity(
    Insertable<Hesab> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('desc_f')) {
      context.handle(
        _descFMeta,
        descF.isAcceptableOrUnknown(data['desc_f']!, _descFMeta),
      );
    } else if (isInserting) {
      context.missing(_descFMeta);
    }
    if (data.containsKey('crn_price')) {
      context.handle(
        _crnPriceMeta,
        crnPrice.isAcceptableOrUnknown(data['crn_price']!, _crnPriceMeta),
      );
    }
    if (data.containsKey('fu_price')) {
      context.handle(
        _fuPriceMeta,
        fuPrice.isAcceptableOrUnknown(data['fu_price']!, _fuPriceMeta),
      );
    }
    if (data.containsKey('extera_desc')) {
      context.handle(
        _exteraDescMeta,
        exteraDesc.isAcceptableOrUnknown(data['extera_desc']!, _exteraDescMeta),
      );
    } else if (isInserting) {
      context.missing(_exteraDescMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {code},
  ];
  @override
  Hesab map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Hesab(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      levelF: $HesabsTable.$converterlevelF.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}level_f'],
        )!,
      ),
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      descF: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}desc_f'],
      )!,
      crnPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}crn_price'],
      ),
      fuPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}fu_price'],
      ),
      exteraDesc: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}extera_desc'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}deleted_at'],
      ),
    );
  }

  @override
  $HesabsTable createAlias(String alias) {
    return $HesabsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<AccountLevel, int, int> $converterlevelF =
      const EnumIndexConverter<AccountLevel>(AccountLevel.values);
}

class Hesab extends DataClass implements Insertable<Hesab> {
  final String id;
  final AccountLevel levelF;
  final String code;
  final String descF;
  final double? crnPrice;
  final double? fuPrice;
  final String exteraDesc;
  final int createdAt;
  final int? updatedAt;
  final int version;
  final bool isDeleted;
  final int? deletedAt;
  const Hesab({
    required this.id,
    required this.levelF,
    required this.code,
    required this.descF,
    this.crnPrice,
    this.fuPrice,
    required this.exteraDesc,
    required this.createdAt,
    this.updatedAt,
    required this.version,
    required this.isDeleted,
    this.deletedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    {
      map['level_f'] = Variable<int>(
        $HesabsTable.$converterlevelF.toSql(levelF),
      );
    }
    map['code'] = Variable<String>(code);
    map['desc_f'] = Variable<String>(descF);
    if (!nullToAbsent || crnPrice != null) {
      map['crn_price'] = Variable<double>(crnPrice);
    }
    if (!nullToAbsent || fuPrice != null) {
      map['fu_price'] = Variable<double>(fuPrice);
    }
    map['extera_desc'] = Variable<String>(exteraDesc);
    map['created_at'] = Variable<int>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<int>(updatedAt);
    }
    map['version'] = Variable<int>(version);
    map['is_deleted'] = Variable<bool>(isDeleted);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<int>(deletedAt);
    }
    return map;
  }

  HesabsCompanion toCompanion(bool nullToAbsent) {
    return HesabsCompanion(
      id: Value(id),
      levelF: Value(levelF),
      code: Value(code),
      descF: Value(descF),
      crnPrice: crnPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(crnPrice),
      fuPrice: fuPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(fuPrice),
      exteraDesc: Value(exteraDesc),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      version: Value(version),
      isDeleted: Value(isDeleted),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory Hesab.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Hesab(
      id: serializer.fromJson<String>(json['id']),
      levelF: $HesabsTable.$converterlevelF.fromJson(
        serializer.fromJson<int>(json['levelF']),
      ),
      code: serializer.fromJson<String>(json['code']),
      descF: serializer.fromJson<String>(json['descF']),
      crnPrice: serializer.fromJson<double?>(json['crnPrice']),
      fuPrice: serializer.fromJson<double?>(json['fuPrice']),
      exteraDesc: serializer.fromJson<String>(json['exteraDesc']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int?>(json['updatedAt']),
      version: serializer.fromJson<int>(json['version']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      deletedAt: serializer.fromJson<int?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'levelF': serializer.toJson<int>(
        $HesabsTable.$converterlevelF.toJson(levelF),
      ),
      'code': serializer.toJson<String>(code),
      'descF': serializer.toJson<String>(descF),
      'crnPrice': serializer.toJson<double?>(crnPrice),
      'fuPrice': serializer.toJson<double?>(fuPrice),
      'exteraDesc': serializer.toJson<String>(exteraDesc),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int?>(updatedAt),
      'version': serializer.toJson<int>(version),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'deletedAt': serializer.toJson<int?>(deletedAt),
    };
  }

  Hesab copyWith({
    String? id,
    AccountLevel? levelF,
    String? code,
    String? descF,
    Value<double?> crnPrice = const Value.absent(),
    Value<double?> fuPrice = const Value.absent(),
    String? exteraDesc,
    int? createdAt,
    Value<int?> updatedAt = const Value.absent(),
    int? version,
    bool? isDeleted,
    Value<int?> deletedAt = const Value.absent(),
  }) => Hesab(
    id: id ?? this.id,
    levelF: levelF ?? this.levelF,
    code: code ?? this.code,
    descF: descF ?? this.descF,
    crnPrice: crnPrice.present ? crnPrice.value : this.crnPrice,
    fuPrice: fuPrice.present ? fuPrice.value : this.fuPrice,
    exteraDesc: exteraDesc ?? this.exteraDesc,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    version: version ?? this.version,
    isDeleted: isDeleted ?? this.isDeleted,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
  );
  Hesab copyWithCompanion(HesabsCompanion data) {
    return Hesab(
      id: data.id.present ? data.id.value : this.id,
      levelF: data.levelF.present ? data.levelF.value : this.levelF,
      code: data.code.present ? data.code.value : this.code,
      descF: data.descF.present ? data.descF.value : this.descF,
      crnPrice: data.crnPrice.present ? data.crnPrice.value : this.crnPrice,
      fuPrice: data.fuPrice.present ? data.fuPrice.value : this.fuPrice,
      exteraDesc: data.exteraDesc.present
          ? data.exteraDesc.value
          : this.exteraDesc,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      version: data.version.present ? data.version.value : this.version,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Hesab(')
          ..write('id: $id, ')
          ..write('levelF: $levelF, ')
          ..write('code: $code, ')
          ..write('descF: $descF, ')
          ..write('crnPrice: $crnPrice, ')
          ..write('fuPrice: $fuPrice, ')
          ..write('exteraDesc: $exteraDesc, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    levelF,
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
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Hesab &&
          other.id == this.id &&
          other.levelF == this.levelF &&
          other.code == this.code &&
          other.descF == this.descF &&
          other.crnPrice == this.crnPrice &&
          other.fuPrice == this.fuPrice &&
          other.exteraDesc == this.exteraDesc &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.version == this.version &&
          other.isDeleted == this.isDeleted &&
          other.deletedAt == this.deletedAt);
}

class HesabsCompanion extends UpdateCompanion<Hesab> {
  final Value<String> id;
  final Value<AccountLevel> levelF;
  final Value<String> code;
  final Value<String> descF;
  final Value<double?> crnPrice;
  final Value<double?> fuPrice;
  final Value<String> exteraDesc;
  final Value<int> createdAt;
  final Value<int?> updatedAt;
  final Value<int> version;
  final Value<bool> isDeleted;
  final Value<int?> deletedAt;
  final Value<int> rowid;
  const HesabsCompanion({
    this.id = const Value.absent(),
    this.levelF = const Value.absent(),
    this.code = const Value.absent(),
    this.descF = const Value.absent(),
    this.crnPrice = const Value.absent(),
    this.fuPrice = const Value.absent(),
    this.exteraDesc = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HesabsCompanion.insert({
    required String id,
    required AccountLevel levelF,
    required String code,
    required String descF,
    this.crnPrice = const Value.absent(),
    this.fuPrice = const Value.absent(),
    required String exteraDesc,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       levelF = Value(levelF),
       code = Value(code),
       descF = Value(descF),
       exteraDesc = Value(exteraDesc);
  static Insertable<Hesab> custom({
    Expression<String>? id,
    Expression<int>? levelF,
    Expression<String>? code,
    Expression<String>? descF,
    Expression<double>? crnPrice,
    Expression<double>? fuPrice,
    Expression<String>? exteraDesc,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? version,
    Expression<bool>? isDeleted,
    Expression<int>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (levelF != null) 'level_f': levelF,
      if (code != null) 'code': code,
      if (descF != null) 'desc_f': descF,
      if (crnPrice != null) 'crn_price': crnPrice,
      if (fuPrice != null) 'fu_price': fuPrice,
      if (exteraDesc != null) 'extera_desc': exteraDesc,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (version != null) 'version': version,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HesabsCompanion copyWith({
    Value<String>? id,
    Value<AccountLevel>? levelF,
    Value<String>? code,
    Value<String>? descF,
    Value<double?>? crnPrice,
    Value<double?>? fuPrice,
    Value<String>? exteraDesc,
    Value<int>? createdAt,
    Value<int?>? updatedAt,
    Value<int>? version,
    Value<bool>? isDeleted,
    Value<int?>? deletedAt,
    Value<int>? rowid,
  }) {
    return HesabsCompanion(
      id: id ?? this.id,
      levelF: levelF ?? this.levelF,
      code: code ?? this.code,
      descF: descF ?? this.descF,
      crnPrice: crnPrice ?? this.crnPrice,
      fuPrice: fuPrice ?? this.fuPrice,
      exteraDesc: exteraDesc ?? this.exteraDesc,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      version: version ?? this.version,
      isDeleted: isDeleted ?? this.isDeleted,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (levelF.present) {
      map['level_f'] = Variable<int>(
        $HesabsTable.$converterlevelF.toSql(levelF.value),
      );
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (descF.present) {
      map['desc_f'] = Variable<String>(descF.value);
    }
    if (crnPrice.present) {
      map['crn_price'] = Variable<double>(crnPrice.value);
    }
    if (fuPrice.present) {
      map['fu_price'] = Variable<double>(fuPrice.value);
    }
    if (exteraDesc.present) {
      map['extera_desc'] = Variable<String>(exteraDesc.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<int>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HesabsCompanion(')
          ..write('id: $id, ')
          ..write('levelF: $levelF, ')
          ..write('code: $code, ')
          ..write('descF: $descF, ')
          ..write('crnPrice: $crnPrice, ')
          ..write('fuPrice: $fuPrice, ')
          ..write('exteraDesc: $exteraDesc, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $JournalsTable extends Journals with TableInfo<$JournalsTable, Journal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JournalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 36,
      maxTextLength: 36,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _referenceNumberMeta = const VerificationMeta(
    'referenceNumber',
  );
  @override
  late final GeneratedColumn<int> referenceNumber = GeneratedColumn<int>(
    'reference_number',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<int> date = GeneratedColumn<int>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 400,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isAutoMeta = const VerificationMeta('isAuto');
  @override
  late final GeneratedColumn<bool> isAuto = GeneratedColumn<bool>(
    'is_auto',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_auto" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _currencyCodeMeta = const VerificationMeta(
    'currencyCode',
  );
  @override
  late final GeneratedColumn<String> currencyCode = GeneratedColumn<String>(
    'currency_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('IRR'),
  );
  static const VerificationMeta _signedMeta = const VerificationMeta('signed');
  @override
  late final GeneratedColumn<bool> signed = GeneratedColumn<bool>(
    'signed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("signed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<int> deletedAt = GeneratedColumn<int>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
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
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'journals';
  @override
  VerificationContext validateIntegrity(
    Insertable<Journal> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('reference_number')) {
      context.handle(
        _referenceNumberMeta,
        referenceNumber.isAcceptableOrUnknown(
          data['reference_number']!,
          _referenceNumberMeta,
        ),
      );
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('is_auto')) {
      context.handle(
        _isAutoMeta,
        isAuto.isAcceptableOrUnknown(data['is_auto']!, _isAutoMeta),
      );
    }
    if (data.containsKey('currency_code')) {
      context.handle(
        _currencyCodeMeta,
        currencyCode.isAcceptableOrUnknown(
          data['currency_code']!,
          _currencyCodeMeta,
        ),
      );
    }
    if (data.containsKey('signed')) {
      context.handle(
        _signedMeta,
        signed.isAcceptableOrUnknown(data['signed']!, _signedMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Journal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Journal(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      referenceNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reference_number'],
      ),
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}date'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      isAuto: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_auto'],
      )!,
      currencyCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency_code'],
      )!,
      signed: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}signed'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}deleted_at'],
      ),
    );
  }

  @override
  $JournalsTable createAlias(String alias) {
    return $JournalsTable(attachedDatabase, alias);
  }
}

class Journal extends DataClass implements Insertable<Journal> {
  final String id;
  final int? referenceNumber;
  final int date;
  final String description;
  final bool isAuto;
  final String currencyCode;
  final bool signed;
  final int createdAt;
  final int? updatedAt;
  final int version;
  final bool isDeleted;
  final int? deletedAt;
  const Journal({
    required this.id,
    this.referenceNumber,
    required this.date,
    required this.description,
    required this.isAuto,
    required this.currencyCode,
    required this.signed,
    required this.createdAt,
    this.updatedAt,
    required this.version,
    required this.isDeleted,
    this.deletedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || referenceNumber != null) {
      map['reference_number'] = Variable<int>(referenceNumber);
    }
    map['date'] = Variable<int>(date);
    map['description'] = Variable<String>(description);
    map['is_auto'] = Variable<bool>(isAuto);
    map['currency_code'] = Variable<String>(currencyCode);
    map['signed'] = Variable<bool>(signed);
    map['created_at'] = Variable<int>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<int>(updatedAt);
    }
    map['version'] = Variable<int>(version);
    map['is_deleted'] = Variable<bool>(isDeleted);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<int>(deletedAt);
    }
    return map;
  }

  JournalsCompanion toCompanion(bool nullToAbsent) {
    return JournalsCompanion(
      id: Value(id),
      referenceNumber: referenceNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(referenceNumber),
      date: Value(date),
      description: Value(description),
      isAuto: Value(isAuto),
      currencyCode: Value(currencyCode),
      signed: Value(signed),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      version: Value(version),
      isDeleted: Value(isDeleted),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory Journal.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Journal(
      id: serializer.fromJson<String>(json['id']),
      referenceNumber: serializer.fromJson<int?>(json['referenceNumber']),
      date: serializer.fromJson<int>(json['date']),
      description: serializer.fromJson<String>(json['description']),
      isAuto: serializer.fromJson<bool>(json['isAuto']),
      currencyCode: serializer.fromJson<String>(json['currencyCode']),
      signed: serializer.fromJson<bool>(json['signed']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int?>(json['updatedAt']),
      version: serializer.fromJson<int>(json['version']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      deletedAt: serializer.fromJson<int?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'referenceNumber': serializer.toJson<int?>(referenceNumber),
      'date': serializer.toJson<int>(date),
      'description': serializer.toJson<String>(description),
      'isAuto': serializer.toJson<bool>(isAuto),
      'currencyCode': serializer.toJson<String>(currencyCode),
      'signed': serializer.toJson<bool>(signed),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int?>(updatedAt),
      'version': serializer.toJson<int>(version),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'deletedAt': serializer.toJson<int?>(deletedAt),
    };
  }

  Journal copyWith({
    String? id,
    Value<int?> referenceNumber = const Value.absent(),
    int? date,
    String? description,
    bool? isAuto,
    String? currencyCode,
    bool? signed,
    int? createdAt,
    Value<int?> updatedAt = const Value.absent(),
    int? version,
    bool? isDeleted,
    Value<int?> deletedAt = const Value.absent(),
  }) => Journal(
    id: id ?? this.id,
    referenceNumber: referenceNumber.present
        ? referenceNumber.value
        : this.referenceNumber,
    date: date ?? this.date,
    description: description ?? this.description,
    isAuto: isAuto ?? this.isAuto,
    currencyCode: currencyCode ?? this.currencyCode,
    signed: signed ?? this.signed,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    version: version ?? this.version,
    isDeleted: isDeleted ?? this.isDeleted,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
  );
  Journal copyWithCompanion(JournalsCompanion data) {
    return Journal(
      id: data.id.present ? data.id.value : this.id,
      referenceNumber: data.referenceNumber.present
          ? data.referenceNumber.value
          : this.referenceNumber,
      date: data.date.present ? data.date.value : this.date,
      description: data.description.present
          ? data.description.value
          : this.description,
      isAuto: data.isAuto.present ? data.isAuto.value : this.isAuto,
      currencyCode: data.currencyCode.present
          ? data.currencyCode.value
          : this.currencyCode,
      signed: data.signed.present ? data.signed.value : this.signed,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      version: data.version.present ? data.version.value : this.version,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Journal(')
          ..write('id: $id, ')
          ..write('referenceNumber: $referenceNumber, ')
          ..write('date: $date, ')
          ..write('description: $description, ')
          ..write('isAuto: $isAuto, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('signed: $signed, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
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
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Journal &&
          other.id == this.id &&
          other.referenceNumber == this.referenceNumber &&
          other.date == this.date &&
          other.description == this.description &&
          other.isAuto == this.isAuto &&
          other.currencyCode == this.currencyCode &&
          other.signed == this.signed &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.version == this.version &&
          other.isDeleted == this.isDeleted &&
          other.deletedAt == this.deletedAt);
}

class JournalsCompanion extends UpdateCompanion<Journal> {
  final Value<String> id;
  final Value<int?> referenceNumber;
  final Value<int> date;
  final Value<String> description;
  final Value<bool> isAuto;
  final Value<String> currencyCode;
  final Value<bool> signed;
  final Value<int> createdAt;
  final Value<int?> updatedAt;
  final Value<int> version;
  final Value<bool> isDeleted;
  final Value<int?> deletedAt;
  final Value<int> rowid;
  const JournalsCompanion({
    this.id = const Value.absent(),
    this.referenceNumber = const Value.absent(),
    this.date = const Value.absent(),
    this.description = const Value.absent(),
    this.isAuto = const Value.absent(),
    this.currencyCode = const Value.absent(),
    this.signed = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  JournalsCompanion.insert({
    required String id,
    this.referenceNumber = const Value.absent(),
    required int date,
    required String description,
    this.isAuto = const Value.absent(),
    this.currencyCode = const Value.absent(),
    this.signed = const Value.absent(),
    required int createdAt,
    this.updatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       date = Value(date),
       description = Value(description),
       createdAt = Value(createdAt);
  static Insertable<Journal> custom({
    Expression<String>? id,
    Expression<int>? referenceNumber,
    Expression<int>? date,
    Expression<String>? description,
    Expression<bool>? isAuto,
    Expression<String>? currencyCode,
    Expression<bool>? signed,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? version,
    Expression<bool>? isDeleted,
    Expression<int>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (referenceNumber != null) 'reference_number': referenceNumber,
      if (date != null) 'date': date,
      if (description != null) 'description': description,
      if (isAuto != null) 'is_auto': isAuto,
      if (currencyCode != null) 'currency_code': currencyCode,
      if (signed != null) 'signed': signed,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (version != null) 'version': version,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  JournalsCompanion copyWith({
    Value<String>? id,
    Value<int?>? referenceNumber,
    Value<int>? date,
    Value<String>? description,
    Value<bool>? isAuto,
    Value<String>? currencyCode,
    Value<bool>? signed,
    Value<int>? createdAt,
    Value<int?>? updatedAt,
    Value<int>? version,
    Value<bool>? isDeleted,
    Value<int?>? deletedAt,
    Value<int>? rowid,
  }) {
    return JournalsCompanion(
      id: id ?? this.id,
      referenceNumber: referenceNumber ?? this.referenceNumber,
      date: date ?? this.date,
      description: description ?? this.description,
      isAuto: isAuto ?? this.isAuto,
      currencyCode: currencyCode ?? this.currencyCode,
      signed: signed ?? this.signed,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      version: version ?? this.version,
      isDeleted: isDeleted ?? this.isDeleted,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (referenceNumber.present) {
      map['reference_number'] = Variable<int>(referenceNumber.value);
    }
    if (date.present) {
      map['date'] = Variable<int>(date.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (isAuto.present) {
      map['is_auto'] = Variable<bool>(isAuto.value);
    }
    if (currencyCode.present) {
      map['currency_code'] = Variable<String>(currencyCode.value);
    }
    if (signed.present) {
      map['signed'] = Variable<bool>(signed.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<int>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JournalsCompanion(')
          ..write('id: $id, ')
          ..write('referenceNumber: $referenceNumber, ')
          ..write('date: $date, ')
          ..write('description: $description, ')
          ..write('isAuto: $isAuto, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('signed: $signed, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CostCentersTable extends CostCenters
    with TableInfo<$CostCentersTable, CostCenter> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CostCentersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 36,
      maxTextLength: 36,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  late final GeneratedColumnWithTypeConverter<CostCenterType, int> type =
      GeneratedColumn<int>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<CostCenterType>($CostCentersTable.$convertertype);
  static const VerificationMeta _currencyCodeMeta = const VerificationMeta(
    'currencyCode',
  );
  @override
  late final GeneratedColumn<String> currencyCode = GeneratedColumn<String>(
    'currency_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _budgetMeta = const VerificationMeta('budget');
  @override
  late final GeneratedColumn<double> budget = GeneratedColumn<double>(
    'budget',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<int> deletedAt = GeneratedColumn<int>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
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
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cost_centers';
  @override
  VerificationContext validateIntegrity(
    Insertable<CostCenter> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('currency_code')) {
      context.handle(
        _currencyCodeMeta,
        currencyCode.isAcceptableOrUnknown(
          data['currency_code']!,
          _currencyCodeMeta,
        ),
      );
    }
    if (data.containsKey('budget')) {
      context.handle(
        _budgetMeta,
        budget.isAcceptableOrUnknown(data['budget']!, _budgetMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CostCenter map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CostCenter(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      type: $CostCentersTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}type'],
        )!,
      ),
      currencyCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency_code'],
      ),
      budget: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}budget'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}deleted_at'],
      ),
    );
  }

  @override
  $CostCentersTable createAlias(String alias) {
    return $CostCentersTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<CostCenterType, int, int> $convertertype =
      const EnumIndexConverter<CostCenterType>(CostCenterType.values);
}

class CostCenter extends DataClass implements Insertable<CostCenter> {
  final String id;
  final String code;
  final String name;
  final String? description;
  final bool isActive;
  final CostCenterType type;
  final String? currencyCode;
  final double? budget;
  final int createdAt;
  final int? updatedAt;
  final int version;
  final bool isDeleted;
  final int? deletedAt;
  const CostCenter({
    required this.id,
    required this.code,
    required this.name,
    this.description,
    required this.isActive,
    required this.type,
    this.currencyCode,
    this.budget,
    required this.createdAt,
    this.updatedAt,
    required this.version,
    required this.isDeleted,
    this.deletedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['is_active'] = Variable<bool>(isActive);
    {
      map['type'] = Variable<int>($CostCentersTable.$convertertype.toSql(type));
    }
    if (!nullToAbsent || currencyCode != null) {
      map['currency_code'] = Variable<String>(currencyCode);
    }
    if (!nullToAbsent || budget != null) {
      map['budget'] = Variable<double>(budget);
    }
    map['created_at'] = Variable<int>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<int>(updatedAt);
    }
    map['version'] = Variable<int>(version);
    map['is_deleted'] = Variable<bool>(isDeleted);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<int>(deletedAt);
    }
    return map;
  }

  CostCentersCompanion toCompanion(bool nullToAbsent) {
    return CostCentersCompanion(
      id: Value(id),
      code: Value(code),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      isActive: Value(isActive),
      type: Value(type),
      currencyCode: currencyCode == null && nullToAbsent
          ? const Value.absent()
          : Value(currencyCode),
      budget: budget == null && nullToAbsent
          ? const Value.absent()
          : Value(budget),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      version: Value(version),
      isDeleted: Value(isDeleted),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory CostCenter.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CostCenter(
      id: serializer.fromJson<String>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      type: $CostCentersTable.$convertertype.fromJson(
        serializer.fromJson<int>(json['type']),
      ),
      currencyCode: serializer.fromJson<String?>(json['currencyCode']),
      budget: serializer.fromJson<double?>(json['budget']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int?>(json['updatedAt']),
      version: serializer.fromJson<int>(json['version']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      deletedAt: serializer.fromJson<int?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'isActive': serializer.toJson<bool>(isActive),
      'type': serializer.toJson<int>(
        $CostCentersTable.$convertertype.toJson(type),
      ),
      'currencyCode': serializer.toJson<String?>(currencyCode),
      'budget': serializer.toJson<double?>(budget),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int?>(updatedAt),
      'version': serializer.toJson<int>(version),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'deletedAt': serializer.toJson<int?>(deletedAt),
    };
  }

  CostCenter copyWith({
    String? id,
    String? code,
    String? name,
    Value<String?> description = const Value.absent(),
    bool? isActive,
    CostCenterType? type,
    Value<String?> currencyCode = const Value.absent(),
    Value<double?> budget = const Value.absent(),
    int? createdAt,
    Value<int?> updatedAt = const Value.absent(),
    int? version,
    bool? isDeleted,
    Value<int?> deletedAt = const Value.absent(),
  }) => CostCenter(
    id: id ?? this.id,
    code: code ?? this.code,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    isActive: isActive ?? this.isActive,
    type: type ?? this.type,
    currencyCode: currencyCode.present ? currencyCode.value : this.currencyCode,
    budget: budget.present ? budget.value : this.budget,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    version: version ?? this.version,
    isDeleted: isDeleted ?? this.isDeleted,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
  );
  CostCenter copyWithCompanion(CostCentersCompanion data) {
    return CostCenter(
      id: data.id.present ? data.id.value : this.id,
      code: data.code.present ? data.code.value : this.code,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      type: data.type.present ? data.type.value : this.type,
      currencyCode: data.currencyCode.present
          ? data.currencyCode.value
          : this.currencyCode,
      budget: data.budget.present ? data.budget.value : this.budget,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      version: data.version.present ? data.version.value : this.version,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CostCenter(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('isActive: $isActive, ')
          ..write('type: $type, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('budget: $budget, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
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
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CostCenter &&
          other.id == this.id &&
          other.code == this.code &&
          other.name == this.name &&
          other.description == this.description &&
          other.isActive == this.isActive &&
          other.type == this.type &&
          other.currencyCode == this.currencyCode &&
          other.budget == this.budget &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.version == this.version &&
          other.isDeleted == this.isDeleted &&
          other.deletedAt == this.deletedAt);
}

class CostCentersCompanion extends UpdateCompanion<CostCenter> {
  final Value<String> id;
  final Value<String> code;
  final Value<String> name;
  final Value<String?> description;
  final Value<bool> isActive;
  final Value<CostCenterType> type;
  final Value<String?> currencyCode;
  final Value<double?> budget;
  final Value<int> createdAt;
  final Value<int?> updatedAt;
  final Value<int> version;
  final Value<bool> isDeleted;
  final Value<int?> deletedAt;
  final Value<int> rowid;
  const CostCentersCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.isActive = const Value.absent(),
    this.type = const Value.absent(),
    this.currencyCode = const Value.absent(),
    this.budget = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CostCentersCompanion.insert({
    required String id,
    required String code,
    required String name,
    this.description = const Value.absent(),
    this.isActive = const Value.absent(),
    required CostCenterType type,
    this.currencyCode = const Value.absent(),
    this.budget = const Value.absent(),
    required int createdAt,
    this.updatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       code = Value(code),
       name = Value(name),
       type = Value(type),
       createdAt = Value(createdAt);
  static Insertable<CostCenter> custom({
    Expression<String>? id,
    Expression<String>? code,
    Expression<String>? name,
    Expression<String>? description,
    Expression<bool>? isActive,
    Expression<int>? type,
    Expression<String>? currencyCode,
    Expression<double>? budget,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? version,
    Expression<bool>? isDeleted,
    Expression<int>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (isActive != null) 'is_active': isActive,
      if (type != null) 'type': type,
      if (currencyCode != null) 'currency_code': currencyCode,
      if (budget != null) 'budget': budget,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (version != null) 'version': version,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CostCentersCompanion copyWith({
    Value<String>? id,
    Value<String>? code,
    Value<String>? name,
    Value<String?>? description,
    Value<bool>? isActive,
    Value<CostCenterType>? type,
    Value<String?>? currencyCode,
    Value<double?>? budget,
    Value<int>? createdAt,
    Value<int?>? updatedAt,
    Value<int>? version,
    Value<bool>? isDeleted,
    Value<int?>? deletedAt,
    Value<int>? rowid,
  }) {
    return CostCentersCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      description: description ?? this.description,
      isActive: isActive ?? this.isActive,
      type: type ?? this.type,
      currencyCode: currencyCode ?? this.currencyCode,
      budget: budget ?? this.budget,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      version: version ?? this.version,
      isDeleted: isDeleted ?? this.isDeleted,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(
        $CostCentersTable.$convertertype.toSql(type.value),
      );
    }
    if (currencyCode.present) {
      map['currency_code'] = Variable<String>(currencyCode.value);
    }
    if (budget.present) {
      map['budget'] = Variable<double>(budget.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<int>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CostCentersCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('isActive: $isActive, ')
          ..write('type: $type, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('budget: $budget, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $JournalRowsTable extends JournalRows
    with TableInfo<$JournalRowsTable, JournalRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JournalRowsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 36,
      maxTextLength: 36,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<int> date = GeneratedColumn<int>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noSndMeta = const VerificationMeta('noSnd');
  @override
  late final GeneratedColumn<int> noSnd = GeneratedColumn<int>(
    'no_snd',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rowFMeta = const VerificationMeta('rowF');
  @override
  late final GeneratedColumn<int> rowF = GeneratedColumn<int>(
    'row_f',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hesabIdMeta = const VerificationMeta(
    'hesabId',
  );
  @override
  late final GeneratedColumn<String> hesabId = GeneratedColumn<String>(
    'hesab_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES hesabs (id)',
    ),
  );
  static const VerificationMeta _prBestMeta = const VerificationMeta('prBest');
  @override
  late final GeneratedColumn<double> prBest = GeneratedColumn<double>(
    'pr_best',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _prBedMeta = const VerificationMeta('prBed');
  @override
  late final GeneratedColumn<double> prBed = GeneratedColumn<double>(
    'pr_bed',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _mediaMeta = const VerificationMeta('media');
  @override
  late final GeneratedColumn<String> media = GeneratedColumn<String>(
    'media',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _descRowMeta = const VerificationMeta(
    'descRow',
  );
  @override
  late final GeneratedColumn<String> descRow = GeneratedColumn<String>(
    'desc_row',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currencyCodeMeta = const VerificationMeta(
    'currencyCode',
  );
  @override
  late final GeneratedColumn<String> currencyCode = GeneratedColumn<String>(
    'currency_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('IRR'),
  );
  static const VerificationMeta _constCenterIdMeta = const VerificationMeta(
    'constCenterId',
  );
  @override
  late final GeneratedColumn<String> constCenterId = GeneratedColumn<String>(
    'const_center_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cost_centers (id) ON UPDATE NO ACTION ON DELETE NO ACTION',
    ),
  );
  static const VerificationMeta _isAutoMeta = const VerificationMeta('isAuto');
  @override
  late final GeneratedColumn<bool> isAuto = GeneratedColumn<bool>(
    'is_auto',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_auto" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _journalIdMeta = const VerificationMeta(
    'journalId',
  );
  @override
  late final GeneratedColumn<String> journalId = GeneratedColumn<String>(
    'journal_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES journals (id) ON UPDATE NO ACTION ON DELETE NO ACTION',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<int> deletedAt = GeneratedColumn<int>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
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
    constCenterId,
    isAuto,
    journalId,
    createdAt,
    updatedAt,
    version,
    isDeleted,
    deletedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'journal_rows';
  @override
  VerificationContext validateIntegrity(
    Insertable<JournalRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('no_snd')) {
      context.handle(
        _noSndMeta,
        noSnd.isAcceptableOrUnknown(data['no_snd']!, _noSndMeta),
      );
    } else if (isInserting) {
      context.missing(_noSndMeta);
    }
    if (data.containsKey('row_f')) {
      context.handle(
        _rowFMeta,
        rowF.isAcceptableOrUnknown(data['row_f']!, _rowFMeta),
      );
    } else if (isInserting) {
      context.missing(_rowFMeta);
    }
    if (data.containsKey('hesab_id')) {
      context.handle(
        _hesabIdMeta,
        hesabId.isAcceptableOrUnknown(data['hesab_id']!, _hesabIdMeta),
      );
    } else if (isInserting) {
      context.missing(_hesabIdMeta);
    }
    if (data.containsKey('pr_best')) {
      context.handle(
        _prBestMeta,
        prBest.isAcceptableOrUnknown(data['pr_best']!, _prBestMeta),
      );
    }
    if (data.containsKey('pr_bed')) {
      context.handle(
        _prBedMeta,
        prBed.isAcceptableOrUnknown(data['pr_bed']!, _prBedMeta),
      );
    }
    if (data.containsKey('media')) {
      context.handle(
        _mediaMeta,
        media.isAcceptableOrUnknown(data['media']!, _mediaMeta),
      );
    }
    if (data.containsKey('desc_row')) {
      context.handle(
        _descRowMeta,
        descRow.isAcceptableOrUnknown(data['desc_row']!, _descRowMeta),
      );
    } else if (isInserting) {
      context.missing(_descRowMeta);
    }
    if (data.containsKey('currency_code')) {
      context.handle(
        _currencyCodeMeta,
        currencyCode.isAcceptableOrUnknown(
          data['currency_code']!,
          _currencyCodeMeta,
        ),
      );
    }
    if (data.containsKey('const_center_id')) {
      context.handle(
        _constCenterIdMeta,
        constCenterId.isAcceptableOrUnknown(
          data['const_center_id']!,
          _constCenterIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_constCenterIdMeta);
    }
    if (data.containsKey('is_auto')) {
      context.handle(
        _isAutoMeta,
        isAuto.isAcceptableOrUnknown(data['is_auto']!, _isAutoMeta),
      );
    }
    if (data.containsKey('journal_id')) {
      context.handle(
        _journalIdMeta,
        journalId.isAcceptableOrUnknown(data['journal_id']!, _journalIdMeta),
      );
    } else if (isInserting) {
      context.missing(_journalIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  JournalRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JournalRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}date'],
      )!,
      noSnd: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}no_snd'],
      )!,
      rowF: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}row_f'],
      )!,
      hesabId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hesab_id'],
      )!,
      prBest: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}pr_best'],
      )!,
      prBed: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}pr_bed'],
      )!,
      media: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}media'],
      )!,
      descRow: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}desc_row'],
      )!,
      currencyCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency_code'],
      )!,
      constCenterId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}const_center_id'],
      )!,
      isAuto: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_auto'],
      )!,
      journalId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}journal_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}deleted_at'],
      ),
    );
  }

  @override
  $JournalRowsTable createAlias(String alias) {
    return $JournalRowsTable(attachedDatabase, alias);
  }
}

class JournalRow extends DataClass implements Insertable<JournalRow> {
  final String id;
  final int date;
  final int noSnd;
  final int rowF;
  final String hesabId;
  final double prBest;
  final double prBed;
  final String media;
  final String descRow;
  final String currencyCode;
  final String constCenterId;
  final bool isAuto;
  final String journalId;
  final int createdAt;
  final int? updatedAt;
  final int version;
  final bool isDeleted;
  final int? deletedAt;
  const JournalRow({
    required this.id,
    required this.date,
    required this.noSnd,
    required this.rowF,
    required this.hesabId,
    required this.prBest,
    required this.prBed,
    required this.media,
    required this.descRow,
    required this.currencyCode,
    required this.constCenterId,
    required this.isAuto,
    required this.journalId,
    required this.createdAt,
    this.updatedAt,
    required this.version,
    required this.isDeleted,
    this.deletedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['date'] = Variable<int>(date);
    map['no_snd'] = Variable<int>(noSnd);
    map['row_f'] = Variable<int>(rowF);
    map['hesab_id'] = Variable<String>(hesabId);
    map['pr_best'] = Variable<double>(prBest);
    map['pr_bed'] = Variable<double>(prBed);
    map['media'] = Variable<String>(media);
    map['desc_row'] = Variable<String>(descRow);
    map['currency_code'] = Variable<String>(currencyCode);
    map['const_center_id'] = Variable<String>(constCenterId);
    map['is_auto'] = Variable<bool>(isAuto);
    map['journal_id'] = Variable<String>(journalId);
    map['created_at'] = Variable<int>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<int>(updatedAt);
    }
    map['version'] = Variable<int>(version);
    map['is_deleted'] = Variable<bool>(isDeleted);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<int>(deletedAt);
    }
    return map;
  }

  JournalRowsCompanion toCompanion(bool nullToAbsent) {
    return JournalRowsCompanion(
      id: Value(id),
      date: Value(date),
      noSnd: Value(noSnd),
      rowF: Value(rowF),
      hesabId: Value(hesabId),
      prBest: Value(prBest),
      prBed: Value(prBed),
      media: Value(media),
      descRow: Value(descRow),
      currencyCode: Value(currencyCode),
      constCenterId: Value(constCenterId),
      isAuto: Value(isAuto),
      journalId: Value(journalId),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      version: Value(version),
      isDeleted: Value(isDeleted),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory JournalRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JournalRow(
      id: serializer.fromJson<String>(json['id']),
      date: serializer.fromJson<int>(json['date']),
      noSnd: serializer.fromJson<int>(json['noSnd']),
      rowF: serializer.fromJson<int>(json['rowF']),
      hesabId: serializer.fromJson<String>(json['hesabId']),
      prBest: serializer.fromJson<double>(json['prBest']),
      prBed: serializer.fromJson<double>(json['prBed']),
      media: serializer.fromJson<String>(json['media']),
      descRow: serializer.fromJson<String>(json['descRow']),
      currencyCode: serializer.fromJson<String>(json['currencyCode']),
      constCenterId: serializer.fromJson<String>(json['constCenterId']),
      isAuto: serializer.fromJson<bool>(json['isAuto']),
      journalId: serializer.fromJson<String>(json['journalId']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int?>(json['updatedAt']),
      version: serializer.fromJson<int>(json['version']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      deletedAt: serializer.fromJson<int?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'date': serializer.toJson<int>(date),
      'noSnd': serializer.toJson<int>(noSnd),
      'rowF': serializer.toJson<int>(rowF),
      'hesabId': serializer.toJson<String>(hesabId),
      'prBest': serializer.toJson<double>(prBest),
      'prBed': serializer.toJson<double>(prBed),
      'media': serializer.toJson<String>(media),
      'descRow': serializer.toJson<String>(descRow),
      'currencyCode': serializer.toJson<String>(currencyCode),
      'constCenterId': serializer.toJson<String>(constCenterId),
      'isAuto': serializer.toJson<bool>(isAuto),
      'journalId': serializer.toJson<String>(journalId),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int?>(updatedAt),
      'version': serializer.toJson<int>(version),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'deletedAt': serializer.toJson<int?>(deletedAt),
    };
  }

  JournalRow copyWith({
    String? id,
    int? date,
    int? noSnd,
    int? rowF,
    String? hesabId,
    double? prBest,
    double? prBed,
    String? media,
    String? descRow,
    String? currencyCode,
    String? constCenterId,
    bool? isAuto,
    String? journalId,
    int? createdAt,
    Value<int?> updatedAt = const Value.absent(),
    int? version,
    bool? isDeleted,
    Value<int?> deletedAt = const Value.absent(),
  }) => JournalRow(
    id: id ?? this.id,
    date: date ?? this.date,
    noSnd: noSnd ?? this.noSnd,
    rowF: rowF ?? this.rowF,
    hesabId: hesabId ?? this.hesabId,
    prBest: prBest ?? this.prBest,
    prBed: prBed ?? this.prBed,
    media: media ?? this.media,
    descRow: descRow ?? this.descRow,
    currencyCode: currencyCode ?? this.currencyCode,
    constCenterId: constCenterId ?? this.constCenterId,
    isAuto: isAuto ?? this.isAuto,
    journalId: journalId ?? this.journalId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    version: version ?? this.version,
    isDeleted: isDeleted ?? this.isDeleted,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
  );
  JournalRow copyWithCompanion(JournalRowsCompanion data) {
    return JournalRow(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      noSnd: data.noSnd.present ? data.noSnd.value : this.noSnd,
      rowF: data.rowF.present ? data.rowF.value : this.rowF,
      hesabId: data.hesabId.present ? data.hesabId.value : this.hesabId,
      prBest: data.prBest.present ? data.prBest.value : this.prBest,
      prBed: data.prBed.present ? data.prBed.value : this.prBed,
      media: data.media.present ? data.media.value : this.media,
      descRow: data.descRow.present ? data.descRow.value : this.descRow,
      currencyCode: data.currencyCode.present
          ? data.currencyCode.value
          : this.currencyCode,
      constCenterId: data.constCenterId.present
          ? data.constCenterId.value
          : this.constCenterId,
      isAuto: data.isAuto.present ? data.isAuto.value : this.isAuto,
      journalId: data.journalId.present ? data.journalId.value : this.journalId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      version: data.version.present ? data.version.value : this.version,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('JournalRow(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('noSnd: $noSnd, ')
          ..write('rowF: $rowF, ')
          ..write('hesabId: $hesabId, ')
          ..write('prBest: $prBest, ')
          ..write('prBed: $prBed, ')
          ..write('media: $media, ')
          ..write('descRow: $descRow, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('constCenterId: $constCenterId, ')
          ..write('isAuto: $isAuto, ')
          ..write('journalId: $journalId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
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
    constCenterId,
    isAuto,
    journalId,
    createdAt,
    updatedAt,
    version,
    isDeleted,
    deletedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JournalRow &&
          other.id == this.id &&
          other.date == this.date &&
          other.noSnd == this.noSnd &&
          other.rowF == this.rowF &&
          other.hesabId == this.hesabId &&
          other.prBest == this.prBest &&
          other.prBed == this.prBed &&
          other.media == this.media &&
          other.descRow == this.descRow &&
          other.currencyCode == this.currencyCode &&
          other.constCenterId == this.constCenterId &&
          other.isAuto == this.isAuto &&
          other.journalId == this.journalId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.version == this.version &&
          other.isDeleted == this.isDeleted &&
          other.deletedAt == this.deletedAt);
}

class JournalRowsCompanion extends UpdateCompanion<JournalRow> {
  final Value<String> id;
  final Value<int> date;
  final Value<int> noSnd;
  final Value<int> rowF;
  final Value<String> hesabId;
  final Value<double> prBest;
  final Value<double> prBed;
  final Value<String> media;
  final Value<String> descRow;
  final Value<String> currencyCode;
  final Value<String> constCenterId;
  final Value<bool> isAuto;
  final Value<String> journalId;
  final Value<int> createdAt;
  final Value<int?> updatedAt;
  final Value<int> version;
  final Value<bool> isDeleted;
  final Value<int?> deletedAt;
  final Value<int> rowid;
  const JournalRowsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.noSnd = const Value.absent(),
    this.rowF = const Value.absent(),
    this.hesabId = const Value.absent(),
    this.prBest = const Value.absent(),
    this.prBed = const Value.absent(),
    this.media = const Value.absent(),
    this.descRow = const Value.absent(),
    this.currencyCode = const Value.absent(),
    this.constCenterId = const Value.absent(),
    this.isAuto = const Value.absent(),
    this.journalId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  JournalRowsCompanion.insert({
    required String id,
    required int date,
    required int noSnd,
    required int rowF,
    required String hesabId,
    this.prBest = const Value.absent(),
    this.prBed = const Value.absent(),
    this.media = const Value.absent(),
    required String descRow,
    this.currencyCode = const Value.absent(),
    required String constCenterId,
    this.isAuto = const Value.absent(),
    required String journalId,
    required int createdAt,
    this.updatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       date = Value(date),
       noSnd = Value(noSnd),
       rowF = Value(rowF),
       hesabId = Value(hesabId),
       descRow = Value(descRow),
       constCenterId = Value(constCenterId),
       journalId = Value(journalId),
       createdAt = Value(createdAt);
  static Insertable<JournalRow> custom({
    Expression<String>? id,
    Expression<int>? date,
    Expression<int>? noSnd,
    Expression<int>? rowF,
    Expression<String>? hesabId,
    Expression<double>? prBest,
    Expression<double>? prBed,
    Expression<String>? media,
    Expression<String>? descRow,
    Expression<String>? currencyCode,
    Expression<String>? constCenterId,
    Expression<bool>? isAuto,
    Expression<String>? journalId,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? version,
    Expression<bool>? isDeleted,
    Expression<int>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (noSnd != null) 'no_snd': noSnd,
      if (rowF != null) 'row_f': rowF,
      if (hesabId != null) 'hesab_id': hesabId,
      if (prBest != null) 'pr_best': prBest,
      if (prBed != null) 'pr_bed': prBed,
      if (media != null) 'media': media,
      if (descRow != null) 'desc_row': descRow,
      if (currencyCode != null) 'currency_code': currencyCode,
      if (constCenterId != null) 'const_center_id': constCenterId,
      if (isAuto != null) 'is_auto': isAuto,
      if (journalId != null) 'journal_id': journalId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (version != null) 'version': version,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  JournalRowsCompanion copyWith({
    Value<String>? id,
    Value<int>? date,
    Value<int>? noSnd,
    Value<int>? rowF,
    Value<String>? hesabId,
    Value<double>? prBest,
    Value<double>? prBed,
    Value<String>? media,
    Value<String>? descRow,
    Value<String>? currencyCode,
    Value<String>? constCenterId,
    Value<bool>? isAuto,
    Value<String>? journalId,
    Value<int>? createdAt,
    Value<int?>? updatedAt,
    Value<int>? version,
    Value<bool>? isDeleted,
    Value<int?>? deletedAt,
    Value<int>? rowid,
  }) {
    return JournalRowsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      noSnd: noSnd ?? this.noSnd,
      rowF: rowF ?? this.rowF,
      hesabId: hesabId ?? this.hesabId,
      prBest: prBest ?? this.prBest,
      prBed: prBed ?? this.prBed,
      media: media ?? this.media,
      descRow: descRow ?? this.descRow,
      currencyCode: currencyCode ?? this.currencyCode,
      constCenterId: constCenterId ?? this.constCenterId,
      isAuto: isAuto ?? this.isAuto,
      journalId: journalId ?? this.journalId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      version: version ?? this.version,
      isDeleted: isDeleted ?? this.isDeleted,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<int>(date.value);
    }
    if (noSnd.present) {
      map['no_snd'] = Variable<int>(noSnd.value);
    }
    if (rowF.present) {
      map['row_f'] = Variable<int>(rowF.value);
    }
    if (hesabId.present) {
      map['hesab_id'] = Variable<String>(hesabId.value);
    }
    if (prBest.present) {
      map['pr_best'] = Variable<double>(prBest.value);
    }
    if (prBed.present) {
      map['pr_bed'] = Variable<double>(prBed.value);
    }
    if (media.present) {
      map['media'] = Variable<String>(media.value);
    }
    if (descRow.present) {
      map['desc_row'] = Variable<String>(descRow.value);
    }
    if (currencyCode.present) {
      map['currency_code'] = Variable<String>(currencyCode.value);
    }
    if (constCenterId.present) {
      map['const_center_id'] = Variable<String>(constCenterId.value);
    }
    if (isAuto.present) {
      map['is_auto'] = Variable<bool>(isAuto.value);
    }
    if (journalId.present) {
      map['journal_id'] = Variable<String>(journalId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<int>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JournalRowsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('noSnd: $noSnd, ')
          ..write('rowF: $rowF, ')
          ..write('hesabId: $hesabId, ')
          ..write('prBest: $prBest, ')
          ..write('prBed: $prBed, ')
          ..write('media: $media, ')
          ..write('descRow: $descRow, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('constCenterId: $constCenterId, ')
          ..write('isAuto: $isAuto, ')
          ..write('journalId: $journalId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProductsTable products = $ProductsTable(this);
  late final $SyncQueueTable syncQueue = $SyncQueueTable(this);
  late final $HesabsTable hesabs = $HesabsTable(this);
  late final $JournalsTable journals = $JournalsTable(this);
  late final $CostCentersTable costCenters = $CostCentersTable(this);
  late final $JournalRowsTable journalRows = $JournalRowsTable(this);
  late final Index productName = Index(
    'product_name',
    'CREATE INDEX product_name ON products (desc_f)',
  );
  late final Index hesabName = Index(
    'hesab_name',
    'CREATE INDEX hesab_name ON hesabs (desc_f)',
  );
  late final Index hesabSearch = Index(
    'hesab_search',
    'CREATE INDEX hesab_search ON hesabs (level_f, code, desc_f)',
  );
  late final Index dateJournalInx = Index(
    'dateJournal_inx',
    'CREATE INDEX dateJournal_inx ON journals (date)',
  );
  late final Index noDateInx = Index(
    'noDate_inx',
    'CREATE INDEX noDate_inx ON journals (reference_number)',
  );
  late final Index noSndRowF = Index(
    'noSnd_rowF',
    'CREATE INDEX noSnd_rowF ON journal_rows (no_snd, row_f)',
  );
  late final Index noSndHesabId = Index(
    'noSnd_hesabId',
    'CREATE INDEX noSnd_hesabId ON journal_rows (no_snd, hesab_id)',
  );
  late final Index hesabIdDate = Index(
    'HesabId_date',
    'CREATE INDEX HesabId_date ON journal_rows (hesab_id, date)',
  );
  late final Index dateInx = Index(
    'date_inx',
    'CREATE INDEX date_inx ON journal_rows (date)',
  );
  late final Index noSndInx = Index(
    'noSnd_inx',
    'CREATE INDEX noSnd_inx ON journal_rows (no_snd)',
  );
  late final Index prBestInx = Index(
    'prBest_inx',
    'CREATE INDEX prBest_inx ON journal_rows (pr_best)',
  );
  late final Index prBedInx = Index(
    'prBed_inx',
    'CREATE INDEX prBed_inx ON journal_rows (pr_bed)',
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    products,
    syncQueue,
    hesabs,
    journals,
    costCenters,
    journalRows,
    productName,
    hesabName,
    hesabSearch,
    dateJournalInx,
    noDateInx,
    noSndRowF,
    noSndHesabId,
    hesabIdDate,
    dateInx,
    noSndInx,
    prBestInx,
    prBedInx,
  ];
}

typedef $$ProductsTableCreateCompanionBuilder =
    ProductsCompanion Function({
      required String id,
      required String code,
      required String descF,
      required String unit,
      required String unit2,
      Value<double?> fee,
      Value<double?> zaribU2,
      Value<double?> buyFee,
      Value<double?> buyFee2,
      Value<double?> buyPercent,
      Value<double?> saleFee,
      Value<double?> minLm,
      Value<double?> maxLm,
      Value<double?> formFee,
      required int createdAt,
      required int updatedAt,
      Value<int> version,
      Value<bool> isDeleted,
      Value<int?> deletedAt,
      Value<int> rowid,
    });
typedef $$ProductsTableUpdateCompanionBuilder =
    ProductsCompanion Function({
      Value<String> id,
      Value<String> code,
      Value<String> descF,
      Value<String> unit,
      Value<String> unit2,
      Value<double?> fee,
      Value<double?> zaribU2,
      Value<double?> buyFee,
      Value<double?> buyFee2,
      Value<double?> buyPercent,
      Value<double?> saleFee,
      Value<double?> minLm,
      Value<double?> maxLm,
      Value<double?> formFee,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int> version,
      Value<bool> isDeleted,
      Value<int?> deletedAt,
      Value<int> rowid,
    });

class $$ProductsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descF => $composableBuilder(
    column: $table.descF,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unit2 => $composableBuilder(
    column: $table.unit2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fee => $composableBuilder(
    column: $table.fee,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get zaribU2 => $composableBuilder(
    column: $table.zaribU2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get buyFee => $composableBuilder(
    column: $table.buyFee,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get buyFee2 => $composableBuilder(
    column: $table.buyFee2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get buyPercent => $composableBuilder(
    column: $table.buyPercent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get saleFee => $composableBuilder(
    column: $table.saleFee,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get minLm => $composableBuilder(
    column: $table.minLm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get maxLm => $composableBuilder(
    column: $table.maxLm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get formFee => $composableBuilder(
    column: $table.formFee,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProductsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descF => $composableBuilder(
    column: $table.descF,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unit2 => $composableBuilder(
    column: $table.unit2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fee => $composableBuilder(
    column: $table.fee,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get zaribU2 => $composableBuilder(
    column: $table.zaribU2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get buyFee => $composableBuilder(
    column: $table.buyFee,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get buyFee2 => $composableBuilder(
    column: $table.buyFee2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get buyPercent => $composableBuilder(
    column: $table.buyPercent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get saleFee => $composableBuilder(
    column: $table.saleFee,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get minLm => $composableBuilder(
    column: $table.minLm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get maxLm => $composableBuilder(
    column: $table.maxLm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get formFee => $composableBuilder(
    column: $table.formFee,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProductsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get descF =>
      $composableBuilder(column: $table.descF, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<String> get unit2 =>
      $composableBuilder(column: $table.unit2, builder: (column) => column);

  GeneratedColumn<double> get fee =>
      $composableBuilder(column: $table.fee, builder: (column) => column);

  GeneratedColumn<double> get zaribU2 =>
      $composableBuilder(column: $table.zaribU2, builder: (column) => column);

  GeneratedColumn<double> get buyFee =>
      $composableBuilder(column: $table.buyFee, builder: (column) => column);

  GeneratedColumn<double> get buyFee2 =>
      $composableBuilder(column: $table.buyFee2, builder: (column) => column);

  GeneratedColumn<double> get buyPercent => $composableBuilder(
    column: $table.buyPercent,
    builder: (column) => column,
  );

  GeneratedColumn<double> get saleFee =>
      $composableBuilder(column: $table.saleFee, builder: (column) => column);

  GeneratedColumn<double> get minLm =>
      $composableBuilder(column: $table.minLm, builder: (column) => column);

  GeneratedColumn<double> get maxLm =>
      $composableBuilder(column: $table.maxLm, builder: (column) => column);

  GeneratedColumn<double> get formFee =>
      $composableBuilder(column: $table.formFee, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<int> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$ProductsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductsTable,
          Product,
          $$ProductsTableFilterComposer,
          $$ProductsTableOrderingComposer,
          $$ProductsTableAnnotationComposer,
          $$ProductsTableCreateCompanionBuilder,
          $$ProductsTableUpdateCompanionBuilder,
          (Product, BaseReferences<_$AppDatabase, $ProductsTable, Product>),
          Product,
          PrefetchHooks Function()
        > {
  $$ProductsTableTableManager(_$AppDatabase db, $ProductsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> descF = const Value.absent(),
                Value<String> unit = const Value.absent(),
                Value<String> unit2 = const Value.absent(),
                Value<double?> fee = const Value.absent(),
                Value<double?> zaribU2 = const Value.absent(),
                Value<double?> buyFee = const Value.absent(),
                Value<double?> buyFee2 = const Value.absent(),
                Value<double?> buyPercent = const Value.absent(),
                Value<double?> saleFee = const Value.absent(),
                Value<double?> minLm = const Value.absent(),
                Value<double?> maxLm = const Value.absent(),
                Value<double?> formFee = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductsCompanion(
                id: id,
                code: code,
                descF: descF,
                unit: unit,
                unit2: unit2,
                fee: fee,
                zaribU2: zaribU2,
                buyFee: buyFee,
                buyFee2: buyFee2,
                buyPercent: buyPercent,
                saleFee: saleFee,
                minLm: minLm,
                maxLm: maxLm,
                formFee: formFee,
                createdAt: createdAt,
                updatedAt: updatedAt,
                version: version,
                isDeleted: isDeleted,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String code,
                required String descF,
                required String unit,
                required String unit2,
                Value<double?> fee = const Value.absent(),
                Value<double?> zaribU2 = const Value.absent(),
                Value<double?> buyFee = const Value.absent(),
                Value<double?> buyFee2 = const Value.absent(),
                Value<double?> buyPercent = const Value.absent(),
                Value<double?> saleFee = const Value.absent(),
                Value<double?> minLm = const Value.absent(),
                Value<double?> maxLm = const Value.absent(),
                Value<double?> formFee = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<int> version = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductsCompanion.insert(
                id: id,
                code: code,
                descF: descF,
                unit: unit,
                unit2: unit2,
                fee: fee,
                zaribU2: zaribU2,
                buyFee: buyFee,
                buyFee2: buyFee2,
                buyPercent: buyPercent,
                saleFee: saleFee,
                minLm: minLm,
                maxLm: maxLm,
                formFee: formFee,
                createdAt: createdAt,
                updatedAt: updatedAt,
                version: version,
                isDeleted: isDeleted,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProductsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductsTable,
      Product,
      $$ProductsTableFilterComposer,
      $$ProductsTableOrderingComposer,
      $$ProductsTableAnnotationComposer,
      $$ProductsTableCreateCompanionBuilder,
      $$ProductsTableUpdateCompanionBuilder,
      (Product, BaseReferences<_$AppDatabase, $ProductsTable, Product>),
      Product,
      PrefetchHooks Function()
    >;
typedef $$SyncQueueTableCreateCompanionBuilder =
    SyncQueueCompanion Function({
      Value<int> id,
      required String entityType,
      required String entityId,
      required String operation,
      required String payload,
      Value<int> status,
      required int version,
      required int createdAt,
      Value<int> retryCount,
      Value<String?> lastError,
      Value<DateTime?> lockedAt,
    });
typedef $$SyncQueueTableUpdateCompanionBuilder =
    SyncQueueCompanion Function({
      Value<int> id,
      Value<String> entityType,
      Value<String> entityId,
      Value<String> operation,
      Value<String> payload,
      Value<int> status,
      Value<int> version,
      Value<int> createdAt,
      Value<int> retryCount,
      Value<String?> lastError,
      Value<DateTime?> lockedAt,
    });

class $$SyncQueueTableFilterComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get operation => $composableBuilder(
    column: $table.operation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastError => $composableBuilder(
    column: $table.lastError,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lockedAt => $composableBuilder(
    column: $table.lockedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncQueueTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get operation => $composableBuilder(
    column: $table.operation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastError => $composableBuilder(
    column: $table.lastError,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lockedAt => $composableBuilder(
    column: $table.lockedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncQueueTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumn<String> get operation =>
      $composableBuilder(column: $table.operation, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastError =>
      $composableBuilder(column: $table.lastError, builder: (column) => column);

  GeneratedColumn<DateTime> get lockedAt =>
      $composableBuilder(column: $table.lockedAt, builder: (column) => column);
}

class $$SyncQueueTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SyncQueueTable,
          SyncQueueData,
          $$SyncQueueTableFilterComposer,
          $$SyncQueueTableOrderingComposer,
          $$SyncQueueTableAnnotationComposer,
          $$SyncQueueTableCreateCompanionBuilder,
          $$SyncQueueTableUpdateCompanionBuilder,
          (
            SyncQueueData,
            BaseReferences<_$AppDatabase, $SyncQueueTable, SyncQueueData>,
          ),
          SyncQueueData,
          PrefetchHooks Function()
        > {
  $$SyncQueueTableTableManager(_$AppDatabase db, $SyncQueueTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncQueueTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncQueueTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncQueueTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> entityType = const Value.absent(),
                Value<String> entityId = const Value.absent(),
                Value<String> operation = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> retryCount = const Value.absent(),
                Value<String?> lastError = const Value.absent(),
                Value<DateTime?> lockedAt = const Value.absent(),
              }) => SyncQueueCompanion(
                id: id,
                entityType: entityType,
                entityId: entityId,
                operation: operation,
                payload: payload,
                status: status,
                version: version,
                createdAt: createdAt,
                retryCount: retryCount,
                lastError: lastError,
                lockedAt: lockedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String entityType,
                required String entityId,
                required String operation,
                required String payload,
                Value<int> status = const Value.absent(),
                required int version,
                required int createdAt,
                Value<int> retryCount = const Value.absent(),
                Value<String?> lastError = const Value.absent(),
                Value<DateTime?> lockedAt = const Value.absent(),
              }) => SyncQueueCompanion.insert(
                id: id,
                entityType: entityType,
                entityId: entityId,
                operation: operation,
                payload: payload,
                status: status,
                version: version,
                createdAt: createdAt,
                retryCount: retryCount,
                lastError: lastError,
                lockedAt: lockedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncQueueTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SyncQueueTable,
      SyncQueueData,
      $$SyncQueueTableFilterComposer,
      $$SyncQueueTableOrderingComposer,
      $$SyncQueueTableAnnotationComposer,
      $$SyncQueueTableCreateCompanionBuilder,
      $$SyncQueueTableUpdateCompanionBuilder,
      (
        SyncQueueData,
        BaseReferences<_$AppDatabase, $SyncQueueTable, SyncQueueData>,
      ),
      SyncQueueData,
      PrefetchHooks Function()
    >;
typedef $$HesabsTableCreateCompanionBuilder =
    HesabsCompanion Function({
      required String id,
      required AccountLevel levelF,
      required String code,
      required String descF,
      Value<double?> crnPrice,
      Value<double?> fuPrice,
      required String exteraDesc,
      Value<int> createdAt,
      Value<int?> updatedAt,
      Value<int> version,
      Value<bool> isDeleted,
      Value<int?> deletedAt,
      Value<int> rowid,
    });
typedef $$HesabsTableUpdateCompanionBuilder =
    HesabsCompanion Function({
      Value<String> id,
      Value<AccountLevel> levelF,
      Value<String> code,
      Value<String> descF,
      Value<double?> crnPrice,
      Value<double?> fuPrice,
      Value<String> exteraDesc,
      Value<int> createdAt,
      Value<int?> updatedAt,
      Value<int> version,
      Value<bool> isDeleted,
      Value<int?> deletedAt,
      Value<int> rowid,
    });

final class $$HesabsTableReferences
    extends BaseReferences<_$AppDatabase, $HesabsTable, Hesab> {
  $$HesabsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$JournalRowsTable, List<JournalRow>>
  _journalRowsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.journalRows,
    aliasName: $_aliasNameGenerator(db.hesabs.id, db.journalRows.hesabId),
  );

  $$JournalRowsTableProcessedTableManager get journalRowsRefs {
    final manager = $$JournalRowsTableTableManager(
      $_db,
      $_db.journalRows,
    ).filter((f) => f.hesabId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_journalRowsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$HesabsTableFilterComposer
    extends Composer<_$AppDatabase, $HesabsTable> {
  $$HesabsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<AccountLevel, AccountLevel, int> get levelF =>
      $composableBuilder(
        column: $table.levelF,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descF => $composableBuilder(
    column: $table.descF,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get crnPrice => $composableBuilder(
    column: $table.crnPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fuPrice => $composableBuilder(
    column: $table.fuPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get exteraDesc => $composableBuilder(
    column: $table.exteraDesc,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> journalRowsRefs(
    Expression<bool> Function($$JournalRowsTableFilterComposer f) f,
  ) {
    final $$JournalRowsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.journalRows,
      getReferencedColumn: (t) => t.hesabId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$JournalRowsTableFilterComposer(
            $db: $db,
            $table: $db.journalRows,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$HesabsTableOrderingComposer
    extends Composer<_$AppDatabase, $HesabsTable> {
  $$HesabsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get levelF => $composableBuilder(
    column: $table.levelF,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descF => $composableBuilder(
    column: $table.descF,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get crnPrice => $composableBuilder(
    column: $table.crnPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fuPrice => $composableBuilder(
    column: $table.fuPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get exteraDesc => $composableBuilder(
    column: $table.exteraDesc,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$HesabsTableAnnotationComposer
    extends Composer<_$AppDatabase, $HesabsTable> {
  $$HesabsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<AccountLevel, int> get levelF =>
      $composableBuilder(column: $table.levelF, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get descF =>
      $composableBuilder(column: $table.descF, builder: (column) => column);

  GeneratedColumn<double> get crnPrice =>
      $composableBuilder(column: $table.crnPrice, builder: (column) => column);

  GeneratedColumn<double> get fuPrice =>
      $composableBuilder(column: $table.fuPrice, builder: (column) => column);

  GeneratedColumn<String> get exteraDesc => $composableBuilder(
    column: $table.exteraDesc,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<int> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  Expression<T> journalRowsRefs<T extends Object>(
    Expression<T> Function($$JournalRowsTableAnnotationComposer a) f,
  ) {
    final $$JournalRowsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.journalRows,
      getReferencedColumn: (t) => t.hesabId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$JournalRowsTableAnnotationComposer(
            $db: $db,
            $table: $db.journalRows,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$HesabsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HesabsTable,
          Hesab,
          $$HesabsTableFilterComposer,
          $$HesabsTableOrderingComposer,
          $$HesabsTableAnnotationComposer,
          $$HesabsTableCreateCompanionBuilder,
          $$HesabsTableUpdateCompanionBuilder,
          (Hesab, $$HesabsTableReferences),
          Hesab,
          PrefetchHooks Function({bool journalRowsRefs})
        > {
  $$HesabsTableTableManager(_$AppDatabase db, $HesabsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HesabsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HesabsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HesabsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<AccountLevel> levelF = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> descF = const Value.absent(),
                Value<double?> crnPrice = const Value.absent(),
                Value<double?> fuPrice = const Value.absent(),
                Value<String> exteraDesc = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int?> updatedAt = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HesabsCompanion(
                id: id,
                levelF: levelF,
                code: code,
                descF: descF,
                crnPrice: crnPrice,
                fuPrice: fuPrice,
                exteraDesc: exteraDesc,
                createdAt: createdAt,
                updatedAt: updatedAt,
                version: version,
                isDeleted: isDeleted,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required AccountLevel levelF,
                required String code,
                required String descF,
                Value<double?> crnPrice = const Value.absent(),
                Value<double?> fuPrice = const Value.absent(),
                required String exteraDesc,
                Value<int> createdAt = const Value.absent(),
                Value<int?> updatedAt = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HesabsCompanion.insert(
                id: id,
                levelF: levelF,
                code: code,
                descF: descF,
                crnPrice: crnPrice,
                fuPrice: fuPrice,
                exteraDesc: exteraDesc,
                createdAt: createdAt,
                updatedAt: updatedAt,
                version: version,
                isDeleted: isDeleted,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$HesabsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({journalRowsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (journalRowsRefs) db.journalRows],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (journalRowsRefs)
                    await $_getPrefetchedData<Hesab, $HesabsTable, JournalRow>(
                      currentTable: table,
                      referencedTable: $$HesabsTableReferences
                          ._journalRowsRefsTable(db),
                      managerFromTypedResult: (p0) => $$HesabsTableReferences(
                        db,
                        table,
                        p0,
                      ).journalRowsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.hesabId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$HesabsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HesabsTable,
      Hesab,
      $$HesabsTableFilterComposer,
      $$HesabsTableOrderingComposer,
      $$HesabsTableAnnotationComposer,
      $$HesabsTableCreateCompanionBuilder,
      $$HesabsTableUpdateCompanionBuilder,
      (Hesab, $$HesabsTableReferences),
      Hesab,
      PrefetchHooks Function({bool journalRowsRefs})
    >;
typedef $$JournalsTableCreateCompanionBuilder =
    JournalsCompanion Function({
      required String id,
      Value<int?> referenceNumber,
      required int date,
      required String description,
      Value<bool> isAuto,
      Value<String> currencyCode,
      Value<bool> signed,
      required int createdAt,
      Value<int?> updatedAt,
      Value<int> version,
      Value<bool> isDeleted,
      Value<int?> deletedAt,
      Value<int> rowid,
    });
typedef $$JournalsTableUpdateCompanionBuilder =
    JournalsCompanion Function({
      Value<String> id,
      Value<int?> referenceNumber,
      Value<int> date,
      Value<String> description,
      Value<bool> isAuto,
      Value<String> currencyCode,
      Value<bool> signed,
      Value<int> createdAt,
      Value<int?> updatedAt,
      Value<int> version,
      Value<bool> isDeleted,
      Value<int?> deletedAt,
      Value<int> rowid,
    });

final class $$JournalsTableReferences
    extends BaseReferences<_$AppDatabase, $JournalsTable, Journal> {
  $$JournalsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$JournalRowsTable, List<JournalRow>>
  _journalRowsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.journalRows,
    aliasName: $_aliasNameGenerator(db.journals.id, db.journalRows.journalId),
  );

  $$JournalRowsTableProcessedTableManager get journalRowsRefs {
    final manager = $$JournalRowsTableTableManager(
      $_db,
      $_db.journalRows,
    ).filter((f) => f.journalId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_journalRowsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$JournalsTableFilterComposer
    extends Composer<_$AppDatabase, $JournalsTable> {
  $$JournalsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get referenceNumber => $composableBuilder(
    column: $table.referenceNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isAuto => $composableBuilder(
    column: $table.isAuto,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get signed => $composableBuilder(
    column: $table.signed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> journalRowsRefs(
    Expression<bool> Function($$JournalRowsTableFilterComposer f) f,
  ) {
    final $$JournalRowsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.journalRows,
      getReferencedColumn: (t) => t.journalId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$JournalRowsTableFilterComposer(
            $db: $db,
            $table: $db.journalRows,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$JournalsTableOrderingComposer
    extends Composer<_$AppDatabase, $JournalsTable> {
  $$JournalsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get referenceNumber => $composableBuilder(
    column: $table.referenceNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isAuto => $composableBuilder(
    column: $table.isAuto,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get signed => $composableBuilder(
    column: $table.signed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$JournalsTableAnnotationComposer
    extends Composer<_$AppDatabase, $JournalsTable> {
  $$JournalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get referenceNumber => $composableBuilder(
    column: $table.referenceNumber,
    builder: (column) => column,
  );

  GeneratedColumn<int> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isAuto =>
      $composableBuilder(column: $table.isAuto, builder: (column) => column);

  GeneratedColumn<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get signed =>
      $composableBuilder(column: $table.signed, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<int> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  Expression<T> journalRowsRefs<T extends Object>(
    Expression<T> Function($$JournalRowsTableAnnotationComposer a) f,
  ) {
    final $$JournalRowsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.journalRows,
      getReferencedColumn: (t) => t.journalId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$JournalRowsTableAnnotationComposer(
            $db: $db,
            $table: $db.journalRows,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$JournalsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $JournalsTable,
          Journal,
          $$JournalsTableFilterComposer,
          $$JournalsTableOrderingComposer,
          $$JournalsTableAnnotationComposer,
          $$JournalsTableCreateCompanionBuilder,
          $$JournalsTableUpdateCompanionBuilder,
          (Journal, $$JournalsTableReferences),
          Journal,
          PrefetchHooks Function({bool journalRowsRefs})
        > {
  $$JournalsTableTableManager(_$AppDatabase db, $JournalsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JournalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$JournalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JournalsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<int?> referenceNumber = const Value.absent(),
                Value<int> date = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<bool> isAuto = const Value.absent(),
                Value<String> currencyCode = const Value.absent(),
                Value<bool> signed = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int?> updatedAt = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => JournalsCompanion(
                id: id,
                referenceNumber: referenceNumber,
                date: date,
                description: description,
                isAuto: isAuto,
                currencyCode: currencyCode,
                signed: signed,
                createdAt: createdAt,
                updatedAt: updatedAt,
                version: version,
                isDeleted: isDeleted,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<int?> referenceNumber = const Value.absent(),
                required int date,
                required String description,
                Value<bool> isAuto = const Value.absent(),
                Value<String> currencyCode = const Value.absent(),
                Value<bool> signed = const Value.absent(),
                required int createdAt,
                Value<int?> updatedAt = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => JournalsCompanion.insert(
                id: id,
                referenceNumber: referenceNumber,
                date: date,
                description: description,
                isAuto: isAuto,
                currencyCode: currencyCode,
                signed: signed,
                createdAt: createdAt,
                updatedAt: updatedAt,
                version: version,
                isDeleted: isDeleted,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$JournalsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({journalRowsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (journalRowsRefs) db.journalRows],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (journalRowsRefs)
                    await $_getPrefetchedData<
                      Journal,
                      $JournalsTable,
                      JournalRow
                    >(
                      currentTable: table,
                      referencedTable: $$JournalsTableReferences
                          ._journalRowsRefsTable(db),
                      managerFromTypedResult: (p0) => $$JournalsTableReferences(
                        db,
                        table,
                        p0,
                      ).journalRowsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.journalId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$JournalsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $JournalsTable,
      Journal,
      $$JournalsTableFilterComposer,
      $$JournalsTableOrderingComposer,
      $$JournalsTableAnnotationComposer,
      $$JournalsTableCreateCompanionBuilder,
      $$JournalsTableUpdateCompanionBuilder,
      (Journal, $$JournalsTableReferences),
      Journal,
      PrefetchHooks Function({bool journalRowsRefs})
    >;
typedef $$CostCentersTableCreateCompanionBuilder =
    CostCentersCompanion Function({
      required String id,
      required String code,
      required String name,
      Value<String?> description,
      Value<bool> isActive,
      required CostCenterType type,
      Value<String?> currencyCode,
      Value<double?> budget,
      required int createdAt,
      Value<int?> updatedAt,
      Value<int> version,
      Value<bool> isDeleted,
      Value<int?> deletedAt,
      Value<int> rowid,
    });
typedef $$CostCentersTableUpdateCompanionBuilder =
    CostCentersCompanion Function({
      Value<String> id,
      Value<String> code,
      Value<String> name,
      Value<String?> description,
      Value<bool> isActive,
      Value<CostCenterType> type,
      Value<String?> currencyCode,
      Value<double?> budget,
      Value<int> createdAt,
      Value<int?> updatedAt,
      Value<int> version,
      Value<bool> isDeleted,
      Value<int?> deletedAt,
      Value<int> rowid,
    });

final class $$CostCentersTableReferences
    extends BaseReferences<_$AppDatabase, $CostCentersTable, CostCenter> {
  $$CostCentersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$JournalRowsTable, List<JournalRow>>
  _journalRowsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.journalRows,
    aliasName: $_aliasNameGenerator(
      db.costCenters.id,
      db.journalRows.constCenterId,
    ),
  );

  $$JournalRowsTableProcessedTableManager get journalRowsRefs {
    final manager = $$JournalRowsTableTableManager(
      $_db,
      $_db.journalRows,
    ).filter((f) => f.constCenterId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_journalRowsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CostCentersTableFilterComposer
    extends Composer<_$AppDatabase, $CostCentersTable> {
  $$CostCentersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<CostCenterType, CostCenterType, int>
  get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get budget => $composableBuilder(
    column: $table.budget,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> journalRowsRefs(
    Expression<bool> Function($$JournalRowsTableFilterComposer f) f,
  ) {
    final $$JournalRowsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.journalRows,
      getReferencedColumn: (t) => t.constCenterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$JournalRowsTableFilterComposer(
            $db: $db,
            $table: $db.journalRows,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CostCentersTableOrderingComposer
    extends Composer<_$AppDatabase, $CostCentersTable> {
  $$CostCentersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get budget => $composableBuilder(
    column: $table.budget,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CostCentersTableAnnotationComposer
    extends Composer<_$AppDatabase, $CostCentersTable> {
  $$CostCentersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumnWithTypeConverter<CostCenterType, int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => column,
  );

  GeneratedColumn<double> get budget =>
      $composableBuilder(column: $table.budget, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<int> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  Expression<T> journalRowsRefs<T extends Object>(
    Expression<T> Function($$JournalRowsTableAnnotationComposer a) f,
  ) {
    final $$JournalRowsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.journalRows,
      getReferencedColumn: (t) => t.constCenterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$JournalRowsTableAnnotationComposer(
            $db: $db,
            $table: $db.journalRows,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CostCentersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CostCentersTable,
          CostCenter,
          $$CostCentersTableFilterComposer,
          $$CostCentersTableOrderingComposer,
          $$CostCentersTableAnnotationComposer,
          $$CostCentersTableCreateCompanionBuilder,
          $$CostCentersTableUpdateCompanionBuilder,
          (CostCenter, $$CostCentersTableReferences),
          CostCenter,
          PrefetchHooks Function({bool journalRowsRefs})
        > {
  $$CostCentersTableTableManager(_$AppDatabase db, $CostCentersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CostCentersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CostCentersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CostCentersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<CostCenterType> type = const Value.absent(),
                Value<String?> currencyCode = const Value.absent(),
                Value<double?> budget = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int?> updatedAt = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CostCentersCompanion(
                id: id,
                code: code,
                name: name,
                description: description,
                isActive: isActive,
                type: type,
                currencyCode: currencyCode,
                budget: budget,
                createdAt: createdAt,
                updatedAt: updatedAt,
                version: version,
                isDeleted: isDeleted,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String code,
                required String name,
                Value<String?> description = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                required CostCenterType type,
                Value<String?> currencyCode = const Value.absent(),
                Value<double?> budget = const Value.absent(),
                required int createdAt,
                Value<int?> updatedAt = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CostCentersCompanion.insert(
                id: id,
                code: code,
                name: name,
                description: description,
                isActive: isActive,
                type: type,
                currencyCode: currencyCode,
                budget: budget,
                createdAt: createdAt,
                updatedAt: updatedAt,
                version: version,
                isDeleted: isDeleted,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CostCentersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({journalRowsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (journalRowsRefs) db.journalRows],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (journalRowsRefs)
                    await $_getPrefetchedData<
                      CostCenter,
                      $CostCentersTable,
                      JournalRow
                    >(
                      currentTable: table,
                      referencedTable: $$CostCentersTableReferences
                          ._journalRowsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$CostCentersTableReferences(
                            db,
                            table,
                            p0,
                          ).journalRowsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.constCenterId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CostCentersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CostCentersTable,
      CostCenter,
      $$CostCentersTableFilterComposer,
      $$CostCentersTableOrderingComposer,
      $$CostCentersTableAnnotationComposer,
      $$CostCentersTableCreateCompanionBuilder,
      $$CostCentersTableUpdateCompanionBuilder,
      (CostCenter, $$CostCentersTableReferences),
      CostCenter,
      PrefetchHooks Function({bool journalRowsRefs})
    >;
typedef $$JournalRowsTableCreateCompanionBuilder =
    JournalRowsCompanion Function({
      required String id,
      required int date,
      required int noSnd,
      required int rowF,
      required String hesabId,
      Value<double> prBest,
      Value<double> prBed,
      Value<String> media,
      required String descRow,
      Value<String> currencyCode,
      required String constCenterId,
      Value<bool> isAuto,
      required String journalId,
      required int createdAt,
      Value<int?> updatedAt,
      Value<int> version,
      Value<bool> isDeleted,
      Value<int?> deletedAt,
      Value<int> rowid,
    });
typedef $$JournalRowsTableUpdateCompanionBuilder =
    JournalRowsCompanion Function({
      Value<String> id,
      Value<int> date,
      Value<int> noSnd,
      Value<int> rowF,
      Value<String> hesabId,
      Value<double> prBest,
      Value<double> prBed,
      Value<String> media,
      Value<String> descRow,
      Value<String> currencyCode,
      Value<String> constCenterId,
      Value<bool> isAuto,
      Value<String> journalId,
      Value<int> createdAt,
      Value<int?> updatedAt,
      Value<int> version,
      Value<bool> isDeleted,
      Value<int?> deletedAt,
      Value<int> rowid,
    });

final class $$JournalRowsTableReferences
    extends BaseReferences<_$AppDatabase, $JournalRowsTable, JournalRow> {
  $$JournalRowsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $HesabsTable _hesabIdTable(_$AppDatabase db) => db.hesabs.createAlias(
    $_aliasNameGenerator(db.journalRows.hesabId, db.hesabs.id),
  );

  $$HesabsTableProcessedTableManager get hesabId {
    final $_column = $_itemColumn<String>('hesab_id')!;

    final manager = $$HesabsTableTableManager(
      $_db,
      $_db.hesabs,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_hesabIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CostCentersTable _constCenterIdTable(_$AppDatabase db) =>
      db.costCenters.createAlias(
        $_aliasNameGenerator(db.journalRows.constCenterId, db.costCenters.id),
      );

  $$CostCentersTableProcessedTableManager get constCenterId {
    final $_column = $_itemColumn<String>('const_center_id')!;

    final manager = $$CostCentersTableTableManager(
      $_db,
      $_db.costCenters,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_constCenterIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $JournalsTable _journalIdTable(_$AppDatabase db) =>
      db.journals.createAlias(
        $_aliasNameGenerator(db.journalRows.journalId, db.journals.id),
      );

  $$JournalsTableProcessedTableManager get journalId {
    final $_column = $_itemColumn<String>('journal_id')!;

    final manager = $$JournalsTableTableManager(
      $_db,
      $_db.journals,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_journalIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$JournalRowsTableFilterComposer
    extends Composer<_$AppDatabase, $JournalRowsTable> {
  $$JournalRowsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get noSnd => $composableBuilder(
    column: $table.noSnd,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rowF => $composableBuilder(
    column: $table.rowF,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get prBest => $composableBuilder(
    column: $table.prBest,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get prBed => $composableBuilder(
    column: $table.prBed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get media => $composableBuilder(
    column: $table.media,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descRow => $composableBuilder(
    column: $table.descRow,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isAuto => $composableBuilder(
    column: $table.isAuto,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$HesabsTableFilterComposer get hesabId {
    final $$HesabsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.hesabId,
      referencedTable: $db.hesabs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HesabsTableFilterComposer(
            $db: $db,
            $table: $db.hesabs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CostCentersTableFilterComposer get constCenterId {
    final $$CostCentersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.constCenterId,
      referencedTable: $db.costCenters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CostCentersTableFilterComposer(
            $db: $db,
            $table: $db.costCenters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$JournalsTableFilterComposer get journalId {
    final $$JournalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.journalId,
      referencedTable: $db.journals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$JournalsTableFilterComposer(
            $db: $db,
            $table: $db.journals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$JournalRowsTableOrderingComposer
    extends Composer<_$AppDatabase, $JournalRowsTable> {
  $$JournalRowsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get noSnd => $composableBuilder(
    column: $table.noSnd,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rowF => $composableBuilder(
    column: $table.rowF,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get prBest => $composableBuilder(
    column: $table.prBest,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get prBed => $composableBuilder(
    column: $table.prBed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get media => $composableBuilder(
    column: $table.media,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descRow => $composableBuilder(
    column: $table.descRow,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isAuto => $composableBuilder(
    column: $table.isAuto,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$HesabsTableOrderingComposer get hesabId {
    final $$HesabsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.hesabId,
      referencedTable: $db.hesabs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HesabsTableOrderingComposer(
            $db: $db,
            $table: $db.hesabs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CostCentersTableOrderingComposer get constCenterId {
    final $$CostCentersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.constCenterId,
      referencedTable: $db.costCenters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CostCentersTableOrderingComposer(
            $db: $db,
            $table: $db.costCenters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$JournalsTableOrderingComposer get journalId {
    final $$JournalsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.journalId,
      referencedTable: $db.journals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$JournalsTableOrderingComposer(
            $db: $db,
            $table: $db.journals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$JournalRowsTableAnnotationComposer
    extends Composer<_$AppDatabase, $JournalRowsTable> {
  $$JournalRowsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get noSnd =>
      $composableBuilder(column: $table.noSnd, builder: (column) => column);

  GeneratedColumn<int> get rowF =>
      $composableBuilder(column: $table.rowF, builder: (column) => column);

  GeneratedColumn<double> get prBest =>
      $composableBuilder(column: $table.prBest, builder: (column) => column);

  GeneratedColumn<double> get prBed =>
      $composableBuilder(column: $table.prBed, builder: (column) => column);

  GeneratedColumn<String> get media =>
      $composableBuilder(column: $table.media, builder: (column) => column);

  GeneratedColumn<String> get descRow =>
      $composableBuilder(column: $table.descRow, builder: (column) => column);

  GeneratedColumn<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isAuto =>
      $composableBuilder(column: $table.isAuto, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<int> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  $$HesabsTableAnnotationComposer get hesabId {
    final $$HesabsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.hesabId,
      referencedTable: $db.hesabs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HesabsTableAnnotationComposer(
            $db: $db,
            $table: $db.hesabs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CostCentersTableAnnotationComposer get constCenterId {
    final $$CostCentersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.constCenterId,
      referencedTable: $db.costCenters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CostCentersTableAnnotationComposer(
            $db: $db,
            $table: $db.costCenters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$JournalsTableAnnotationComposer get journalId {
    final $$JournalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.journalId,
      referencedTable: $db.journals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$JournalsTableAnnotationComposer(
            $db: $db,
            $table: $db.journals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$JournalRowsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $JournalRowsTable,
          JournalRow,
          $$JournalRowsTableFilterComposer,
          $$JournalRowsTableOrderingComposer,
          $$JournalRowsTableAnnotationComposer,
          $$JournalRowsTableCreateCompanionBuilder,
          $$JournalRowsTableUpdateCompanionBuilder,
          (JournalRow, $$JournalRowsTableReferences),
          JournalRow,
          PrefetchHooks Function({
            bool hesabId,
            bool constCenterId,
            bool journalId,
          })
        > {
  $$JournalRowsTableTableManager(_$AppDatabase db, $JournalRowsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JournalRowsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$JournalRowsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JournalRowsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<int> date = const Value.absent(),
                Value<int> noSnd = const Value.absent(),
                Value<int> rowF = const Value.absent(),
                Value<String> hesabId = const Value.absent(),
                Value<double> prBest = const Value.absent(),
                Value<double> prBed = const Value.absent(),
                Value<String> media = const Value.absent(),
                Value<String> descRow = const Value.absent(),
                Value<String> currencyCode = const Value.absent(),
                Value<String> constCenterId = const Value.absent(),
                Value<bool> isAuto = const Value.absent(),
                Value<String> journalId = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int?> updatedAt = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => JournalRowsCompanion(
                id: id,
                date: date,
                noSnd: noSnd,
                rowF: rowF,
                hesabId: hesabId,
                prBest: prBest,
                prBed: prBed,
                media: media,
                descRow: descRow,
                currencyCode: currencyCode,
                constCenterId: constCenterId,
                isAuto: isAuto,
                journalId: journalId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                version: version,
                isDeleted: isDeleted,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required int date,
                required int noSnd,
                required int rowF,
                required String hesabId,
                Value<double> prBest = const Value.absent(),
                Value<double> prBed = const Value.absent(),
                Value<String> media = const Value.absent(),
                required String descRow,
                Value<String> currencyCode = const Value.absent(),
                required String constCenterId,
                Value<bool> isAuto = const Value.absent(),
                required String journalId,
                required int createdAt,
                Value<int?> updatedAt = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => JournalRowsCompanion.insert(
                id: id,
                date: date,
                noSnd: noSnd,
                rowF: rowF,
                hesabId: hesabId,
                prBest: prBest,
                prBed: prBed,
                media: media,
                descRow: descRow,
                currencyCode: currencyCode,
                constCenterId: constCenterId,
                isAuto: isAuto,
                journalId: journalId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                version: version,
                isDeleted: isDeleted,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$JournalRowsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({hesabId = false, constCenterId = false, journalId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (hesabId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.hesabId,
                                    referencedTable:
                                        $$JournalRowsTableReferences
                                            ._hesabIdTable(db),
                                    referencedColumn:
                                        $$JournalRowsTableReferences
                                            ._hesabIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (constCenterId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.constCenterId,
                                    referencedTable:
                                        $$JournalRowsTableReferences
                                            ._constCenterIdTable(db),
                                    referencedColumn:
                                        $$JournalRowsTableReferences
                                            ._constCenterIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (journalId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.journalId,
                                    referencedTable:
                                        $$JournalRowsTableReferences
                                            ._journalIdTable(db),
                                    referencedColumn:
                                        $$JournalRowsTableReferences
                                            ._journalIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$JournalRowsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $JournalRowsTable,
      JournalRow,
      $$JournalRowsTableFilterComposer,
      $$JournalRowsTableOrderingComposer,
      $$JournalRowsTableAnnotationComposer,
      $$JournalRowsTableCreateCompanionBuilder,
      $$JournalRowsTableUpdateCompanionBuilder,
      (JournalRow, $$JournalRowsTableReferences),
      JournalRow,
      PrefetchHooks Function({bool hesabId, bool constCenterId, bool journalId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db, _db.products);
  $$SyncQueueTableTableManager get syncQueue =>
      $$SyncQueueTableTableManager(_db, _db.syncQueue);
  $$HesabsTableTableManager get hesabs =>
      $$HesabsTableTableManager(_db, _db.hesabs);
  $$JournalsTableTableManager get journals =>
      $$JournalsTableTableManager(_db, _db.journals);
  $$CostCentersTableTableManager get costCenters =>
      $$CostCentersTableTableManager(_db, _db.costCenters);
  $$JournalRowsTableTableManager get journalRows =>
      $$JournalRowsTableTableManager(_db, _db.journalRows);
}
