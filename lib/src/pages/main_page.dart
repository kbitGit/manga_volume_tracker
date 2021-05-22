import 'package:flutter/material.dart';
import 'package:manga_volume_tracker/src/dialogs/add_manga_dialog.dart';
import 'package:manga_volume_tracker/src/dialogs/edit_manga_dialog.dart';
import 'package:manga_volume_tracker/src/model/manga.dart';
import 'package:manga_volume_tracker/src/widgets/manga_list_item.dart';
import 'package:moor/moor.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Manga> mangas = [];
  final Database db;

  _MainPageState() : db = Database();

  @override
  void initState() {
    super.initState();
    _updateMangasList();
  }

  Future<void> _updateMangasList() async {
    var loadedMangas = await db.allMangas;
    setState(() {
      mangas = loadedMangas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manga Liste'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RefreshIndicator(
          child: ListView.builder(
            itemBuilder: (context, index) => MangaListItem(
              handleDeleteManga: _handleDeleteManga,
              handleEditManga: _openEditMangaScreen,
              index: index,
              manga: mangas[index],
            ),
            itemCount: mangas.length,
          ),
          onRefresh: _updateMangasList,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addManga,
        tooltip: 'Manga hinzufügen',
        child: Icon(Icons.add),
      ),
    );
  }

  _handleDeleteManga(int index) async {
    late Manga deletedManga;
    setState(() {
      deletedManga = mangas.removeAt(index);
    });
    var affectedRows = await db.deleteManga(deletedManga);
    if (affectedRows > 0) {
      final snackBar = SnackBar(
        content: Text('Manga: ${deletedManga.title} wurde gelöscht.'),
        action: SnackBarAction(
          label: 'Manga wiederherstellen.',
          onPressed: () async {
            await db.addManga(
              MangasCompanion(
                id: Value(deletedManga.id),
                title: Value(deletedManga.title),
                currentVolume: Value(deletedManga.currentVolume),
                completeVolumeCount: Value(deletedManga.completeVolumeCount),
              ),
            );
            _updateMangasList();
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void _openEditMangaScreen(int index, BuildContext context) async {
    var result = await showDialog<bool>(
      builder: (BuildContext context) {
        return EditMangaDialog(
          db: db,
          manga: mangas[index],
        );
      },
      context: context,
      barrierDismissible: true,
    );
    if (result ?? false) {
      _updateMangasList();
    }
  }

  void _addManga() async {
    var result = await showDialog<bool>(
      builder: (BuildContext context) {
        return AddMangaDialog(
          db: db,
        );
      },
      context: context,
      barrierDismissible: true,
    );
    if (result ?? false) {
      _updateMangasList();
    }
  }
}
