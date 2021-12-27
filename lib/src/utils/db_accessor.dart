import 'package:manga_volume_tracker/src/model/manga.dart';

class DbAccessor {
  static final Database _db = Database();

  static Database get db {
    return _db;
  }
}
