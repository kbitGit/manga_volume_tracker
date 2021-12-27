import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:manga_volume_tracker/src/model/manga.dart';
import 'package:manga_volume_tracker/src/utils/db_accessor.dart';
import 'package:manga_volume_tracker/src/utils/manga_input_handle.dart';
import 'package:manga_volume_tracker/src/widgets/manga_creation_and_edit_form.dart';

class AddMangaDialog extends StatefulWidget {
  const AddMangaDialog({
    Key? key,
  }) : super(key: key);

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
                title: drift.Value(handle.name as String),
                currentVolume: drift.Value(handle.currentVolume as int),
                completeVolumeCount: drift.Value(handle.maxVolume as int),
                format: drift.Value(handle.format as MangaFormat),
                notes: drift.Value(handle.notes ?? ""),
              );

              await DbAccessor.db.addManga(toInsert);
              Navigator.of(context).pop(true);
            }
          },
          icon: Icon(Icons.save),
          label: Text("Manga hinzufügen"),
        )
      ],
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MangaCreationAndEditForm(handle),
          ],
        ),
      ),
    );
  }
}
