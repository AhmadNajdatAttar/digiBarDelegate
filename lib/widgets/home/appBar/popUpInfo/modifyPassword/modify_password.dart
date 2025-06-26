import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../configurations/consts/consts_colors.dart';
import '../../../../../configurations/functions.dart';
import '../../../../../generated/locale_keys.g.dart/codegen_loader.g.dart';
import '../../../../../providers/user_provider.dart';
import 'dialog_content_form.dart';

class ModifyPassword extends StatefulWidget {
  const ModifyPassword({super.key});

  @override
  State<ModifyPassword> createState() => _ModifyPasswordState();
}

class _ModifyPasswordState extends State<ModifyPassword> {
  bool update = false;
  GlobalKey<DialogContentFormState> dialogContentFormKey = GlobalKey<DialogContentFormState>();

  tryModifyPassword({String? currentPassword, String? newPassword}) async {
    setState(() => update = true);

    await tryCatch(
      ctx: context,
      msg: LocaleKeys.globalVocabulary_theOperationFailed.tr(),
      function: Provider.of<UserProvider>(context, listen: false).modifyPassword(
        currentPassword: currentPassword!,
        newPassword: newPassword!,
      ),
    ).then((result) {
      switch (result.response.state) {
        case true:
          Navigator.pop(context);
          snackMessage(ctx: context, msg: result.response.message, color: green);
        case false:
          setState(() => update = false);
          snackMessage(ctx: context, msg: result.response.message, color: red);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      content: DialogContentForm(
        key: dialogContentFormKey,
        tryModifyPassword: tryModifyPassword,
        update: update,
      ),
      actions: update
          ? []
          : [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  LocaleKeys.globalVocabulary_cancel.tr(),
                  style: TextStyle(fontFamily: LocaleKeys.font_primary.tr()),
                ),
              ),
              // if (loadState)
              OutlinedButton(
                onPressed: () => dialogContentFormKey.currentState!.modifyPassword(),
                child: Text(
                  LocaleKeys.globalVocabulary_confirm.tr(),
                  style: TextStyle(fontFamily: LocaleKeys.font_primary.tr()),
                ),
              ),
            ],
    );
  }
}
