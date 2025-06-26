import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../../configurations/functions.dart';
import '../../../../../../../configurations/validators.dart';
import '../../../../../../../generated/locale_keys.g.dart/codegen_loader.g.dart';

class OwnerPhoneNumber extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode node;
  final FocusNode nextNode;

  const OwnerPhoneNumber({
    super.key,
    required this.controller,
    required this.node,
    required this.nextNode,
  });

  @override
  State<OwnerPhoneNumber> createState() => _OwnerPhoneNumberState();
}

class _OwnerPhoneNumberState extends State<OwnerPhoneNumber> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextFormField(
        controller: widget.controller,
        focusNode: widget.node,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          hintText: LocaleKeys.home_subscriptions_newMainSubscription_subscriptionForm_ownerPhoneNumber.tr(),
        ),
        validator: (val) => sharedValidator(val),
        onFieldSubmitted: (d) => focusWidget(context, node: widget.nextNode),
      ),
    );
  }
}
