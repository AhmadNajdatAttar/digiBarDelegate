import 'package:flutter/material.dart';

import '../../consts/consts_colors.dart';
import '../../functions.dart';
import 'colors_dark.dart';
import 'theme_data_dark.dart';

ThemeData darkThemeFN({required String languageCode}) {
  return ThemeData(
    useMaterial3: true,
    brightness: darkBrightness,
    primaryColor: themeColor,
    fontFamily: getFont(languageCode: languageCode),
    progressIndicatorTheme: darkProgressIndicatorThemeData,
    appBarTheme: darkAppBarTheme,
    expansionTileTheme: darkExpansionTileThemeData,
    scaffoldBackgroundColor: darkScaffoldBackgroundColor,
    drawerTheme: darkDrawerThemeData,
    iconTheme: darkIconThemeData,
    textTheme: darkTextTheme,
    primaryTextTheme: darkTextTheme,
    colorScheme:
        ColorScheme.fromSwatch(backgroundColor: themeColor, accentColor: themeColor, brightness: darkBrightness),
    navigationBarTheme: darkNavigationBarThemeData,
    textSelectionTheme: darkTextSelectionThemeData,
    primaryIconTheme: darkPrimaryIconTheme,
    inputDecorationTheme: darkInputDecorationTheme,
    snackBarTheme: darkSnackBarThemeData,
    textButtonTheme:
        TextButtonThemeData(style: ButtonStyle(textStyle: WidgetStateProperty.all(const TextStyle(color: white)))),
    cupertinoOverrideTheme: darkCupertinoThemeData,
    popupMenuTheme: darkPopupMenuTheme,
    dividerTheme: darkDividerTheme,
    dialogTheme: darkDialogTheme,
    elevatedButtonTheme: darkElevatedButtonThemeData,
    outlinedButtonTheme: darkOutlinedButtonThemeData,
    listTileTheme: darkListTileThemeData,
    checkboxTheme: darkCheckboxTheme,
  );
}
