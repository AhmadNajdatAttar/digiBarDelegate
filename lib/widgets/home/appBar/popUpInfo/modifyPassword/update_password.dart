import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../configurations/consts/consts.dart';
import '../../../../../configurations/theme/dark/colors_dark.dart';
import '../../../../../generated/locale_keys.g.dart/codegen_loader.g.dart';

class UpdatePassword extends StatefulWidget {
  final int id;
  final String token;
  const UpdatePassword({super.key, required this.id, required this.token});

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(LocaleKeys.login_button_modifyPassword.tr()),
            const Icon(changePasswordIcon, color: grey400),
          ],
        ),
      ),
    );
  }
}
