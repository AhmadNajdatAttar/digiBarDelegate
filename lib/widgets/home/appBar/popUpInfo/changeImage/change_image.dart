import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../configurations/consts/consts.dart';
import '../../../../../configurations/theme/dark/colors_dark.dart';
import '../../../../../generated/locale_keys.g.dart/codegen_loader.g.dart';

class ChangeImage extends StatefulWidget {
  final int id;
  final String image;
  const ChangeImage({super.key, required this.id, required this.image});

  @override
  State<ChangeImage> createState() => _ChangeImageState();
}

class _ChangeImageState extends State<ChangeImage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(LocaleKeys.login_button_changeImage.tr()),
            const Icon(changeImageIcon, color: grey400),
          ],
        ),
      ),
    );
  }
}
