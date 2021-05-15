import 'dart:io';

import 'package:moor/moor.dart';
import 'package:moor/ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
part 'manga.g.dart';

enum MangaFormat { physical, digital }

class Mangas extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  IntColumn get currentVolume => integer()();
  IntColumn get completeVolumeCount => integer()();
  IntColumn get format => intEnum<MangaFormat>().withDefault(Constant(0))();
  IntColumn get languageId => integer().withDefault(Constant(0))();
}

class Languages extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get language => text()();
}

class MangaWithLanguage {
  final Manga manga;
  final Language language;

  MangaWithLanguage(this.manga, this.language);
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'manga.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [Mangas, Languages])
class Database extends _$Database {
  Database() : super(_openConnection());

  Future<List<Manga>> get allMangas => select(mangas).get();

  Future<int> addManga(MangasCompanion entry) {
    return into(mangas).insert(entry);
  }

  Future<bool> updateManga(Manga updatedEntry) {
    return update(mangas).replace(updatedEntry);
  }

  Future<int> deleteManga(Manga entry) {
    return delete(mangas).delete(entry);
  }

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) => m.createAll(),
        onUpgrade: (m, from, to) async {
          if (from == 1) {
            await m.addColumn(mangas, mangas.format);
            await m.addColumn(mangas, mangas.languageId);
            await m.createTable(languages);
          }
        },
        beforeOpen: (details) async {
          if (details.versionBefore == 1) {
            await into(languages).insert(Language(id: 0, language: "Deutsch"));
          }
        },
      );
}
