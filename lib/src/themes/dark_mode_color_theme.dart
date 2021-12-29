import 'package:flutter/material.dart';
import 'package:manga_volume_tracker/src/themes/style_dictionary.dart';

final ThemeData darkModeColorTheme = ThemeData.from(
  colorScheme: ColorScheme(
    primary: StyleDictionary.colorMdSysColorPrimaryDark,
    primaryVariant: StyleDictionary.colorMdSysColorPrimaryLight,
    secondary: StyleDictionary.colorMdSysColorSecondaryDark,
    secondaryVariant: StyleDictionary.colorMdSysColorSecondaryLight,
    surface: StyleDictionary.colorMdSysColorSurfaceDark,
    background: StyleDictionary.colorMdSysColorBackgroundDark,
    error: StyleDictionary.colorMdSysColorErrorDark,
    onPrimary: StyleDictionary.colorMdSysColorOnPrimaryDark,
    onSecondary: StyleDictionary.colorMdSysColorOnSecondaryDark,
    onSurface: StyleDictionary.colorMdSysColorOnSurfaceDark,
    onBackground: StyleDictionary.colorMdSysColorOnBackgroundDark,
    onError: StyleDictionary.colorMdSysColorOnErrorDark,
    brightness: Brightness.dark,
  ),
).copyWith(
  snackBarTheme: SnackBarThemeData(
    actionTextColor: StyleDictionary.colorMdSysColorSecondaryLight,
  ),
  checkboxTheme: CheckboxThemeData(
    checkColor: MaterialStateProperty.all(Colors.black),
  ),
);
