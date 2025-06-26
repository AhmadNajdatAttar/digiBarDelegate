import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../configurations/validators.dart';
import '../../../../../../../../../generated/locale_keys.g.dart/codegen_loader.g.dart';

class TaxNumber extends StatefulWidget {
  final TextEditingController taxNumberController;

  const TaxNumber({super.key, required this.taxNumberController});

  @override
  State<TaxNumber> createState() => _TaxNumberState();
}

class _TaxNumberState extends State<TaxNumber> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: TextFormField(
        controller: widget.taxNumberController,
        decoration: InputDecoration(hintText: LocaleKeys.home_subscriptions_newMainSubscription_tax_taxNumber.tr()),
        validator: (v) => sharedValidator(v),
      ),
    );
  }
}
