import 'package:cloud_financial_x/domain/product.dart';
import 'package:cloud_financial_x/ui/common/form_mod.dart';

abstract interface class ProductRepositoryContract {
  Stream<List<Product>> watchAll();
  Future<void> save(Product product, FormMode mode);
  Future<void> softDelete(Product product);
}

class ProductService {
  final ProductRepositoryContract repository;

  ProductService(this.repository);

  Stream<List<Product>> watchProducts() => repository.watchAll();

  Future<void> saveProduct(Product product, FormMode mode, {required DateTime now}) async {
    final prepared = _prepareForPersist(product, mode, now);
    await repository.save(prepared, mode);
  }

  Future<void> deleteProduct(Product product, {required DateTime now}) async {
    final deleted = product.copyWith(
      updatedAt: now.millisecondsSinceEpoch,
      version: product.version + 1,
      isDeleted: true,
      deletedAt: now.millisecondsSinceEpoch,
    );
    await repository.softDelete(deleted);
  }

  Product _prepareForPersist(Product product, FormMode mode, DateTime now) {
    final timestamp = now.millisecondsSinceEpoch;
    if (mode == FormMode.create) {
      return product.copyWith(
        id: product.id.isEmpty ? product.id : product.id,
        createdAt: product.createdAt == 0 ? timestamp : product.createdAt,
        updatedAt: timestamp,
        version: product.version + 1,
        isDeleted: false,
      );
    }

    return product.copyWith(
      updatedAt: timestamp,
      version: product.version + 1,
      isDeleted: false,
    );
  }
}
