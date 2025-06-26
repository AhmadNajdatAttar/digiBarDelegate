import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../configurations/validators.dart';
import '../../../../../../../../../generated/locale_keys.g.dart/codegen_loader.g.dart';

class AccountPassword extends StatefulWidget {
  final TextEditingController accountPasswordController;

  const AccountPassword({
    super.key,
    required this.accountPasswordController,
  });

  @override
  State<AccountPassword> createState() => _AccountPasswordState();
}

class _AccountPasswordState extends State<AccountPassword> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: TextFormField(
        controller: widget.accountPasswordController,
        decoration:
            InputDecoration(hintText: LocaleKeys.home_subscriptions_newMainSubscription_tax_accountPassword.tr()),
        validator: (v) => sharedValidator(v),
      ),
    );
  }
}
