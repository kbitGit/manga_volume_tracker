import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:manga_volume_tracker/src/pages/main_page.dart';
import 'src/themes/default_color_theme.dart';
import 'src/themes/dark_mode_color_theme.dart';
import 'generated/l10n.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: "Manga Volume Tracker",
      theme: defaultColorTheme,
      darkTheme: darkModeColorTheme,
      home: MainPage(),
    );
  }
}
