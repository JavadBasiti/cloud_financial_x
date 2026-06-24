import 'dart:io';
import 'package:drift/drift.dart';
// drift_flutter not required here; using native database
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../../domain/enums/account_level.dart';
import '../../domain/enums/cost_center_type.dart';
import 'product_table.dart';
import 'sync_queue_table.dart';
import 'hesab_table.dart';
import 'journal_table.dart';
import 'journal_row_table.dart';
import 'cost_center_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Products, SyncQueue, Hesabs, Journals, JournalRows, CostCenters])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_open());

  @override
  int get schemaVersion => 5;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
        },
        onUpgrade: (m, from, to) async {
          if (from == 1) {
          }

          if (from < 2) {
          }

          // Migration to add `id` UUID primary key
          if (from < 3) {
          }

          // Migration to add sync_queue table for outbox pattern
          if (from < 4) {
          }

          // Migration to add hesab, journal, journal_row, cost_center tables
          if (from < 5) {
          }
        },
      );
}

LazyDatabase _open() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    return NativeDatabase(File(p.join(dir.path, 'app.db')));
  });
}

// for indexdb in web:
//   LazyDatabase _openConnection() {
//     if (kIsWeb) {
//       return LazyDatabase(() async {
//         return WebDatabase('app_db');
//       });
//     } else {
// // استفاده از NativeDatabase برای پلتفرمهای موبایل و دسکتاپ
//       final dbFolder = await getApplicationDocumentsDirectory();
//       final file = File(p.join(dbFolder.path, 'app_db.sqlite'));
//       return NativeDatabase(file);
//     }
//   }

