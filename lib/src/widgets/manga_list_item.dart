import 'package:flutter/material.dart';
import 'package:manga_volume_tracker/src/model/manga.dart';

class MangaListItem extends StatelessWidget {
  final Manga manga;

  const MangaListItem({Key key, this.manga}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        title: Text(
          manga.title,
        ),
        subtitle: Text(
            '${manga.currentVolume} von ${manga.completeVolumeCount} Bändern gekauft'),
      ),
    );
  }
}
