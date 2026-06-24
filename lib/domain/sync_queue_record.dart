/// Domain model for a sync queue record.
///
/// This represents a mutation that needs to be synchronized to the server.
/// It is independent of Drift and the database layer.
///
/// Fields:
/// - id: Unique identifier for this sync record
/// - entityType: Type of entity (e.g., "product")
/// - entityId: UUID of the affected entity
/// - operation: Type of mutation (INSERT, UPDATE, DELETE)
/// - payload: JSON snapshot of the entity after mutation
/// - version: Entity version at time of mutation
/// - createdAt: When the mutation occurred (epoch millis)
/// - retryCount: Number of failed sync attempts
/// - lastError: Error message from last failed attempt (nullable)
class SyncQueueRecord {
  final int? id;
  final String entityType;
  final String entityId;
  final SyncOperation operation;
  final String payload; // JSON
  final int version;
  final SyncStatus status;
  final int createdAt;
  final int retryCount;
  final String? lastError;
  final DateTime? lockedAt;


  const SyncQueueRecord({
    this.id,
    required this.entityType,
    required this.entityId,
    required this.operation,
    required this.payload,
    required this.status,
    required this.version,
    required this.createdAt,
    this.retryCount = 0,
    this.lastError,
    this.lockedAt
  });

  /// Copy this record with updated fields.
  SyncQueueRecord copyWith({
    int? id,
    String? entityType,
    String? entityId,
    SyncOperation? operation,
    String? payload,
    SyncStatus? status,
    int? version,
    int? createdAt,
    int? retryCount,
    String? lastError,
    DateTime? lockedAt,
  }) {
    return SyncQueueRecord(
      id: id ?? this.id,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      operation: operation ?? this.operation,
      payload: payload ?? this.payload,
      status: this.status,
      version: version ?? this.version,
      createdAt: createdAt ?? this.createdAt,
      retryCount: retryCount ?? this.retryCount,
      lastError: lastError ?? this.lastError,
      lockedAt: lockedAt ?? this.lockedAt,
    );
  }

  @override
  String toString() => 'SyncQueueRecord('
      'id=$id, '
      'entityType=$entityType, '
      'entityId=$entityId, '
      'operation=$operation, '
      'version=$version, '
      'status=$status, '
      'createdAt=$createdAt, '
      'retryCount=$retryCount, '
      'lockedAt=$lockedAt, '
      ')';
}

/// Enum representing the type of operation in a sync record.
enum SyncOperation {
  insert('INSERT'),
  update('UPDATE'),
  delete('DELETE');

  final String value;

  const SyncOperation(this.value);

  /// Parse a string into a SyncOperation enum.
  static SyncOperation fromString(String value) {
    return SyncOperation.values.firstWhere(
      (op) => op.value == value,
      orElse: () => throw ArgumentError('Unknown operation: $value'),
    );
  }
}
/// Enum representing the type of status in a sync record.
enum SyncStatus {
  pending,
  processing,
  done,
  failed;

  int get dbValue => index;

  static int toDb(SyncStatus status) => status.index;

  static SyncStatus fromDb(int value) =>
      SyncStatus.values[value];
}
