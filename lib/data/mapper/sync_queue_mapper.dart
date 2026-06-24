import 'package:drift/drift.dart';
import '../../domain/sync_queue_record.dart';
import '../drift/app_database.dart' as drift_db;

/// Mapper between domain SyncQueueRecord and Drift database models.
class SyncQueueMapper {
  /// Convert a Drift SyncQueue row to a domain SyncQueueRecord.
  static SyncQueueRecord toDomain(drift_db.SyncQueueData row) {
    return SyncQueueRecord(
      id: row.id,
      entityType: row.entityType,
      entityId: row.entityId,
      operation: SyncOperation.fromString(row.operation),
      payload: row.payload,
      version: row.version,
      status: SyncStatus.fromDb(row.status),
      createdAt: row.createdAt,
      retryCount: row.retryCount,
      lastError: row.lastError,
      lockedAt: row.lockedAt,
    );
  }

  /// Convert a domain SyncQueueRecord to a Drift SyncQueueCompanion for insertion.
  static drift_db.SyncQueueCompanion toInsert(SyncQueueRecord record) {
    return drift_db.SyncQueueCompanion.insert(
      // id: record.id,
      entityType: record.entityType,
      entityId: record.entityId,
      operation: record.operation.value,
      payload: record.payload,
      version: record.version,
      status: Value(record.status.dbValue),
      createdAt: record.createdAt,
      retryCount: Value(record.retryCount),
      lastError: Value(record.lastError),
      lockedAt: Value(record.lockedAt),
    );
  }

  /// Create a SyncQueueRecord for a product insert operation.
  /// 
  /// [productPayload]: JSON string representation of the product.
  /// [productId]: UUID of the product.
  /// [version]: Product version at time of insert.
  static SyncQueueRecord createInsertRecord({
    required int id,
    required String productId,
    required String productPayload,
    required int version,
    required SyncStatus status,
    required int createdAt,
  }) {
    return SyncQueueRecord(
      id: id,
      entityType: 'product',
      entityId: productId,
      operation: SyncOperation.insert,
      payload: productPayload,
      version: version,
      status: status,
      createdAt: createdAt,
      retryCount: 0,
      lastError: null,
    );
  }

  /// Create a SyncQueueRecord for a product update operation.
  static SyncQueueRecord createUpdateRecord({
    required int id,
    required String productId,
    required String productPayload,
    required int version,
    required SyncStatus status,
    required int createdAt,
  }) {
    return SyncQueueRecord(
      id: id,
      entityType: 'product',
      entityId: productId,
      operation: SyncOperation.update,
      payload: productPayload,
      version: version,
      status: status,
      createdAt: createdAt,
      retryCount: 0,
      lastError: null,
    );
  }

  /// Create a SyncQueueRecord for a product delete operation.
  static SyncQueueRecord createDeleteRecord({
    required int id,
    required String productId,
    required String productPayload,
    required int version,
    required SyncStatus status,
    required int createdAt,
  }) {
    return SyncQueueRecord(
      id: id,
      entityType: 'product',
      entityId: productId,
      operation: SyncOperation.delete,
      payload: productPayload,
      version: version,
      status: status,
      createdAt: createdAt,
      retryCount: 0,
      lastError: null,
    );
  }
}
