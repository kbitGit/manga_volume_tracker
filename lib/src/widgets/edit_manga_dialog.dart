import 'package:flutter/material.dart';
import 'package:manga_volume_tracker/src/model/manga.dart';

class EditMangaDialog extends StatefulWidget {
  final Manga manga;

  final Database db;

  const EditMangaDialog({Key key, this.manga, this.db}) : super(key: key);

  @override
  _EditMangaDialogState createState() => _EditMangaDialogState();
}

class _EditMangaDialogState extends State<EditMangaDialog> {
  int currentCount;
  int totalCount;

  @override
  void initState() {
    super.initState();
    currentCount = widget.manga.currentVolume;
    totalCount = widget.manga.completeVolumeCount;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Current Volume: $currentCount"),
          TextButton.icon(
            onPressed: () {
              setState(() {
                if (currentCount < totalCount) {
                  ++currentCount;
                }
              });
            },
            icon: Icon(Icons.add),
            label: Text("Increase current volume"),
          ),
          Text("Total Volumes: $totalCount"),
          TextButton.icon(
            onPressed: () => setState(() => ++totalCount),
            icon: Icon(Icons.add),
            label: Text("Increase total volumes"),
          ),
          ElevatedButton.icon(
            onPressed: () async {
              var mangaToUpdate = widget.manga.copyWith(
                  currentVolume: currentCount, completeVolumeCount: totalCount);
              var success = await widget.db.updateManga(mangaToUpdate);
              Navigator.of(context).pop(success);
            },
            icon: Icon(Icons.save),
            label: Text("Save changes"),
          )
        ],
      ),
    );
  }
}
