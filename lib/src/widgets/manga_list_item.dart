import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:manga_volume_tracker/src/dialogs/edit_manga_dialog.dart';
import 'package:manga_volume_tracker/src/model/manga.dart';
import 'package:manga_volume_tracker/src/utils/db_accessor.dart';
import 'package:manga_volume_tracker/generated/l10n.dart';
import 'delete_manga_swipe.dart';

class MangaListItem extends StatelessWidget {
  final Manga manga;
  final int index;
  const MangaListItem({
    Key? key,
    required this.manga,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Dismissible(
        key: ValueKey(manga),
        background: DeleteMangaSwipe(),
        direction: DismissDirection.startToEnd,
        onDismissed: (DismissDirection direction) async {
          if (direction == DismissDirection.startToEnd) {
            var affectedRows = await DbAccessor.db.deleteManga(manga);
            if (affectedRows > 0) {
              final snackBar = SnackBar(
                content: Text(S.of(context).mangaWasDeleted(manga.title)),
                action: SnackBarAction(
                  label: S.of(context).restoreManga,
                  onPressed: () async {
                    await DbAccessor.db.addManga(
                      MangasCompanion(
                        id: drift.Value(manga.id),
                        title: drift.Value(manga.title),
                        currentVolume: drift.Value(manga.currentVolume),
                        completeVolumeCount:
                            drift.Value(manga.completeVolumeCount),
                      ),
                    );
                  },
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          }
        },
        child: Card(
          margin: EdgeInsets.zero,
          elevation: 2,
          child: ExpansionTile(
            title: Text(
              manga.title,
              textScaler: TextScaler.linear(1.8),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_getMangaCountText()),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      '${S.of(context).mangaFormat}: ${manga.format.name}',
                    ),
                  )
                ],
              ),
            ),
            children: [
              ListTile(
                //IntrisicHeight needed for Vertical Divider
                title: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "${S.of(context).notes}:",
                            textScaler: TextScaler.linear(1.5),
                          ),
                          Text(manga.notes)
                        ],
                      ),
                      Visibility(
                        visible: manga.completeVolumeCount == 0 ||
                            manga.currentVolume < manga.completeVolumeCount,
                        child: VerticalDivider(
                          thickness: 3,
                        ),
                      ),
                      Visibility(
                        visible: manga.completeVolumeCount == 0 ||
                            manga.currentVolume < manga.completeVolumeCount,
                        child: ElevatedButton.icon(
                          onPressed: () async {
                            var res = await DbAccessor.db
                                .increaseCurrentVolumes(
                                    manga.id, manga.currentVolume + 1);
                            if (res != 1) {
                              print("Something went wrong: $res lines updated");
                            }
                          },
                          icon: Icon(Icons.add_box),
                          label: Text(S.of(context).addVolume),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
            leading: _getIcon(manga.format),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () async {
                await showDialog<bool>(
                  builder: (BuildContext context) {
                    return EditMangaDialog(
                      manga: manga,
                    );
                  },
                  context: context,
                  barrierDismissible: true,
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  String _getMangaCountText() {
    if (manga.completeVolumeCount == 0) {
      return S.current.purchasedCurrentVolumes(manga.currentVolume);
    }
    return S.current.purchasedCurrentVolumesOutOfCompleteVolumeCount(
        manga.currentVolume, manga.completeVolumeCount);
  }
}

Widget _getIcon(MangaFormat format) {
  switch (format) {
    case MangaFormat.physical:
      return Icon(Icons.book);
    case MangaFormat.digital:
      return Icon(Icons.book_online);
  }
}
