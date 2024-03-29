import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:manga_volume_tracker/generated/l10n.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
part 'manga.g.dart';

enum MangaFormat { physical, digital }

extension nameExtension on MangaFormat {
  String get name {
    switch (this) {
      case MangaFormat.physical:
        return S.current.physicalFormat;
      case MangaFormat.digital:
        return S.current.digitalFormat;
    }
  }
}

class Mangas extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  IntColumn get currentVolume => integer()();
  IntColumn get completeVolumeCount => integer()();
  IntColumn get format => intEnum<MangaFormat>().withDefault(Constant(0))();
  TextColumn get notes => text().withDefault(Constant(""))();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'manga.sqlite'));
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }
    final cachebase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cachebase;
    return NativeDatabase.createInBackground(file);
  });
}

@DriftDatabase(tables: [Mangas])
class Database extends _$Database {
  Database() : super(_openConnection());

  Stream<List<Manga>> get allMangas =>
      (select(mangas)..orderBy([(t) => OrderingTerm.asc(t.title)])).watch();

  Future<int> addManga(MangasCompanion entry) {
    return into(mangas).insert(entry);
  }

  Future<int> increaseCurrentVolumes(int id, int newValue) {
    return (update(mangas)..where((tbl) => tbl.id.equals(id)))
        .write(MangasCompanion(currentVolume: Value(newValue)));
  }

  Future<bool> updateManga(Manga updatedEntry) {
    return update(mangas).replace(updatedEntry);
  }

  Future<int> deleteManga(Manga entry) {
    return delete(mangas).delete(entry);
  }

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) => m.createAll(),
        onUpgrade: (m, from, to) async {
          if (from < 2) {
            await m.addColumn(mangas, mangas.format);
          }
          if (from < 3) {
            await m.addColumn(mangas, mangas.notes);
          }
        },
        beforeOpen: (details) async {},
      );
}
