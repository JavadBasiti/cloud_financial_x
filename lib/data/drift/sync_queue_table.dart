import 'package:drift/drift.dart';

/// Drift table for the outbox pattern (sync_queue).
///
/// This table acts as a reliable local queue that records ALL domain mutations
/// for future server synchronization. Each write that mutates domain state MUST
/// enqueue exactly one sync record in the same transaction.
///
/// Architecture:
/// - id: Unique identifier for the sync record (UUID)
/// - entityType: Type of entity affected (e.g., "product")
/// - entityId: UUID of the affected entity
/// - operation: Type of mutation (INSERT, UPDATE, DELETE)
/// - payload: JSON snapshot of the entity after mutation
/// - version: Entity version at the time of mutation (for conflict resolution)
/// - createdAt: Timestamp when mutation occurred (epoch millis)
/// - retryCount: Number of failed sync attempts
/// - lastError: Last error message from sync attempt (nullable)
class SyncQueue extends Table {
  /// Unique identifier for this sync record.
  /// Generated as UUID to ensure global uniqueness.
  // TextColumn get id => text().withLength(min: 36, max: 36)();
  IntColumn get id => integer().autoIncrement()();

  /// Type of entity being synchronized (e.g., "product").
  /// Allows the system to route sync messages to appropriate handlers.
  /// Logical entity type (product, stock, factor, ...)
  TextColumn get entityType => text().withLength(min: 1, max: 50)();

  /// UUID of the affected entity.
  /// Links this sync record to the actual entity in its respective table.
  TextColumn get entityId => text().withLength(min: 36, max: 36)();

  /// Type of operation: INSERT, UPDATE, or DELETE.
  /// Used by sync logic to apply the correct mutation on the server.
  TextColumn get operation => text().withLength(min: 6, max: 6)(); // "INSERT", "UPDATE", or "DELETE"

  /// JSON snapshot of the entity AFTER the mutation.
  /// Allows the server to receive the complete entity state without querying local DB.
  /// The payload is the source of truth for what to send to the server.
  TextColumn get payload => text()();

  /// وضعیت پردازش
  IntColumn get status => integer().withDefault(const Constant(0))();
  // 0=pending, 1=processing, 2=done, 3=failed


  /// Entity version at the time of the mutation.
  /// Used by the server's conflict resolution to determine which version is newer.
  IntColumn get version => integer()();

  /// Timestamp when the mutation occurred (epoch milliseconds).
  /// Used to establish ordering and for conflict resolution as a tiebreaker.
  /// Ordering + audit
  IntColumn get createdAt => integer()();

  /// Number of failed attempts to synchronize this record.
  /// Allows the system to implement exponential backoff and abandon hopelessly failed records.
  IntColumn get retryCount => integer().withDefault(const Constant(0))();

  /// Error message from the most recent failed sync attempt.
  /// Nullable, present only if a sync has been attempted and failed.
  /// Useful for debugging and monitoring.
  TextColumn get lastError => text().nullable()();

  /// برای lock خوش‌ساخت
  DateTimeColumn get lockedAt => dateTime().nullable()();

  // @override
  // Set<Column> get primaryKey => {id};
  Set<Column> get secondaryKey => {entityType, entityId, operation, createdAt};

}