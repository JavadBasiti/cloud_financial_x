import 'package:cloud_financial_x/domain/product.dart';
import 'package:cloud_financial_x/domain/services/product_service.dart';
import 'package:cloud_financial_x/ui/common/form_mod.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeProductStore implements ProductRepositoryContract {
  Product? savedProduct;
  FormMode? savedMode;
  Product? deletedProduct;

  @override
  Future<void> save(Product product, FormMode mode) async {
    savedProduct = product;
    savedMode = mode;
  }

  @override
  Future<void> softDelete(Product product) async {
    deletedProduct = product;
  }

  @override
  Stream<List<Product>> watchAll() => Stream.value(const []);
}

void main() {
  group('ProductService', () {
    test('prepares a product before persist and increments version', () async {
      final store = FakeProductStore();
      final service = ProductService(store);

      final product = Product(
        id: 'product-1',
        code: 'P-100',
        descF: 'Test product',
        unit: 'عدد',
        createdAt: 100,
        updatedAt: 100,
        version: 1,
        isDeleted: false,
      );

      final now = DateTime(2024, 1, 2, 3, 4, 5);
      await service.saveProduct(product, FormMode.create, now: now);

      expect(store.savedMode, FormMode.create);
      expect(store.savedProduct, isNotNull);
      expect(store.savedProduct!.createdAt, now.millisecondsSinceEpoch);
      expect(store.savedProduct!.updatedAt, now.millisecondsSinceEpoch);
      expect(store.savedProduct!.version, 2);
      expect(store.savedProduct!.isDeleted, false);
    });
  });
}
