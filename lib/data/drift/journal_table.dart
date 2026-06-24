import 'package:drift/drift.dart';

//اطلاعات عمومی سند
@TableIndex(name: 'dateJournal_inx', columns: {#date})
@TableIndex(name: 'noDate_inx', columns: {#referenceNumber})
class Journals extends Table {
  //UUID
  TextColumn get id => text().withLength(min: 36, max: 36)();
  //شماره مبنای سند ** بدلیل first offline امکان وجودی ندارد
  // IntColumn get noSnd => integer().autoIncrement()();
  //شماره سند (بر اساس تاریخ) reference Number
  IntColumn get referenceNumber => integer().nullable()();
  //تاریخ سند
  IntColumn get date => integer()();
  //توضیحات سند
  TextColumn get description => text().withLength(min: 0, max: 400)();
  //سند اتوماتیک تولید شده و دستی نیست
  BoolColumn get isAuto => boolean().withDefault(const Constant(false))();
  // ارز مورد کاربرد
  TextColumn get currencyCode => text().withDefault(const Constant('IRR'))();
  //آیا سند امضا شده است
  BoolColumn get signed => boolean().withDefault(const Constant(false))();

  //فیلدهای عمومی
  IntColumn get createdAt =>  integer()();
  IntColumn get updatedAt => integer().nullable()();
  IntColumn get version => integer().withDefault(const Constant(1))();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
  IntColumn get deletedAt => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
  // @override
  // List<Set<Column>> get uniqueKeys => [{dateSnd},{noSnd},];

}