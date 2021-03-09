import 'package:flutter/material.dart';
import 'package:manga_volume_tracker/src/model/manga.dart';
import 'package:manga_volume_tracker/src/widgets/edit_manga_dialog.dart';
import 'package:manga_volume_tracker/src/widgets/manga_list_item.dart';
import 'package:moor/moor.dart';
import 'add_manga_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

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
    Manga deletedManga;
    setState(() {
      deletedManga = mangas.removeAt(index);
    });
    var affectedRows = await db.deleteManga(deletedManga);
    if (affectedRows > 0 && deletedManga != null) {
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
    var result = await showDialog(
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
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddMangaPage(db),
      ),
    );
    _updateMangasList();
  }
}
