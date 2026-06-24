import 'package:drift/drift.dart';

import '../../domain/enums/cost_center_type.dart';

//مراکز هزینه
class CostCenters extends Table {
  //UUID
  TextColumn get id => text().withLength(min: 36, max: 36)();

  TextColumn get code => text()();
  TextColumn get name => text()();
  // TextColumn get parentId => text().nullable()();
  TextColumn get description => text().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  IntColumn get type =>  intEnum<CostCenterType>()();
  //ارز مورد کاربرد
  TextColumn get currencyCode => text().nullable()();
  //سقف بودجه
  RealColumn get budget => real().nullable()();

  //فیلدهای عمومی
  IntColumn get createdAt =>  integer()();
  IntColumn get updatedAt => integer().nullable()();
  IntColumn get version => integer().withDefault(const Constant(1))();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
  IntColumn get deletedAt => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

