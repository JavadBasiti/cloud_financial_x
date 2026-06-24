import 'dart:convert';
import 'package:drift/drift.dart';
import '../../domain/sync_entity.dart';
import '../../domain/sync_queue_record.dart';
import '../drift/app_database.dart' as drift_db;
import '../mapper/sync_queue_mapper.dart';

/// Repository for managing sync_queue records.
///
/// Responsibilities:
/// - Enqueue mutations for synchronization
/// - Retrieve pending sync records
/// - Mark records as processed
/// - Update retry state
///
/// Architectural Notes:
/// - Enqueue operations are designed to be called WITHIN a transaction
///   along with the entity mutation itself
/// - The transactional wrapper ensures all-or-nothing semantics:
///   if entity write fails, enqueue never happens (and vice versa)
/// - This repository does NOT handle the actual HTTP sync; it only manages
///   the local queue state
class SyncQueueRepository {

  final drift_db.AppDatabase db;

  SyncQueueRepository(this.db);

  /// Enqueues a product INSERT operation in a transaction.
  ///
  /// MUST be called within db.transaction() { } along with the insert.
  ///
  /// Parameters:
  /// - [product]: The product that was inserted
  ///
  /// Example:
  /// ```dart
  /// await db.transaction(() async {
  ///   await productRepo.insert(product);  // actual insert
  ///   await syncQueueRepo.enqueueProductInsert(product);  // enqueue
  /// });
  /// ```
  Future<void> enqueue(SyncEntity entity,SyncOperation operation) async {
    final now = DateTime.now().millisecondsSinceEpoch;

    await db.into(db.syncQueue).insert(
      SyncQueueMapper.toInsert(SyncQueueRecord(
        entityType: entity.entityType,
        entityId: entity.id,
        version: entity.version,
        operation: operation,
        payload: jsonEncode(entity.toSyncJson()),
        status: SyncStatus.pending,
        createdAt: now,
      )),
      mode: InsertMode.insertOrIgnore,
    );
  }


  /// Retrieves all pending sync records (not yet successfully synced).
  /// 
  /// Returns records sorted by createdAt to ensure FIFO processing.
  Future<List<SyncQueueRecord>> getPendingRecords() async {
    final rows = await (db.select(db.syncQueue)
      ..orderBy([(tbl) => OrderingTerm(expression: tbl.createdAt)]))
        .get();
    return rows.map(SyncQueueMapper.toDomain).toList();
  }

  /// Retrieves pending sync records for a specific entity.
  /// 
  /// Useful for checking if an entity has pending changes.
  Future<List<SyncQueueRecord>> getPendingRecordsForEntity(String entityId) async {
    final rows = await (db.select(db.syncQueue)
      ..where((tbl) => tbl.entityId.equals(entityId))
      ..orderBy([(tbl) => OrderingTerm(expression: tbl.createdAt)]))
        .get();
    return rows.map(SyncQueueMapper.toDomain).toList();
  }

  /// Marks a sync record as successfully synced by deleting it.
  /// 
  /// In a production system, you might instead mark it with a syncedAt timestamp
  /// for audit purposes. For now, we delete it to keep the queue clean.
  Future<void> markAsSynced(int recordId) async {
    await (db.delete(db.syncQueue)..where((tbl) => tbl.id.equals(recordId))).go();
  }

  /// Updates the retry count and last error for a failed sync attempt.
  /// 
  /// Parameters:
  /// - [recordId]: ID of the sync record
  /// - [error]: Error message from the failed sync attempt
  Future<void> markSyncFailed(int recordId, String error) async {
    final currentRetryCount = await _getRetryCount(recordId);
    await (db.update(db.syncQueue)..where((tbl) => tbl.id.equals(recordId)))
        .write(
      drift_db.SyncQueueCompanion(
        retryCount: Value(currentRetryCount + 1),
        lastError: Value(error),
      ),
    );
  }

  /// Gets the current retry count for a sync record.
  Future<int> _getRetryCount(int recordId) async {
    final record = await (db.select(db.syncQueue)
      ..where((tbl) => tbl.id.equals(recordId)))
        .getSingleOrNull();
    return record?.retryCount ?? 0;
  }

  /// Gets all sync records for debugging / monitoring.
  /// 
  /// Returns records in creation order.
  Future<List<SyncQueueRecord>> getAllRecords() async {
    final rows = await (db.select(db.syncQueue)
      ..orderBy([(tbl) => OrderingTerm(expression: tbl.createdAt, mode: OrderingMode.desc)]))
        .get();
    return rows.map(SyncQueueMapper.toDomain).toList();
  }

  /// Clears all sync records (useful for testing or explicit reset).
  /// 
  /// WARNING: Use with caution in production. This will remove all pending syncs.
  Future<void> clearAll() async {
    await db.delete(db.syncQueue).go();
  }
}

