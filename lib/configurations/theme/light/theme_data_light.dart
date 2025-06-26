import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../consts/consts.dart';
import '../../consts/consts_colors.dart';
import '../dark/colors_dark.dart';
import 'colors_light.dart';

const Brightness lightBrightness = Brightness.light;

const TextStyle lightBodySmall = TextStyle(color: grey700, fontSize: 14);
const TextStyle lightBodyMedium = TextStyle(color: grey700, fontSize: 15);
const TextStyle lightBodyLarge = TextStyle(color: grey700, fontSize: 16);

const TextStyle lightDisplaySmall = TextStyle(color: grey500, fontSize: 15, fontWeight: FontWeight.bold);
const TextStyle lightDisplayMedium = TextStyle(color: grey500, fontSize: 18, fontWeight: FontWeight.bold);
const TextStyle lightDisplayLarge =
    TextStyle(color: Color.fromARGB(255, 113, 112, 112), fontSize: 22, fontWeight: FontWeight.w500);

const TextStyle headlineSmall = TextStyle(
  color: grey700,
  fontSize: 20,
);
const TextStyle headlineMedium = TextStyle(
  color: grey700,
  fontSize: 25,
);
const TextStyle headlineLarge = TextStyle(
  color: grey700,
  fontSize: 35,
);

const TextTheme lightTextTheme = TextTheme(
  bodySmall: lightBodySmall,
  bodyMedium: lightBodyMedium,
  bodyLarge: lightBodyLarge,
  displaySmall: lightDisplaySmall,
  displayMedium: lightDisplayMedium,
  displayLarge: lightDisplayLarge,
  headlineSmall: headlineSmall,
  headlineMedium: headlineMedium,
  headlineLarge: headlineLarge,
  titleMedium: lightBodyMedium,
  titleSmall: lightBodySmall,
  titleLarge: lightBodyLarge,
);

ProgressIndicatorThemeData lightProgressIndicatorThemeData =
    const ProgressIndicatorThemeData(color: orange, circularTrackColor: transparent);

const AppBarTheme lightAppBarTheme = AppBarTheme(
    backgroundColor: themeColor,
    centerTitle: true,
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),
    iconTheme: IconThemeData(color: Colors.white),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(12))));

const DrawerThemeData lightDrawerThemeData = DrawerThemeData(
  backgroundColor: lightScaffoldBackgroundColor,
  shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.horizontal(end: Radius.circular(12))),
);

const IconThemeData lightIconThemeData = IconThemeData(color: grey700);

const ExpansionTileThemeData lightExpansionTileThemeData = ExpansionTileThemeData(
  iconColor: grey500,
  collapsedIconColor: grey700,
  textColor: grey500,
  collapsedTextColor: grey700,
  expandedAlignment: AlignmentDirectional.centerStart,
  childrenPadding: EdgeInsetsDirectional.only(start: 10),
);

const NavigationBarThemeData lightNavigationBarThemeData =
    NavigationBarThemeData(backgroundColor: lightScaffoldBackgroundColor);
const TextSelectionThemeData lightTextSelectionThemeData = TextSelectionThemeData(cursorColor: orange);

const IconThemeData lightPrimaryIconTheme = IconThemeData(color: grey700);

const UnderlineInputBorder enabledBorder = UnderlineInputBorder(borderSide: BorderSide(color: grey500));
const UnderlineInputBorder focusedBorder = UnderlineInputBorder(borderSide: BorderSide(color: orange));
const UnderlineInputBorder errorBorder = UnderlineInputBorder(borderSide: BorderSide(color: red));

const TextStyle errorStyle = TextStyle(color: red);
const TextStyle hintStyle = TextStyle(color: grey500, fontSize: 12);

const InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
  errorBorder: errorBorder,
  enabledBorder: enabledBorder,
  focusedBorder: focusedBorder,
  prefixIconColor: grey700,
  errorStyle: errorStyle,
  hintStyle: hintStyle,
  suffixIconColor: grey700,
  labelStyle: hintStyle,
);

const CupertinoThemeData lightCupertinoThemeData = CupertinoThemeData(
    brightness: lightBrightness,
    barBackgroundColor: themeColor,
    textTheme: CupertinoTextThemeData(
      primaryColor: Colors.white,
      navTitleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 22,
        inherit: false,
        letterSpacing: -0.4,
        decoration: TextDecoration.none,
      ),
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 22,
        inherit: false,
        letterSpacing: -0.4,
        decoration: TextDecoration.none,
      ),
    ));

const IconData passwordIcon = Icons.password;
const IconData userNameIcon = Icons.person;

SnackBarThemeData lightSnackBarThemeData = SnackBarThemeData(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  showCloseIcon: true,
  closeIconColor: white,
  behavior: SnackBarBehavior.floating,
  insetPadding: const EdgeInsets.all(12),
  actionBackgroundColor: lightScaffoldBackgroundColor,
  actionTextColor: grey700,
  backgroundColor: orange,
);

PopupMenuThemeData lightPopupMenuTheme = PopupMenuThemeData(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(roundedLoadingButtonBorderRadius)),
  textStyle: lightBodyMedium,
);

const DividerThemeData lightDividerTheme = DividerThemeData(color: grey500, indent: 10, endIndent: 10, thickness: 0.5);

DialogTheme lightDialogTheme = DialogTheme(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  actionsPadding: const EdgeInsets.only(bottom: 20),
);

ElevatedButtonThemeData lightElevatedButtonThemeData = ElevatedButtonThemeData(
  style: ButtonStyle(
    backgroundColor: WidgetStateProperty.all(grey400),
    shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
    minimumSize: WidgetStateProperty.all(const Size(50, 25)),
    foregroundColor: WidgetStateProperty.all(white),
    textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 15)),
    iconColor: WidgetStateProperty.all(grey500),
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  ),
);

OutlinedButtonThemeData lightOutlinedButtonThemeData = OutlinedButtonThemeData(
  style: ButtonStyle(
    textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 15)),
    backgroundColor: WidgetStateProperty.all(themeColor),
    side: WidgetStateProperty.all(const BorderSide(color: themeColor)),
    shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
    minimumSize: WidgetStateProperty.all(const Size(50, 25)),
    foregroundColor: WidgetStateProperty.all(white),
    iconColor: WidgetStateProperty.all(grey500),
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  ),
);

const ListTileThemeData lightListTileThemeData = ListTileThemeData(
  dense: true,
  tileColor: grey200,
  iconColor: grey700,
  textColor: grey700,
  style: ListTileStyle.drawer,
);

const CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
  side: BorderSide(color: grey400),
  fillColor: WidgetStatePropertyAll(themeColor),
  checkColor: WidgetStatePropertyAll(white),
);
