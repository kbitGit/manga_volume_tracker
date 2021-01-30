import 'dart:io';

import 'package:moor/moor.dart';
import 'package:moor/ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
part 'manga.g.dart';

class Mangas extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  IntColumn get currentVolume => integer()();
  IntColumn get completeVolumeCount => integer()();
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
  int get schemaVersion => 1;
}
