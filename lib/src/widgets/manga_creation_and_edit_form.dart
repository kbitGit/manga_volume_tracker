import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manga_volume_tracker/src/utils/manga_input_handle.dart';
import 'package:manga_volume_tracker/src/model/manga.dart';
import 'package:manga_volume_tracker/generated/l10n.dart';

class MangaCreationAndEditForm extends StatefulWidget {
  final MangaInputHandle handle;

  MangaCreationAndEditForm(this.handle, {Key? key}) : super(key: key);

  @override
  _MangaCreationAndEditFormState createState() =>
      _MangaCreationAndEditFormState();
}

class _MangaCreationAndEditFormState extends State<MangaCreationAndEditForm> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController currentVolumeController = TextEditingController();

  final TextEditingController completedVolumeCountController =
      TextEditingController();

  final TextEditingController noteController = TextEditingController(text: "");

  bool _stillReleasing = false;
  String _previousMaxVolumeCount = "";

  String? _validateName(String? value) {
    if (value?.isEmpty ?? true) return S.of(context).mangaNameNeeded;
    return null;
  }

  String? _validateCurrentVolume(String? value) {
    if (value?.isEmpty ?? true) return S.of(context).currentVolumeCountNeeded;
    return null;
  }

  String? _validateCompletedVolumeCount(String? value) {
    if (_stillReleasing) return null;
    if (value?.isEmpty ?? true) return S.of(context).completeVolumeCountNeeded;
    if (currentVolumeController.text.isEmpty) return null;
    var current = int.parse(currentVolumeController.text);
    var completeCount = int.parse(value as String);
    if (current > completeCount)
      return S.of(context).completeCountCannotBeSmallerThanCurrentCount;
    return null;
  }

  String? _validateFormatSelected(MangaFormat? value) {
    if (value == null) {
      return S.of(context).formatMustBeSelected;
    }
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
    noteController.addListener(() {
      handle.notes = noteController.text;
    });
    nameController.text = handle.name ?? "";
    currentVolumeController.text = handle.currentVolume?.toString() ?? "";
    completedVolumeCountController.text = handle.maxVolume?.toString() ?? "";
    noteController.text = handle.notes?.toString() ?? "";
    if (handle.maxVolume == 0) {
      _stillReleasing = true;
    }
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
            decoration: InputDecoration(labelText: S.of(context).mangaName),
            textInputAction: TextInputAction.next,
          ),
          TextFormField(
            controller: currentVolumeController,
            maxLines: 1,
            decoration: InputDecoration(
              labelText: S.of(context).currentVolumeCount,
              errorMaxLines: 4,
            ),
            keyboardType: TextInputType.number,
            validator: _validateCurrentVolume,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            textInputAction: TextInputAction.next,
          ),
          Visibility(
            visible: !_stillReleasing,
            child: TextFormField(
              controller: completedVolumeCountController,
              maxLines: 1,
              validator: _validateCompletedVolumeCount,
              decoration: InputDecoration(
                labelText: S.of(context).completeVolumeCount,
                errorMaxLines: 4,
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              textInputAction: TextInputAction.next,
            ),
          ),
          Row(
            children: [
              Text(S.of(context).stillReleasing),
              Text(":"),
              Checkbox(
                value: _stillReleasing,
                onChanged: (val) => setState(() {
                  _stillReleasing = val ?? false;
                  if (_stillReleasing) {
                    _previousMaxVolumeCount =
                        completedVolumeCountController.text;
                    completedVolumeCountController.text = "0";
                  } else if (_previousMaxVolumeCount.isEmpty) {
                    completedVolumeCountController.text =
                        currentVolumeController.text.isNotEmpty
                            ? currentVolumeController.text
                            : "0";
                  } else {
                    completedVolumeCountController.text =
                        _previousMaxVolumeCount;
                  }
                }),
              ),
            ],
          ),
          DropdownButtonFormField<MangaFormat>(
            value: widget.handle.format,
            onChanged: (value) => widget.handle.format = value,
            validator: _validateFormatSelected,
            decoration: InputDecoration(
              labelText: S.of(context).mangaFormat,
              errorMaxLines: 4,
            ),
            items: MangaFormat.values
                .map(
                  (e) => DropdownMenuItem<MangaFormat>(
                    child: Text(e.name),
                    value: e,
                  ),
                )
                .toList(),
          ),
          TextFormField(
            controller: noteController,
            maxLines: 3,
            decoration: InputDecoration(
              labelText: S.of(context).notes,
              errorMaxLines: 4,
            ),
          ),
        ],
      ),
    );
  }
}
