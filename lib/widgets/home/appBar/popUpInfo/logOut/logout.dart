import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../configurations/consts/consts_colors.dart';
import '../../../../../generated/locale_keys.g.dart/codegen_loader.g.dart';
import '../../../../../providers/user_provider.dart';
import '../../../../start/loading.dart';

class LogOut extends StatefulWidget {
  const LogOut({super.key});

  @override
  State<LogOut> createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  bool loading = false;
  logOut() async {
    setState(() => loading = true);
    await Provider.of<UserProvider>(context, listen: false).logOut();
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const Loading()));
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      content: loading
          ? const SizedBox(
              width: 100,
              height: 100,
              child: Center(child: CircularProgressIndicator()),
            )
          : Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Text(LocaleKeys.login_logout_areYouSureToLogout.tr(), textAlign: TextAlign.center),
            ),
      actions: loading
          ? []
          : [
              if (!loading)
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    LocaleKeys.globalVocabulary_cancel.tr(),
                    style: TextStyle(fontFamily: LocaleKeys.font_primary.tr()),
                  ),
                ),
              if (!loading)
                OutlinedButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(red),
                    side: WidgetStatePropertyAll(BorderSide(color: red)),
                  ),
                  onPressed: () => logOut(),
                  child: Text(
                    LocaleKeys.globalVocabulary_confirm.tr(),
                    style: TextStyle(fontFamily: LocaleKeys.font_primary.tr()),
                  ),
                ),
            ],
    );
  }
}
