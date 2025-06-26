import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/locale_keys.g.dart/codegen_loader.g.dart';

class SubmitButton extends StatefulWidget {
  final Function() submitForm;
  const SubmitButton({super.key, required this.submitForm});

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(40.0),
        child: OutlinedButton(
          onPressed: () => widget.submitForm(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              LocaleKeys.globalVocabulary_confirm.tr(),
              style: TextStyle(fontFamily: LocaleKeys.font_primary.tr()),
            ),
          ),
        ));
  }
}
