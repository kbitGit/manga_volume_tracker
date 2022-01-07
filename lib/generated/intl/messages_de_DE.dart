// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a de_DE locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'de_DE';

  static String m0(title) => "Manga: ${title} wurde gelöscht.";

  static String m1(count) =>
      "${Intl.plural(count, zero: 'Kein Bänder gekauft', one: 'Ein Band gekauft', other: '${count} Bänder gekauft')}";

  static String m2(count, complete) =>
      "${Intl.plural(count, one: '1 von 1 Band gekauft', other: '${count} von ${complete} Bändern gekauft')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "addManga": MessageLookupByLibrary.simpleMessage("Manga hinzufügen"),
        "addVolume": MessageLookupByLibrary.simpleMessage("Band hinzufügen"),
        "completeCountCannotBeSmallerThanCurrentCount":
            MessageLookupByLibrary.simpleMessage(
                "Die Gesamtanzahl an Bändern kann nicht kleiner sein als die aktuelle Bänderanzahl."),
        "completeVolumeCount":
            MessageLookupByLibrary.simpleMessage("Komplette Bänder Anzahl"),
        "completeVolumeCountNeeded": MessageLookupByLibrary.simpleMessage(
            "Die Gesamtanzahl an Bändern wird benötigt."),
        "currentVolumeCount":
            MessageLookupByLibrary.simpleMessage("Aktuelle Bänder Anzahl"),
        "currentVolumeCountCannotBeGreaterThanCompleteCount":
            MessageLookupByLibrary.simpleMessage(
                "Die aktuelle Bänderanzahl kann nicht größer sein als die Gesamtanzahl an Bändern."),
        "currentVolumeCountNeeded": MessageLookupByLibrary.simpleMessage(
            "Die aktuelle Bänderanzahl wird benötigt."),
        "deleteManga": MessageLookupByLibrary.simpleMessage("Manga löschen"),
        "digitalFormat": MessageLookupByLibrary.simpleMessage("Digital"),
        "editManga": MessageLookupByLibrary.simpleMessage("Manga bearbeiten"),
        "formatMustBeSelected": MessageLookupByLibrary.simpleMessage(
            "Ein Format muss ausgewählt sein"),
        "mangaFormat": MessageLookupByLibrary.simpleMessage("Mangaformat"),
        "mangaList": MessageLookupByLibrary.simpleMessage("Mangaliste"),
        "mangaName": MessageLookupByLibrary.simpleMessage("Title"),
        "mangaNameNeeded":
            MessageLookupByLibrary.simpleMessage("Ein Titel wird benötigt."),
        "mangaWasDeleted": m0,
        "notes": MessageLookupByLibrary.simpleMessage("Notizen"),
        "physicalFormat": MessageLookupByLibrary.simpleMessage("Physisch"),
        "purchasedCurrentVolumes": m1,
        "purchasedCurrentVolumesOutOfCompleteVolumeCount": m2,
        "restoreManga":
            MessageLookupByLibrary.simpleMessage("Manga wiederherstellen."),
        "saveChanges":
            MessageLookupByLibrary.simpleMessage("Änderungen Speichern"),
        "stillReleasing":
            MessageLookupByLibrary.simpleMessage("Noch am Erscheinen")
      };
}
