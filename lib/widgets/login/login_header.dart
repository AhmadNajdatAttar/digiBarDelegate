import 'package:flutter/material.dart';

import '../home/appBar/themeAndLanguage/language_list.dart';
import '../home/appBar/themeAndLanguage/theme_switcher.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) => const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LanguageList(),
          ThemeSwitcher(),
        ],
      );
}
