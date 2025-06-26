// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../configurations/confirm_controller_state.dart';
import '../../../configurations/consts/consts.dart';
import '../../../configurations/consts/consts_colors.dart';
import '../../../configurations/functions.dart';
import '../../../configurations/theme/dark/theme_data_dark.dart';
import '../../../configurations/validators.dart';
import '../../../generated/locale_keys.g.dart/codegen_loader.g.dart';
import '../../../providers/user_provider.dart';
import '../../home/home.dart';

class LoginForm extends StatefulWidget {
  final Function({ConfirmControllerState? state}) loginButtonControllerState;

  const LoginForm({
    super.key,
    required this.loginButtonControllerState,
  });

  @override
  State<LoginForm> createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> form = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  loginFN() async {
    form.currentState!.validate()
        ? await tryCatch(
                ctx: context,
                function: Provider.of<UserProvider>(context, listen: false)
                    .login(username: username.text, password: password.text))
            .then((reternedResponse) async {
            switch (reternedResponse.response.state) {
              case true:
                await widget.loginButtonControllerState(state: success);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => const Home()),
                );
              case false:
                snackMessage(ctx: context, msg: reternedResponse.response.message, color: red);
                widget.loginButtonControllerState(state: error);
            }
          })
        : widget.loginButtonControllerState(state: error);
  }

  showPass() => setState(() => obscure = !obscure);

  bool obscure = true;

  FocusNode passwordNode = FocusNode();
  FocusNode submitNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Form(
        key: form,
        child: Column(
          children: [
            TextFormField(
              controller: username,
              style: Theme.of(context).textTheme.bodySmall,
              decoration: InputDecoration(
                  alignLabelWithHint: true,
                  prefixIcon: const Icon(userNameIcon),
                  hintText: LocaleKeys.login_loginForm_userName.tr()),
              validator: (val) => usernameValidator(val),
              onFieldSubmitted: (d) => focusWidget(context, node: passwordNode),
            ),
            TextFormField(
                controller: password,
                obscureText: obscure,
                focusNode: passwordNode,
                obscuringCharacter: '*',
                style: Theme.of(context).textTheme.bodySmall,
                decoration: InputDecoration(
                  prefixIcon: const Icon(passwordIcon),
                  suffixIcon: InkWell(
                    onTap: () => showPass(),
                    child: Icon(showPasswordIcon, color: obscure ? null : red),
                  ),
                  hintText: LocaleKeys.login_loginForm_password.tr(),
                ),
                validator: (val) => passwordValidator(val)),
          ],
        ),
      ),
    );
  }
}
