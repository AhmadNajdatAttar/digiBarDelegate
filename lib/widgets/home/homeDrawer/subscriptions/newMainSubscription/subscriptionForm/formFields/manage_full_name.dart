import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../../configurations/functions.dart';
import '../../../../../../../configurations/validators.dart';
import '../../../../../../../generated/locale_keys.g.dart/codegen_loader.g.dart';

class ManagerFullName extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode node;
  final FocusNode nextNode;

  const ManagerFullName({
    super.key,
    required this.controller,
    required this.node,
    required this.nextNode,
  });

  @override
  State<ManagerFullName> createState() => _ManagerFullNameState();
}

class _ManagerFullNameState extends State<ManagerFullName> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextFormField(
        controller: widget.controller,
        focusNode: widget.node,
        decoration: InputDecoration(
          hintText: LocaleKeys.home_subscriptions_newMainSubscription_subscriptionForm_managerFullName.tr(),
        ),
        validator: (val) => sharedValidator(val),
        onFieldSubmitted: (d) => focusWidget(context, node: widget.nextNode),
      ),
    );
  }
}
