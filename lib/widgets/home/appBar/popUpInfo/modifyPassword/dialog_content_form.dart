import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../configurations/consts/consts_colors.dart';
import '../../../../../configurations/functions.dart';
import '../../../../../configurations/theme/dark/theme_data_dark.dart';
import '../../../../../configurations/validators.dart';
import '../../../../../generated/locale_keys.g.dart/codegen_loader.g.dart';

class DialogContentForm extends StatefulWidget {
  final bool update;
  final Function({String? currentPassword, String? newPassword}) tryModifyPassword;
  const DialogContentForm({
    super.key,
    required this.update,
    required this.tryModifyPassword,
  });

  @override
  State<DialogContentForm> createState() => DialogContentFormState();
}

class DialogContentFormState extends State<DialogContentForm> {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  modifyPassword() {
    if (formKey.currentState!.validate()) {
      setState(() {
        widget.tryModifyPassword(
          currentPassword: currentPasswordController.text,
          newPassword: newPasswordController.text,
        );
      });
    }
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  FocusNode newPasswordNode = FocusNode();
  FocusNode confirmPasswordNode = FocusNode();

  showPass() => setState(() => obscure = !obscure);
  showConfirmPass() => setState(() => confirmObscure = !confirmObscure);

  bool obscure = true;
  bool confirmObscure = true;

  @override
  Widget build(BuildContext context) {
    return widget.update
        ? const SizedBox(
            width: 100,
            height: 100,
            child: Center(child: CircularProgressIndicator()),
          )
        : SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(LocaleKeys.globalVocabulary_enterTheRequiredData.tr()),
                SizedBox(
                  width: 200,
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFormField(
                          controller: currentPasswordController,
                          obscureText: obscure,
                          obscuringCharacter: '*',
                          decoration: InputDecoration(
                            hintText: LocaleKeys.login_modifyPassword_currentPassword.tr(),
                            suffixIcon: InkWell(
                              onTap: () => showPass(),
                              child: Icon(showPasswordIcon, color: obscure ? null : red),
                            ),
                          ),
                          onFieldSubmitted: (d) => focusWidget(context, node: newPasswordNode),
                          validator: (v) => passwordValidator(v),
                        ),
                        TextFormField(
                          controller: newPasswordController,
                          focusNode: newPasswordNode,
                          obscureText: confirmObscure,
                          obscuringCharacter: '*',
                          decoration: InputDecoration(
                            hintText: LocaleKeys.login_modifyPassword_newPassword.tr(),
                            suffixIcon: InkWell(
                              onTap: () => showConfirmPass(),
                              child: Icon(showPasswordIcon, color: confirmObscure ? null : red),
                            ),
                          ),
                          onFieldSubmitted: (d) => focusWidget(context, node: confirmPasswordNode),
                          validator: (v) => newPasswordValidator(v),
                        ),
                        TextFormField(
                          controller: confirmPasswordController,
                          focusNode: confirmPasswordNode,
                          obscureText: confirmObscure,
                          obscuringCharacter: '*',
                          decoration: InputDecoration(hintText: LocaleKeys.login_modifyPassword_confirmPassword.tr()),
                          validator: (v) => confirmPasswordValidator(newPasswordController.text, v),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
