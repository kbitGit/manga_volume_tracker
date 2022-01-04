// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(title) => "Manga: ${title} was deleted.";

  static String m1(count) =>
      "${Intl.plural(count, zero: 'No volumes purchased', one: 'One volume purchased', other: '${count} volumes purchased')}";

  static String m2(count, complete) =>
      "${Intl.plural(count, one: '1 of 1 volume purchased', other: '${count} of ${complete} volumes purchased')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "addManga": MessageLookupByLibrary.simpleMessage("Add manga"),
        "addVolume": MessageLookupByLibrary.simpleMessage("Increase volume"),
        "completeCountCannotBeSmallerThanCurrentCount":
            MessageLookupByLibrary.simpleMessage(
                "The complete volume count cannot be smaller than the current count of volumes."),
        "completeVolumeCount":
            MessageLookupByLibrary.simpleMessage("Complete volume count"),
        "completeVolumeCountNeeded": MessageLookupByLibrary.simpleMessage(
            "The complete volume count is required."),
        "currentVolumeCount":
            MessageLookupByLibrary.simpleMessage("Current volume count"),
        "currentVolumeCountCannotBeGreaterThanCompleteCount":
            MessageLookupByLibrary.simpleMessage(
                "The current volume count cannot be greater than the complete count of volumes."),
        "currentVolumeCountNeeded": MessageLookupByLibrary.simpleMessage(
            "The current volume count is required."),
        "deleteManga": MessageLookupByLibrary.simpleMessage("Delete manga"),
        "digitalFormat": MessageLookupByLibrary.simpleMessage("Digital"),
        "editManga": MessageLookupByLibrary.simpleMessage("Edit manga"),
        "formatMustBeSelected":
            MessageLookupByLibrary.simpleMessage("A format must be selected."),
        "mangaFormat": MessageLookupByLibrary.simpleMessage("Mangaformat"),
        "mangaList": MessageLookupByLibrary.simpleMessage("Mangalist"),
        "mangaName": MessageLookupByLibrary.simpleMessage("Title"),
        "mangaNameNeeded":
            MessageLookupByLibrary.simpleMessage("A title is required."),
        "mangaWasDeleted": m0,
        "notes": MessageLookupByLibrary.simpleMessage("Notes"),
        "physicalFormat": MessageLookupByLibrary.simpleMessage("Physical"),
        "purchasedCurrentVolumes": m1,
        "purchasedCurrentVolumesOutOfCompleteVolumeCount": m2,
        "restoreManga": MessageLookupByLibrary.simpleMessage("Restore manga."),
        "saveChanges": MessageLookupByLibrary.simpleMessage("Save Changes"),
        "stillReleasing":
            MessageLookupByLibrary.simpleMessage("Still releasing")
      };
}
