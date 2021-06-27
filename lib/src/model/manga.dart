import 'dart:io';

import 'package:moor/moor.dart';
import 'package:moor/ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
part 'manga.g.dart';

enum MangaFormat { physical, digital }

extension nameExtension on MangaFormat {
  String get name {
    switch (this) {
      case MangaFormat.physical:
        return "Physisch";
      case MangaFormat.digital:
        return "Digital";
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
    return VmDatabase(file);
  });
}

@UseMoor(tables: [Mangas])
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
