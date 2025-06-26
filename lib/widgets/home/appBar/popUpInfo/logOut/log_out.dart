import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../configurations/consts/consts.dart';
import '../../../../../configurations/theme/dark/colors_dark.dart';
import '../../../../../generated/locale_keys.g.dart/codegen_loader.g.dart';

class Logout extends StatefulWidget {
  const Logout({super.key});

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(LocaleKeys.login_button_logOut.tr()),
            const Icon(logoutIcon, color: grey400),
          ],
        ),
      ),
    );
  }
}
