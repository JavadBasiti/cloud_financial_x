import 'package:drift/drift.dart';
import '../../domain/enums/account_level.dart';

//سرفصلهای حسابداری accounting code
@TableIndex(name: 'hesab_name', columns: {#name})
@TableIndex(name: 'hesab_search', columns: {#level,#code,#name})
class Hesabs extends Table {
  //UUID
  TextColumn get id => text().withLength(min: 36, max: 36)();
  // سطح حساب فقط شامل: 0 یا 1 یا 2 یا 3 یا 4
  IntColumn get level => intEnum<AccountLevel>()();
  // شناسه سرفصل اصلی (null یعنی سرفصل ریشه)
  TextColumn get parentId => text().nullable()();
  // کد حساب
  TextColumn get code => text().withLength(min: 1, max: 20)();
  // نام حساب
  TextColumn get name => text().withLength(min: 1, max: 255)();
  // موجودی حساب به ارز بومی
  RealColumn get balance => real().nullable()();//.withDefault(const Constant(0))();
  //
  RealColumn get fuPrice => real().nullable()();//.withDefault(const Constant(0))();
  // نام انگلیسی حساب
  TextColumn get nameEn => text().withLength(min: 0, max: 1500)();

  //فیلدهای عمومی
  IntColumn get createdAt =>  integer().withDefault(currentDate.unixepoch)();
  IntColumn get updatedAt => integer().nullable()();
  IntColumn get version => integer().withDefault(const Constant(1))();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
  IntColumn get deletedAt => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
  @override
  List<Set<Column>> get uniqueKeys => [{code},];

}
