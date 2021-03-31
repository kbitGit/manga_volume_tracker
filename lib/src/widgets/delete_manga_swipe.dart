import 'package:flutter/material.dart';

class DeleteMangaSwipe extends StatelessWidget {
  const DeleteMangaSwipe({
    Key key,
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
            Icon(Icons.delete),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 5)),
            Text("Löschen"),
          ],
        ),
      ),
    );
  }
}
