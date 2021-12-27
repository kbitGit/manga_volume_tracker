import 'package:flutter/material.dart';
import 'package:manga_volume_tracker/src/model/manga.dart';

class MangaInputHandle {
  final GlobalKey<FormState> formKey = GlobalKey();
  String? name;
  int? currentVolume;
  int? maxVolume;
  MangaFormat? format;
  String? notes;

  MangaInputHandle();
  MangaInputHandle.fromManga(Manga manga) {
    name = manga.title;
    currentVolume = manga.currentVolume;
    maxVolume = manga.completeVolumeCount;
    format = manga.format;
    notes = manga.notes;
  }

  bool validate() {
    return formKey.currentState?.validate() ?? false;
  }
}
