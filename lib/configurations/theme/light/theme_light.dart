import 'package:flutter/material.dart';

import '../../consts/consts_colors.dart';
import '../../functions.dart';
import 'colors_light.dart';
import 'theme_data_light.dart';

ThemeData lightThemeFN({required String languageCode}) {
  return ThemeData(
    useMaterial3: true,
    brightness: lightBrightness,
    primaryColor: themeColor,
    fontFamily: getFont(languageCode: languageCode),
    progressIndicatorTheme: lightProgressIndicatorThemeData,
    appBarTheme: lightAppBarTheme,
    expansionTileTheme: lightExpansionTileThemeData,
    scaffoldBackgroundColor: lightScaffoldBackgroundColor,
    drawerTheme: lightDrawerThemeData,
    iconTheme: lightIconThemeData,
    textTheme: lightTextTheme,
    primaryTextTheme: lightTextTheme,
    colorScheme: ColorScheme.fromSwatch(
      backgroundColor: themeColor,
      accentColor: themeColorAccent,
      brightness: lightBrightness,
    ),
    navigationBarTheme: lightNavigationBarThemeData,
    textSelectionTheme: lightTextSelectionThemeData,
    primaryIconTheme: lightPrimaryIconTheme,
    inputDecorationTheme: lightInputDecorationTheme,
    snackBarTheme: lightSnackBarThemeData,
    cupertinoOverrideTheme: lightCupertinoThemeData,
    popupMenuTheme: lightPopupMenuTheme,
    dividerTheme: lightDividerTheme,
    dialogTheme: lightDialogTheme,
    elevatedButtonTheme: lightElevatedButtonThemeData,
    outlinedButtonTheme: lightOutlinedButtonThemeData,
    listTileTheme: lightListTileThemeData,
    checkboxTheme: lightCheckboxTheme,
  );
}
