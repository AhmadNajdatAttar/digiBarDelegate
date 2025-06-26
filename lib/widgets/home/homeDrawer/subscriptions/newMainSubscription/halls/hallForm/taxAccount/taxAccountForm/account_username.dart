import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../configurations/validators.dart';
import '../../../../../../../../../generated/locale_keys.g.dart/codegen_loader.g.dart';

class AccountUsername extends StatefulWidget {
  final TextEditingController accountUsernameController;

  const AccountUsername({super.key, required this.accountUsernameController});

  @override
  State<AccountUsername> createState() => _AccountUsernameState();
}

class _AccountUsernameState extends State<AccountUsername> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: TextFormField(
        controller: widget.accountUsernameController,
        decoration:
            InputDecoration(hintText: LocaleKeys.home_subscriptions_newMainSubscription_tax_accountUsername.tr()),
        validator: (v) => sharedValidator(v),
      ),
    );
  }
}
