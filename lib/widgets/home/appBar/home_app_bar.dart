import 'package:flutter/material.dart';
import '../../../configurations/consts/consts_colors.dart';
import '../../../models/user.dart';
import 'notification/notification_icon.dart';
import 'themeAndLanguage/language_list.dart';
import 'themeAndLanguage/theme_switcher.dart';
import 'popUpInfo/pop_up_info.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  final User user;
  const HomeAppBar({super.key, required this.user});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text.rich(
        TextSpan(
          style: TextStyle(fontFamily: 'balingka', fontSize: 40),
          children: [
            TextSpan(text: 'Di', style: TextStyle(color: white)),
            TextSpan(text: 'g', style: TextStyle(color: themeColorAccent)),
            TextSpan(text: 'iB', style: TextStyle(color: white)),
            TextSpan(text: 'a', style: TextStyle(color: themeColorAccent)),
            TextSpan(text: 'r', style: TextStyle(color: white)),
          ],
        ),
      ),
      actions: [
        const LanguageList(),
        const ThemeSwitcher(),
        const NotificationIcon(),
        PopUpInfo(user: widget.user),
      ],
    );
  }
}
