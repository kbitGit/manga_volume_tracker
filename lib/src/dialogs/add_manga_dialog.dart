import 'package:flutter/material.dart';
import 'package:manga_volume_tracker/src/model/manga.dart';
import 'package:manga_volume_tracker/src/utils/manga_input_handle.dart';
import 'package:manga_volume_tracker/src/widgets/manga_creation_and_edit_form.dart';
import 'package:moor/moor.dart' as moor;

class AddMangaDialog extends StatefulWidget {
  final Database db;

  const AddMangaDialog({Key? key, required this.db}) : super(key: key);

  @override
  _AddMangaDialogState createState() => _AddMangaDialogState();
}

class _AddMangaDialogState extends State<AddMangaDialog> {
  late MangaInputHandle handle;
  @override
  void initState() {
    super.initState();
    handle = MangaInputHandle();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Manga hinzufügen"),
      actions: [
        ElevatedButton.icon(
          onPressed: () async {
            if (handle.validate()) {
              var toInsert = MangasCompanion(
                title: moor.Value(handle.name as String),
                currentVolume: moor.Value(handle.currentVolume as int),
                completeVolumeCount: moor.Value(handle.maxVolume as int),
                format: moor.Value(handle.format as MangaFormat),
              );

              await widget.db.addManga(toInsert);
              Navigator.of(context).pop(true);
            }
          },
          icon: Icon(Icons.save),
          label: Text("Manga hinzufügen"),
        )
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MangaCreationAndEditForm(handle),
        ],
      ),
    );
  }
}
