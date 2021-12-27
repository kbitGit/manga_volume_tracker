import 'package:flutter/material.dart';
import 'package:manga_volume_tracker/src/dialogs/add_manga_dialog.dart';
import 'package:manga_volume_tracker/src/model/manga.dart';
import 'package:manga_volume_tracker/src/utils/db_accessor.dart';
import 'package:manga_volume_tracker/src/widgets/manga_list_item.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  _MainPageState();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manga Liste'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<List<Manga>>(
            stream: DbAccessor.db.allMangas,
            builder: (context, snapshot) {
              var mangas = snapshot.hasData ? snapshot.data! : <Manga>[];
              return ListView.builder(
                itemBuilder: (context, index) => MangaListItem(
                  index: index,
                  manga: mangas[index],
                ),
                itemCount: mangas.length,
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addManga,
        tooltip: 'Manga hinzufügen',
        child: Icon(Icons.add),
      ),
    );
  }

  void _addManga() async {
    await showDialog<bool>(
      builder: (BuildContext context) {
        return AddMangaDialog();
      },
      context: context,
      barrierDismissible: true,
    );
  }
}
