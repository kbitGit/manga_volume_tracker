import 'package:flutter/material.dart';
import 'package:manga_volume_tracker/src/model/manga.dart';
import 'package:manga_volume_tracker/src/utils/db_accessor.dart';
import 'package:manga_volume_tracker/src/utils/manga_input_handle.dart';
import 'package:manga_volume_tracker/src/widgets/manga_creation_and_edit_form.dart';
import 'package:manga_volume_tracker/generated/l10n.dart';

class EditMangaDialog extends StatefulWidget {
  final Manga manga;

  const EditMangaDialog({Key? key, required this.manga}) : super(key: key);

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
      title: Text(S.of(context).editManga),
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
              var success = await DbAccessor.db.updateManga(mangaToUpdate);
              Navigator.of(context).pop(success);
            }
          },
          icon: Icon(Icons.save),
          label: Text(S.of(context).saveChanges),
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
