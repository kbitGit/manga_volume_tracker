import 'package:flutter/material.dart';
import 'package:manga_volume_tracker/src/model/manga.dart';

import 'delete_manga_swipe.dart';

class MangaListItem extends StatelessWidget {
  final Manga manga;
  final int index;
  final void Function(int) handleDeleteManga;

  final void Function(int index, BuildContext context) handleEditManga;

  const MangaListItem(
      {Key? key,
      required this.manga,
      required this.index,
      required this.handleDeleteManga,
      required this.handleEditManga})
      : super(key: key);

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
            handleDeleteManga(index);
          }
        },
        child: Card(
          margin: EdgeInsets.zero,
          elevation: 2,
          child: ExpansionTile(
            title: Text(
              manga.title,
              textScaleFactor: 1.8,
            ),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_getMangaCountText()),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text('Format: ${manga.format.name}'),
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
                            "Notizen:",
                            textScaleFactor: 1.5,
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
                          onPressed: () {},
                          icon: Icon(Icons.add_box),
                          label: Text("Band hinzufügen"),
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
              onPressed: () {
                handleEditManga(index, context);
              },
            ),
          ),
        ),
      ),
    );
  }

  String _getMangaCountText() {
    if (manga.completeVolumeCount == 0) {
      if (manga.currentVolume == 1)
        return '${manga.currentVolume} Bändern gekauft';
      return '${manga.currentVolume} Band gekauft';
    }
    if (manga.completeVolumeCount == 1)
      return '${manga.currentVolume} von ${manga.completeVolumeCount} Band gekauft';
    return '${manga.currentVolume} von ${manga.completeVolumeCount} Bändern gekauft';
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
