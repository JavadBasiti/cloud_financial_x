// import 'dart:js_interop';

import 'package:cloud_financial_x/domain/sync_queue_record.dart';
import 'package:drift/drift.dart';
import '../../ui/common/form_mod.dart';
import '../drift/app_database.dart' as drift_db;
import '../../domain/product.dart';
import '../mapper/product_mapper.dart';
import 'sync_queue_repository.dart';

/// Repository for managing Product entities.
///
/// Architectural Responsibilities:
/// - Orchestrate repository-level transactions
/// - Ensure mutations are paired with sync_queue enqueues
/// - Wrap mutations in db.transaction() to guarantee atomicity
/// - Delegate pure domain logic to domain layer
///
/// Transaction Pattern:
/// All write operations (insert, update, softDelete) follow this pattern:
/// 1. Run business logic at domain layer (outside transaction)
/// 2. Begin transaction
/// 3. Persist entity change
/// 4. Enqueue corresponding sync_queue record
/// 5. Commit or rollback atomically
///
/// This ensures: If entity write fails → no sync enqueue. If enqueue fails → entity write rolls back.
class ProductRepository {
  final drift_db.AppDatabase db;
  final SyncQueueRepository syncQueueRepo;

  ProductRepository(this.db, {SyncQueueRepository? syncQueueRepo})
      : syncQueueRepo = syncQueueRepo ?? SyncQueueRepository(db);

  /// Watch all non-deleted products as a stream.
  /// 
  /// Returns a reactive stream that emits the current list of active products
  /// whenever the database changes.
  Stream<List<Product>> watchAll() {
    final query = (db.select(db.products)..where((tbl) => tbl.isDeleted.equals(false)));
    // ignore: avoid_print
    print('watchAll: query prepared');
    return query.watch().map((rows) {
      // ignore: avoid_print
      print('watchAll: emitted ${rows.length} rows');
      final mapped = rows.map(ProductMapper.toDomain).toList();
      // ignore: avoid_print
      print('watchAll: mapped to ${mapped.length} domain products');
      return mapped;
    });
  }

  ///insert (create) or Update within a transaction.
  Future<void> save(Product product, FormMode mode) async {
    await db.transaction(() async {
      if (mode == FormMode.create) {
        await db.into(db.products).insert(ProductMapper.toInsert(product));
        await syncQueueRepo.enqueue(product,SyncOperation.insert);
      } else {

        await (db.update(db.products)
          ..where((t) => t.id.equals(product.id)))
            //todo: در نبود toUpdate  فعلا از toInsert استفاده شد.
            .write(ProductMapper.toInsert(product));
        // await db.update(db.products).replace( product as Insertable<drift_db.Product>);
        await syncQueueRepo.enqueue( product,SyncOperation.update);
      }
    });
  }

  /// Soft-deletes a product by marking it as deleted.
  ///
  /// This method:
  /// 1. Applies domain business logic (softDelete() method validates and increments version)
  /// 2. Begins a transaction
  /// 3. Updates the product with isDeleted=true and deletedAt timestamp
  /// 4. Enqueues a DELETE sync record with the final state
  /// 5. Commits atomically
  ///
  /// The product is not removed from the database, only marked as deleted.
  /// This is important for:
  /// - Preserving historical data
  /// - Allowing re-sync and conflict resolution
  /// - Supporting recovery if needed
  ///
  /// Parameters:
  /// - [product]: The product to soft-delete
  /// 
  /// Throws: StateError if product is already deleted
  Future<void> softDelete(Product product) async {
    // Domain logic: validate and prepare deletion
    final now = DateTime.now().millisecondsSinceEpoch;
    // final deleted = product.softDelete(now); // May throw if already deleted

    // ignore: avoid_print
    // print('softDelete: soft-deleting product ${product.code} to version ${deleted.version}');
    
    await db.transaction(() async {
      // Step 1: Update the product to mark as deleted
      await (db.update(db.products)
          ..where((tbl) => tbl.id.equals(product.id)))
          .write(
        drift_db.ProductsCompanion(
          isDeleted: Value(true),
          deletedAt: Value(now),
          updatedAt: Value(now),
          version: Value(product.version+1),
        ),
      );
      
      // Step 2: Enqueue the deletion for sync
      await syncQueueRepo.enqueue(product,SyncOperation.delete);
    });
  }

  /// Hard deletes a product by code (development/testing use only).
  ///
  /// WARNING: This permanently removes the product from the database.
  /// Do NOT use in production. Use softDelete() instead.
  Future<void> hardDeleteByCode(String code) {
    return (db.delete(db.products)..where((t) => t.code.equals(code))).go();
  }

  /// Hard deletes a product by ID (development/testing use only).
  ///
  /// WARNING: This permanently removes the product from the database.
  /// Do NOT use in production. Use softDelete() instead.
  Future<void> hardDeleteById(String id) {
    return (db.delete(db.products)..where((t) => t.id.equals(id))).go();
  }
}
