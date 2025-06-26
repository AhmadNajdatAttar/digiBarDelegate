import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../generated/locale_keys.g.dart/codegen_loader.g.dart';

class SharedAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  const SharedAppBar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  State<SharedAppBar> createState() => _SharedAppBarState();
}

class _SharedAppBarState extends State<SharedAppBar> {
  @override
  Widget build(BuildContext context) => AppBar(
        title: Text(
          widget.title,
          style: TextStyle(fontFamily: LocaleKeys.font_primary.tr()),
        ),
      );
}
