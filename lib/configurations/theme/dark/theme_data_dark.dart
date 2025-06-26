import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../consts/consts.dart';
import '../../consts/consts_colors.dart';
import '../light/colors_light.dart';
import 'colors_dark.dart';

const Brightness darkBrightness = Brightness.dark;

const TextStyle darkBodySmall = TextStyle(color: grey200, fontSize: 14);
const TextStyle darkBodyMedium = TextStyle(color: grey200, fontSize: 15);
const TextStyle darkBodyLarge = TextStyle(color: grey200, fontSize: 16);

const TextStyle darkDisplaySmall = TextStyle(color: grey200, fontSize: 15, fontWeight: FontWeight.bold);
const TextStyle darkDisplayMedium = TextStyle(color: grey200, fontSize: 18, fontWeight: FontWeight.bold);
const TextStyle darkDisplayLarge =
    TextStyle(color: Color.fromARGB(255, 197, 196, 196), fontSize: 22, fontWeight: FontWeight.w500);

const TextStyle headlineSmall = TextStyle(color: grey200, fontSize: 20);
const TextStyle headlineMedium = TextStyle(color: grey200, fontSize: 25);
const TextStyle headlineLarge = TextStyle(color: grey200, fontSize: 35);

const TextTheme darkTextTheme = TextTheme(
  bodySmall: darkBodySmall,
  bodyMedium: darkBodyMedium,
  bodyLarge: darkBodyLarge,
  displaySmall: darkDisplaySmall,
  displayMedium: darkDisplayMedium,
  displayLarge: darkDisplayLarge,
  headlineSmall: headlineSmall,
  headlineMedium: headlineMedium,
  headlineLarge: headlineLarge,
);

ProgressIndicatorThemeData darkProgressIndicatorThemeData = const ProgressIndicatorThemeData(
  color: orange,
  circularTrackColor: transparent,
);

const AppBarTheme darkAppBarTheme = AppBarTheme(
    backgroundColor: themeColor,
    centerTitle: true,
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500, fontFamily: 'balingka'),
    iconTheme: IconThemeData(color: Colors.white),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(12))));

const DrawerThemeData darkDrawerThemeData = DrawerThemeData(
  backgroundColor: dark,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadiusDirectional.horizontal(end: Radius.circular(12)),
  ),
);

const IconThemeData darkIconThemeData = IconThemeData(color: grey400);

const ExpansionTileThemeData darkExpansionTileThemeData = ExpansionTileThemeData(
  iconColor: grey400,
  collapsedIconColor: grey400,
  textColor: grey400,
  expandedAlignment: AlignmentDirectional.centerStart,
  childrenPadding: EdgeInsetsDirectional.only(top: 5, bottom: 5),
);

const NavigationBarThemeData darkNavigationBarThemeData =
    NavigationBarThemeData(backgroundColor: darkScaffoldBackgroundColor);
const TextSelectionThemeData darkTextSelectionThemeData = TextSelectionThemeData(cursorColor: orange);

const IconThemeData darkPrimaryIconTheme = IconThemeData(color: grey400);

const UnderlineInputBorder enabledBorder = UnderlineInputBorder(borderSide: BorderSide(color: grey400));
const UnderlineInputBorder focusedBorder = UnderlineInputBorder(borderSide: BorderSide(color: orange));
const UnderlineInputBorder errorBorder = UnderlineInputBorder(borderSide: BorderSide(color: red));

const TextStyle errorStyle = TextStyle(color: red);
const TextStyle hintStyle = TextStyle(color: grey500, fontSize: 12);

const InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
  errorBorder: errorBorder,
  enabledBorder: enabledBorder,
  focusedBorder: focusedBorder,
  prefixIconColor: grey400,
  errorStyle: errorStyle,
  hintStyle: hintStyle,
  suffixIconColor: grey400,
);

const CupertinoThemeData darkCupertinoThemeData = CupertinoThemeData(
    brightness: darkBrightness,
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
const IconData showPasswordIcon = Icons.remove_red_eye_outlined;
const IconData userNameIcon = Icons.person;

SnackBarThemeData darkSnackBarThemeData = SnackBarThemeData(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  showCloseIcon: true,
  closeIconColor: white,
  behavior: SnackBarBehavior.floating,
  insetPadding: const EdgeInsets.all(12),
  actionBackgroundColor: darkScaffoldBackgroundColor,
  actionTextColor: grey200,
  backgroundColor: orange,
);
PopupMenuThemeData darkPopupMenuTheme = PopupMenuThemeData(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(roundedLoadingButtonBorderRadius)),
  textStyle: darkBodyMedium,
);

const DividerThemeData darkDividerTheme = DividerThemeData(color: grey400, indent: 10, endIndent: 10, thickness: 0.5);

DialogTheme darkDialogTheme = DialogTheme(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  actionsPadding: const EdgeInsets.only(bottom: 20),
  alignment: Alignment.center,
);

ElevatedButtonThemeData darkElevatedButtonThemeData = ElevatedButtonThemeData(
  style: ButtonStyle(
    backgroundColor: WidgetStateProperty.all(grey700),
    shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
    minimumSize: WidgetStateProperty.all(const Size(50, 25)),
    foregroundColor: WidgetStateProperty.all(lightScaffoldBackgroundColor),
    textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 15)),
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  ),
);

OutlinedButtonThemeData darkOutlinedButtonThemeData = OutlinedButtonThemeData(
  style: ButtonStyle(
    backgroundColor: WidgetStateProperty.all(themeColor),
    side: WidgetStateProperty.all(const BorderSide(color: themeColor)),
    shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
    minimumSize: WidgetStateProperty.all(const Size(50, 25)),
    foregroundColor: WidgetStateProperty.all(lightScaffoldBackgroundColor),
    textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 15)),
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  ),
);

const ListTileThemeData darkListTileThemeData = ListTileThemeData(
  dense: true,
  tileColor: Color.fromRGBO(40, 40, 40, 1),
  iconColor: grey500,
  textColor: grey500,
  style: ListTileStyle.drawer,
);

const CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
  side: BorderSide(color: grey400),
  fillColor: WidgetStatePropertyAll(themeColor),
  checkColor: WidgetStatePropertyAll(white),
);
