import 'package:flutter/material.dart';
import 'package:manga_volume_tracker/src/model/manga.dart';
import 'package:manga_volume_tracker/src/widgets/edit_manga_dialog.dart';
import 'package:manga_volume_tracker/src/widgets/manga_list_item.dart';
import 'add_manga_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Manga> mangas = List();
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
        title: Text('Manga List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RefreshIndicator(
          child: ListView.builder(
            itemBuilder: (context, index) => GestureDetector(
              onTap: () async {
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
              },
              child: MangaListItem(
                manga: mangas[index],
              ),
            ),
            itemCount: mangas.length,
          ),
          onRefresh: _updateMangasList,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addManga,
        tooltip: 'Add Manga',
        child: Icon(Icons.add),
      ),
    );
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
