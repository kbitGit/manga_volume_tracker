import 'package:flutter/material.dart';
import 'package:manga_volume_tracker/src/model/manga.dart';
import 'package:manga_volume_tracker/src/utils/manga_input_handle.dart';
import 'package:manga_volume_tracker/src/widgets/manga_creation_and_edit_form.dart';

class EditMangaDialog extends StatefulWidget {
  final Manga manga;

  final Database db;

  const EditMangaDialog({Key? key, required this.manga, required this.db})
      : super(key: key);

  @override
  _EditMangaDialogState createState() => _EditMangaDialogState();
}

class _EditMangaDialogState extends State<EditMangaDialog> {
  late MangaInputHandle handle;
  @override
  void initState() {
    super.initState();
    handle = MangaInputHandle.fromManga(widget.manga);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Manga bearbeiten"),
      actions: [
        ElevatedButton.icon(
          onPressed: () async {
            if (handle.validate()) {
              var mangaToUpdate = widget.manga.copyWith(
                title: handle.name,
                currentVolume: handle.currentVolume,
                completeVolumeCount: handle.maxVolume,
                format: handle.format,
                notes: handle.notes ?? "",
              );
              var success = await widget.db.updateManga(mangaToUpdate);
              Navigator.of(context).pop(success);
            }
          },
          icon: Icon(Icons.save),
          label: Text("Änderungen Speichern"),
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
