import 'package:flutter/material.dart';
import 'package:manga_volume_tracker/src/model/manga.dart';

import 'delete_manga_swipe.dart';

class MangaListItem extends StatelessWidget {
  final Manga manga;
  final int index;
  final void Function(int) handleDeleteManga;

  final void Function(int index, BuildContext context) handleEditManga;

  const MangaListItem(
      {Key key,
      @required this.manga,
      @required this.index,
      @required this.handleDeleteManga,
      @required this.handleEditManga})
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
          child: ListTile(
            title: Text(
              manga.title,
            ),
            subtitle: Text(
                '${manga.currentVolume} von ${manga.completeVolumeCount} Bändern gekauft'),
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
}
