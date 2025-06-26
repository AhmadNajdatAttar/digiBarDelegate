import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../generated/locale_keys.g.dart/codegen_loader.g.dart';

class AddTaxAccountButton extends StatefulWidget {
  final Function() addTaxAccount;
  final String title;
  const AddTaxAccountButton({
    super.key,
    required this.addTaxAccount,
    required this.title,
  });

  @override
  State<AddTaxAccountButton> createState() => _AddTaxAccountButtonState();
}

class _AddTaxAccountButtonState extends State<AddTaxAccountButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => setState(() => widget.addTaxAccount()),
      child: Text(
        widget.title,
        style: TextStyle(fontFamily: LocaleKeys.font_primary.tr()),
      ),
    );
  }
}
