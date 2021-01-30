import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manga_volume_tracker/src/model/manga.dart';
import 'package:moor/moor.dart' as moor;

class AddMangaPage extends StatefulWidget {
  final Database db;

  AddMangaPage(this.db, {Key key}) : super(key: key);

  @override
  _AddMangaPageState createState() => _AddMangaPageState();
}

class _AddMangaPageState extends State<AddMangaPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController nameController = TextEditingController();

  final TextEditingController currentVolumeController = TextEditingController();

  final TextEditingController completedVolumeCountController =
      TextEditingController();
  String _validateName(String value) {
    if (value.isEmpty) return 'A Manga name is required';
    return null;
  }

  String _validateCurrentVolume(String value) {
    if (value.isEmpty) return 'The current volume is required';
    var current = int.parse(value);
    var completeCount = int.parse(completedVolumeCountController.text ?? "0");
    if (current > completeCount)
      return "The current volume cannot be bigger than the complete count";
    return null;
  }

  String _validateCompletedVolumeCount(String value) {
    if (value.isEmpty) return 'The complete volume count is required';
    var current = int.parse(currentVolumeController.text ?? "0");
    var completeCount = int.parse(value);
    if (current > completeCount)
      return "The complete volume count cannot be smaller than the current count";
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Manga"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: nameController,
                  maxLines: 1,
                  validator: _validateName,
                  decoration: InputDecoration(labelText: "Manga name"),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                ),
                TextFormField(
                  controller: completedVolumeCountController,
                  maxLines: 1,
                  validator: _validateCompletedVolumeCount,
                  decoration:
                      InputDecoration(labelText: "Complete Volume Count"),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                ),
                TextFormField(
                  controller: currentVolumeController,
                  maxLines: 1,
                  decoration: InputDecoration(labelText: "Current Volume"),
                  keyboardType: TextInputType.number,
                  validator: _validateCurrentVolume,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            var toInsert = MangasCompanion(
              title: moor.Value(nameController.text),
              currentVolume:
                  moor.Value(int.parse(currentVolumeController.text)),
              completeVolumeCount:
                  moor.Value(int.parse(completedVolumeCountController.text)),
            );
            await widget.db.addManga(toInsert);
            Navigator.of(context).pop();
          }
        },
        icon: Icon(Icons.add),
        label: Text("Add"),
      ),
    );
  }
}
