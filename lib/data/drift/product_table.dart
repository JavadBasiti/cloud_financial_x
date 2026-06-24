import 'package:drift/drift.dart';


@TableIndex(name: 'product_name', columns: {#descF})
class Products extends Table {
  TextColumn get id => text().withLength(min: 36, max: 36)();
  // کد محصول
  TextColumn get code => text().withLength(min: 1, max: 100)();
  // توضیحات محصول (جایگزین name)
  TextColumn get descF => text().withLength(min: 0, max: 255)();
  // واحد اصلی
  TextColumn get unit => text().withLength(min: 0, max: 100)();
  // واحد دوم
  TextColumn get unit2 => text().withLength(min: 0, max: 80)();
  // قیمت
  RealColumn get fee => real().nullable()();

  // ضریب تبدیل واحد دوم به اول
  RealColumn get zaribU2 => real().nullable().withDefault(const Constant(1.0))();

  // هزینهٔ خرید اول
  RealColumn get buyFee => real().nullable().withDefault(const Constant(0.0))();
  // هزینهٔ خرید دوم
  RealColumn get buyFee2 => real().nullable().withDefault(const Constant(0.0))();

  // درصد سود خرید
  RealColumn get buyPercent => real().nullable().withDefault(const Constant(0.0))();

  // هزینهٔ فروش
  RealColumn get saleFee => real().nullable().withDefault(const Constant(0.0))();

  // کمترین حد موجودی
  RealColumn get minLm => real().nullable().withDefault(const Constant(0.0))();

  // بیشترین حد موجودی
  RealColumn get maxLm => real().nullable().withDefault(const Constant(0.0))();

  // هزینهٔ فرمول/دستور
  RealColumn get formFee => real().nullable().withDefault(const Constant(0.0))();

  //فیلدهای عمومی
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();
  IntColumn get version => integer().withDefault(const Constant(1))();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
  IntColumn get deletedAt => integer().nullable()();
  
  @override
  Set<Column> get primaryKey => {id};
  // Set<Column> get secondaryKey1 => {code};
  // Set<Column> get secondaryKey2 => {descF};
  @override
  List<Set<Column>> get uniqueKeys => [{code},];
}
