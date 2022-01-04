// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Add manga`
  String get addManga {
    return Intl.message(
      'Add manga',
      name: 'addManga',
      desc: '',
      args: [],
    );
  }

  /// `Edit manga`
  String get editManga {
    return Intl.message(
      'Edit manga',
      name: 'editManga',
      desc: '',
      args: [],
    );
  }

  /// `Save Changes`
  String get saveChanges {
    return Intl.message(
      'Save Changes',
      name: 'saveChanges',
      desc: '',
      args: [],
    );
  }

  /// `Mangalist`
  String get mangaList {
    return Intl.message(
      'Mangalist',
      name: 'mangaList',
      desc: '',
      args: [],
    );
  }

  /// `Delete manga`
  String get deleteManga {
    return Intl.message(
      'Delete manga',
      name: 'deleteManga',
      desc: '',
      args: [],
    );
  }

  /// `A title is required.`
  String get mangaNameNeeded {
    return Intl.message(
      'A title is required.',
      name: 'mangaNameNeeded',
      desc: '',
      args: [],
    );
  }

  /// `The current volume count is required.`
  String get currentVolumeCountNeeded {
    return Intl.message(
      'The current volume count is required.',
      name: 'currentVolumeCountNeeded',
      desc: '',
      args: [],
    );
  }

  /// `The current volume count cannot be greater than the complete count of volumes.`
  String get currentVolumeCountCannotBeGreaterThanCompleteCount {
    return Intl.message(
      'The current volume count cannot be greater than the complete count of volumes.',
      name: 'currentVolumeCountCannotBeGreaterThanCompleteCount',
      desc: '',
      args: [],
    );
  }

  /// `The complete volume count is required.`
  String get completeVolumeCountNeeded {
    return Intl.message(
      'The complete volume count is required.',
      name: 'completeVolumeCountNeeded',
      desc: '',
      args: [],
    );
  }

  /// `The complete volume count cannot be smaller than the current count of volumes.`
  String get completeCountCannotBeSmallerThanCurrentCount {
    return Intl.message(
      'The complete volume count cannot be smaller than the current count of volumes.',
      name: 'completeCountCannotBeSmallerThanCurrentCount',
      desc: '',
      args: [],
    );
  }

  /// `A format must be selected.`
  String get formatMustBeSelected {
    return Intl.message(
      'A format must be selected.',
      name: 'formatMustBeSelected',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get mangaName {
    return Intl.message(
      'Title',
      name: 'mangaName',
      desc: '',
      args: [],
    );
  }

  /// `Current volume count`
  String get currentVolumeCount {
    return Intl.message(
      'Current volume count',
      name: 'currentVolumeCount',
      desc: '',
      args: [],
    );
  }

  /// `Complete volume count`
  String get completeVolumeCount {
    return Intl.message(
      'Complete volume count',
      name: 'completeVolumeCount',
      desc: '',
      args: [],
    );
  }

  /// `Still releasing`
  String get stillReleasing {
    return Intl.message(
      'Still releasing',
      name: 'stillReleasing',
      desc: '',
      args: [],
    );
  }

  /// `Mangaformat`
  String get mangaFormat {
    return Intl.message(
      'Mangaformat',
      name: 'mangaFormat',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get notes {
    return Intl.message(
      'Notes',
      name: 'notes',
      desc: '',
      args: [],
    );
  }

  /// `Manga: {title} was deleted.`
  String mangaWasDeleted(Object title) {
    return Intl.message(
      'Manga: $title was deleted.',
      name: 'mangaWasDeleted',
      desc: '',
      args: [title],
    );
  }

  /// `Restore manga.`
  String get restoreManga {
    return Intl.message(
      'Restore manga.',
      name: 'restoreManga',
      desc: '',
      args: [],
    );
  }

  /// `Increase volume`
  String get addVolume {
    return Intl.message(
      'Increase volume',
      name: 'addVolume',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, =0 {No volumes purchased} one{One volume purchased} other{{count} volumes purchased}}`
  String purchasedCurrentVolumes(num count) {
    return Intl.plural(
      count,
      zero: 'No volumes purchased',
      one: 'One volume purchased',
      other: '$count volumes purchased',
      name: 'purchasedCurrentVolumes',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, one{1 of 1 volume purchased} other{{count} of {complete} volumes purchased}}`
  String purchasedCurrentVolumesOutOfCompleteVolumeCount(
      num count, Object complete) {
    return Intl.plural(
      count,
      one: '1 of 1 volume purchased',
      other: '$count of $complete volumes purchased',
      name: 'purchasedCurrentVolumesOutOfCompleteVolumeCount',
      desc: '',
      args: [count, complete],
    );
  }

  /// `Physical`
  String get physicalFormat {
    return Intl.message(
      'Physical',
      name: 'physicalFormat',
      desc: '',
      args: [],
    );
  }

  /// `Digital`
  String get digitalFormat {
    return Intl.message(
      'Digital',
      name: 'digitalFormat',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de', countryCode: 'DE'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
