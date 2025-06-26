import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../configurations/consts/consts.dart';
import '../../../../providers/app_theme_provider.dart';

class ThemeSwitcher extends StatefulWidget {
  const ThemeSwitcher({super.key});

  @override
  State<ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  @override
  Widget build(BuildContext context) {
    bool getIsDark = Provider.of<AppThemeProvider>(context).getIsDark;
    return AnimatedSwitcher(
      transitionBuilder: (Widget child, Animation<double> animation) =>
          FadeTransition(opacity: animation, child: child),
      duration: const Duration(milliseconds: 500),
      child: IconButton(
          onPressed: () => Provider.of<AppThemeProvider>(context, listen: false).switchTheme(),
          icon: Icon(getIsDark ? lightIcon : darkIcon)),
    );
  }
}
