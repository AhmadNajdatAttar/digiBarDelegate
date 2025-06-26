import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

import '../../../configurations/consts/consts.dart';
import '../../../configurations/consts/consts_colors.dart';
import '../../../generated/locale_keys.g.dart/codegen_loader.g.dart';
import 'login_form.dart';

class LoginButton extends StatefulWidget {
  final RoundedLoadingButtonController loginButtonController;
  final GlobalKey<LoginFormState> loginFormState;

  const LoginButton({super.key, required this.loginButtonController, required this.loginFormState});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Center(
        child: RoundedLoadingButton(
          successIcon: successIcon,
          failedIcon: failedIcon,
          color: orange,
          controller: widget.loginButtonController,
          borderRadius: roundedLoadingButtonBorderRadius,
          successColor: green,
          loaderSize: loaderSize,
          valueColor: white,
          elevation: 10,
          width: 200,
          height: 35,
          onPressed: () => widget.loginFormState.currentState!.loginFN(),
          child: Text(LocaleKeys.login_button_login.tr(), style: const TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
