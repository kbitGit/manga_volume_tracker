import 'package:flutter/material.dart';
import 'package:manga_volume_tracker/generated/l10n.dart';

class DeleteMangaSwipe extends StatelessWidget {
  const DeleteMangaSwipe({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      alignment: AlignmentDirectional.centerStart,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 5)),
            Text(
              S.of(context).deleteManga,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
