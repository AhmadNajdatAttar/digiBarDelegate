import 'package:flutter/material.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

import '../../../configurations/confirm_controller_state.dart';
import '../../../configurations/consts/consts.dart';
import 'login_button.dart';
import 'login_form.dart';
import 'login_title.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  RoundedLoadingButtonController loginButtonController = RoundedLoadingButtonController();
  GlobalKey<LoginFormState> loginFormState = GlobalKey<LoginFormState>();

  loginButtonControllerState({ConfirmControllerState? state}) async {
    await confirmControllerState(controller: loginButtonController, state: state);
    await Future.delayed(const Duration(milliseconds: 500));
    await confirmControllerState(controller: loginButtonController, state: reset);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const LoginTitle(),
          LoginForm(loginButtonControllerState: loginButtonControllerState, key: loginFormState),
          LoginButton(loginButtonController: loginButtonController, loginFormState: loginFormState),
        ],
      ),
    );
  }
}
