/// Implemented by all domain entities that participate in sync
abstract interface class SyncEntity {
  /// Global identity (UUID)
  String get id;

  /// Optimistic locking / conflict resolution
  int get version;

  /// Stable logical name, NOT class name
  /// e.g. 'product', 'stock', 'invoice'
  String get entityType;

  /// Deterministic snapshot for sync
  /// Must be backward-compatible
  Map<String, dynamic> toSyncJson();
}
