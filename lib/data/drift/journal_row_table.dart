import 'package:cloud_financial_x/data/drift/cost_center_table.dart';
import 'package:cloud_financial_x/data/drift/hesab_table.dart';
import 'package:cloud_financial_x/data/drift/journal_table.dart';
import 'package:drift/drift.dart';

//ردیفهای سند حسابداری
@TableIndex(name: 'noSnd_rowF', columns: {#noSnd,#rowF})
@TableIndex(name: 'noSnd_hesabId', columns: {#noSnd,#hesabId})
@TableIndex(name: 'HesabId_date', columns: {#hesabId,#date})
@TableIndex(name: 'date_inx', columns: {#date})
@TableIndex(name: 'noSnd_inx', columns: {#noSnd})
@TableIndex(name: 'prBest_inx', columns: {#prBest})
class JournalRows extends Table {
  //UUID
  TextColumn get id => text().withLength(min: 36, max: 36)();
  //تاریخ سند
  IntColumn get date =>  integer()();
  //شماره سند
  IntColumn get noSnd => integer()();
  //شماره ردیف
  IntColumn get rowF => integer()();
  //کد حساب
  TextColumn get hesabId => text().references(Hesabs, #id)();
  //مبلغ ردیف
  RealColumn get prBest => real().withDefault(const Constant(0))();
  //توضیحات ردیف
  TextColumn get descRow => text().withLength(min: 0, max: 255)();
  // ارز مورد کاربرد
  TextColumn get currencyCode => text().withDefault(const Constant('IRR'))();
  //مرکز هزینه
  TextColumn get constCenterId => text().references(CostCenters, #id,
      onUpdate: KeyAction.noAction, onDelete: KeyAction.noAction)();
  //ردیف سند اتوماتیک تولید شده و دستی قابل ویرایش نیست
  BoolColumn get isAuto => boolean().withDefault(const Constant(false))();
  //بقیه اطلاعات سند
  TextColumn get journalId => text().references(Journals, #id,
      onUpdate: KeyAction.noAction, onDelete: KeyAction.noAction)();

  //فیلدهای عمومی
  IntColumn get createdAt =>  integer()();
  IntColumn get updatedAt => integer().nullable()();
  IntColumn get version => integer().withDefault(const Constant(1))();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
  IntColumn get deletedAt => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};

}