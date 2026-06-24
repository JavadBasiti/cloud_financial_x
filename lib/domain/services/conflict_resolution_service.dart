/// Conflict Resolution Service
///
/// This service implements **Optimistic Concurrency + Last-Write-Wins** strategy
/// for resolving conflicts in an offline-first sync system.
///
/// Architecture Principle:
/// - Pure Dart (no dependencies on Drift, Flutter, or repositories)
/// - Stateless and deterministic
/// - Used by sync logic to resolve conflicts between local and remote versions
///
/// Strategy:
/// 1. Higher version wins (remote updated after local)
/// 2. If versions equal → higher updatedAt wins (timestamp-based tiebreaker)
/// 3. If still equal → prefer local change (pessimistic: we trust our local state)
///
/// This ensures deterministic, repeatable conflict resolution across all devices.
class ConflictResolutionService {
  /// Resolves a conflict between a local and remote version of an entity.
  ///
  /// Returns the entity that should be used: either [local] or [remote].
  ///
  /// Parameters:
  /// - [local]: The entity as it exists locally in the device's database
  /// - [remote]: The entity as it exists on the server
  ///
  /// Returns: The winning entity (local or remote)
  ///
  /// Example:
  /// ```dart
  /// final winner = ConflictResolutionService.resolve(
  ///   local: productLocal,
  ///   remote: productRemote,
  /// );
  /// // Use winner.version, winner.updatedAt, etc.
  /// ```
  static T resolve<T extends VersionedEntity>(
    T local,
    T remote,
  ) {
    // Rule 1: Higher version wins
    if (remote.version > local.version) {
      return remote;
    }
    if (local.version > remote.version) {
      return local;
    }

    // Rule 2: If versions are equal, higher updatedAt wins
    if (remote.updatedAt > local.updatedAt) {
      return remote;
    }
    if (local.updatedAt > remote.updatedAt) {
      return local;
    }

    // Rule 3: If everything is equal, prefer local (we trust our local state)
    return local;
  }

  /// Private constructor to prevent instantiation.
  /// This service is stateless and should only be used via static methods.
  ConflictResolutionService._();
}

/// Contract for entities that can be compared in conflict resolution.
///
/// Any entity that participates in sync conflict resolution must implement
/// this interface to provide version and timestamp info.
abstract interface class VersionedEntity {
  /// The version number of this entity.
  /// Incremented with each mutation to enable optimistic concurrency.
  int get version;

  /// The timestamp of the last update (epoch milliseconds).
  /// Used as a tiebreaker when versions are equal.
  int get updatedAt;
}

