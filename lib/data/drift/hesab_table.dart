import 'package:drift/drift.dart';
import '../../domain/enums/account_level.dart';

//سرقصلهای حسابداری accounting code
@TableIndex(name: 'hesab_name', columns: {#descF})
@TableIndex(name: 'hesab_search', columns: {#levelF,#code,#descF})
class Hesabs extends Table {
  //UUID
  TextColumn get id => text().withLength(min: 36, max: 36)();
  // سطح حساب فقط شامل: 0 یا 1 یا 2 یا 3 یا 4
  IntColumn get levelF => intEnum<AccountLevel>()();
  // کد حساب
  TextColumn get code => text().withLength(min: 1, max: 20)();
  // توضیحات حساب (جایگزین name)
  TextColumn get descF => text().withLength(min: 1, max: 255)();
  //
  RealColumn get crnPrice => real().nullable()();//.withDefault(const Constant(0))();
  //
  RealColumn get fuPrice => real().nullable()();//.withDefault(const Constant(0))();
  //
  TextColumn get exteraDesc => text().withLength(min: 0, max: 1500)();

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