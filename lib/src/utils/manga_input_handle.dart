import 'package:flutter/material.dart';
import 'package:manga_volume_tracker/src/model/manga.dart';

class MangaInputHandle {
  final GlobalKey<FormState> formKey = GlobalKey();
  String name;
  int currentVolume;
  int maxVolume;

  MangaInputHandle();
  MangaInputHandle.fromManga(Manga manga) {
    name = manga.title;
    currentVolume = manga.currentVolume;
    maxVolume = manga.completeVolumeCount;
  }

  bool validate() {
    return formKey.currentState.validate();
  }
}
