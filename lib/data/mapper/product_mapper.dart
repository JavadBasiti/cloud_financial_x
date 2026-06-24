import 'package:drift/drift.dart';
import '../../domain/product.dart';
import '../drift/app_database.dart' as drift_db;

class ProductMapper {
    static Product toDomain(drift_db.Product r) => Product(
      id: r.id,
        code: r.code,
        descF: r.descF,
        unit: r.unit,
        unit2: r.unit2,
        fee: r.fee,
        zaribU2: r.zaribU2,
        buyFee: r.buyFee,
        buyFee2: r.buyFee2,
        buyPercent: r.buyPercent,
        saleFee: r.saleFee,
        minLm: r.minLm,
        maxLm: r.maxLm,
        formFee: r.formFee,
        createdAt: r.createdAt,
        updatedAt: r.updatedAt,
        version: r.version,
        isDeleted: r.isDeleted,
        deletedAt: r.deletedAt,
      );

  static drift_db.ProductsCompanion toInsert(Product p) {
    final now = DateTime.now().millisecondsSinceEpoch;

    return drift_db.ProductsCompanion.insert(
      id: p.id,
      code: p.code,
      descF: p.descF,
      unit: p.unit,
      unit2: p.unit2,
      fee: Value(p.fee),
      zaribU2: Value(p.zaribU2),
      buyFee: Value(p.buyFee),
      buyFee2: Value(p.buyFee2),
      buyPercent: Value(p.buyPercent),
      saleFee: Value(p.saleFee),
      minLm: Value(p.minLm),
      maxLm: Value(p.maxLm),
      formFee: Value(p.formFee),
      createdAt: p.createdAt,
      updatedAt: now,
      version: const Value(1),
    );
  }
}
