import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manga_volume_tracker/src/utils/manga_input_handle.dart';

import 'package:manga_volume_tracker/src/model/manga.dart';

class MangaCreationAndEditForm extends StatefulWidget {
  final MangaInputHandle handle;

  MangaCreationAndEditForm(this.handle, {Key key}) : super(key: key);

  @override
  _MangaCreationAndEditFormState createState() =>
      _MangaCreationAndEditFormState();
}

class _MangaCreationAndEditFormState extends State<MangaCreationAndEditForm> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController currentVolumeController = TextEditingController();

  final TextEditingController completedVolumeCountController =
      TextEditingController();

  String _validateName(String value) {
    if (value.isEmpty) return 'Ein Manga Name wird benötigt.';
    return null;
  }

  String _validateCurrentVolume(String value) {
    if (value?.isEmpty ?? true)
      return 'Die aktuelle Bänderanzahl wird benötigt.';
    var current = int.tryParse(value);
    var completeCount =
        int.tryParse(completedVolumeCountController.text ?? "0");
    if (current > completeCount)
      return "Die aktuelle Bänderanzahl kann nicht größer sein als die Gesamtanzahl an Bändern.";
    return null;
  }

  String _validateCompletedVolumeCount(String value) {
    if (value?.isEmpty ?? true)
      return 'Die Gesamtanzahl an Bändern wird benötigt.';
    var current = int.parse(currentVolumeController.text ?? "0");
    var completeCount = int.parse(value);
    if (current > completeCount)
      return "Die Gesamtanzahl an Bändern kann nicht kleiner sein als die aktuelle Bänderanzahl.";
    return null;
  }

  @override
  void initState() {
    super.initState();

    var handle = widget.handle;
    nameController.addListener(() {
      handle.name = nameController.text;
    });
    currentVolumeController.addListener(() {
      handle.currentVolume = int.tryParse(currentVolumeController.text);
    });
    completedVolumeCountController.addListener(() {
      handle.maxVolume = int.tryParse(completedVolumeCountController.text);
    });
    nameController.text = handle.name ?? "";
    currentVolumeController.text = handle.currentVolume?.toString() ?? "";
    completedVolumeCountController.text = handle.maxVolume?.toString() ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.handle.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: nameController,
            maxLines: 1,
            validator: _validateName,
            decoration: InputDecoration(labelText: "Manga Name"),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
          ),
          TextFormField(
            controller: currentVolumeController,
            maxLines: 1,
            decoration: InputDecoration(
              labelText: "Aktuelle Bänder Anzahl",
              errorMaxLines: 4,
            ),
            keyboardType: TextInputType.number,
            validator: _validateCurrentVolume,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
          ),
          TextFormField(
            controller: completedVolumeCountController,
            maxLines: 1,
            validator: _validateCompletedVolumeCount,
            decoration: InputDecoration(
              labelText: "Komplette Bänder Anzahl",
              errorMaxLines: 4,
            ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            textInputAction: TextInputAction.next,
          ),
          DropdownButtonFormField<MangaFormat>(
            value: widget.handle.format,
            onChanged: (value) => widget.handle.format = value,
            validator: _validateFormatSelected,
            hint: Text("Manga Format"),
            items: MangaFormat.values
                .map(
                  (e) => DropdownMenuItem<MangaFormat>(
                    child: Text(e.toString()),
                    value: e,
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }

  String _validateFormatSelected(MangaFormat value) {
    if (value == null) {
      return "Ein Format muss ausgewählt sein";
    }
    return null;
  }
}
