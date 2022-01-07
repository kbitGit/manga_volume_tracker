import 'package:flutter/material.dart';
import 'package:manga_volume_tracker/src/themes/style_dictionary.dart';

final ThemeData defaultColorTheme = ThemeData.from(
  colorScheme: ColorScheme(
    primary: StyleDictionary.colorMdSysColorPrimaryLight,
    primaryVariant: StyleDictionary.colorMdRefPalettePrimary20,
    secondary: StyleDictionary.colorMdSysColorSecondaryLight,
    secondaryVariant: StyleDictionary.colorMdRefPaletteSecondary20,
    surface: StyleDictionary.colorMdSysColorSurfaceLight,
    background: StyleDictionary.colorMdSysColorBackgroundLight,
    error: StyleDictionary.colorMdSysColorErrorLight,
    onPrimary: StyleDictionary.colorMdSysColorOnPrimaryLight,
    onSecondary: StyleDictionary.colorMdSysColorOnSecondaryLight,
    onSurface: StyleDictionary.colorMdSysColorOnSurfaceLight,
    onBackground: StyleDictionary.colorMdSysColorOnBackgroundLight,
    onError: StyleDictionary.colorMdSysColorOnErrorLight,
    brightness: Brightness.light,
  ),
).copyWith(
  snackBarTheme: SnackBarThemeData(
    actionTextColor: StyleDictionary.colorMdSysColorSecondaryDark,
  ),
);
