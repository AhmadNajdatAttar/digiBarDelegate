import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../configurations/theme/dark/theme_dark.dart';
import '../../configurations/theme/light/theme_light.dart';
import '../../providers/app_theme_provider.dart';
import 'loading.dart';

class DigiBarDelegate extends StatefulWidget {
  const DigiBarDelegate({super.key});

  @override
  State<DigiBarDelegate> createState() => _DigiBarDelegateState();
}

class _DigiBarDelegateState extends State<DigiBarDelegate> {
  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<AppThemeProvider>(context).getIsDark;
    return MaterialApp(
      title: 'DigiBar Delegate',
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      theme: lightThemeFN(languageCode: context.locale.languageCode),
      darkTheme: darkThemeFN(languageCode: context.locale.languageCode),
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: const Loading(),
    );
  }
}
