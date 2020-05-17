import 'package:flutter/material.dart';
import 'package:manga_volume_tracker/src/pages/main_page.dart';
import 'src/themes/default_color_theme.dart';
import 'src/themes/dark_mode_color_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: defaultColorTheme,
      darkTheme: darkModeColorTheme,
      home: MainPage(),
    );
  }
}
