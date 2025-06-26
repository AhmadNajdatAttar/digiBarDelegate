import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../../configurations/functions.dart';
import '../../../../../../../configurations/validators.dart';
import '../../../../../../../generated/locale_keys.g.dart/codegen_loader.g.dart';

class OwnerFullName extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode node;
  final FocusNode nextNode;

  const OwnerFullName({
    super.key,
    required this.controller,
    required this.node,
    required this.nextNode,
  });

  @override
  State<OwnerFullName> createState() => _OwnerFullNameState();
}

class _OwnerFullNameState extends State<OwnerFullName> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextFormField(
        controller: widget.controller,
        focusNode: widget.node,
        decoration: InputDecoration(
          hintText: LocaleKeys.home_subscriptions_newMainSubscription_subscriptionForm_ownerFullName.tr(),
        ),
        validator: (val) => sharedValidator(val),
        onFieldSubmitted: (d) => focusWidget(context, node: widget.nextNode),
      ),
    );
  }
}
