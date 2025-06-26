import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../generated/locale_keys.g.dart/codegen_loader.g.dart';
import 'account_password.dart';
import 'account_username.dart';
import 'tax_number.dart';

class TaxAccountForm extends StatefulWidget {
  final TextEditingController taxNumberController;
  final TextEditingController accountUsernameController;
  final TextEditingController accountPasswordController;
  final Function() prepaerHallWithNewTaxForm;
  final bool taxAccountRequired;
  final bool taxSynchronizationRequired;

  const TaxAccountForm({
    super.key,
    required this.taxNumberController,
    required this.accountUsernameController,
    required this.accountPasswordController,
    required this.prepaerHallWithNewTaxForm,
    required this.taxAccountRequired,
    required this.taxSynchronizationRequired,
  });

  @override
  State<TaxAccountForm> createState() => _TaxAccountFormState();
}

class _TaxAccountFormState extends State<TaxAccountForm> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 10,
      spacing: 30,
      crossAxisAlignment: WrapCrossAlignment.end,
      children: [
        if (widget.taxAccountRequired) TaxNumber(taxNumberController: widget.taxNumberController),
        if (widget.taxSynchronizationRequired)
          AccountUsername(accountUsernameController: widget.accountUsernameController),
        if (widget.taxSynchronizationRequired)
          AccountPassword(accountPasswordController: widget.accountPasswordController),
        OutlinedButton(
          onPressed: () => setState(() => widget.prepaerHallWithNewTaxForm()),
          child: Text(
            LocaleKeys.globalVocabulary_confirm.tr(),
            style: TextStyle(fontFamily: LocaleKeys.font_primary.tr()),
          ),
        )
      ],
    );
  }
}
