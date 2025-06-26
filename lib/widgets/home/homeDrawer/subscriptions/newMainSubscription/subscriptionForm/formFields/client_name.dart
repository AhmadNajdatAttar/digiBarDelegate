import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../../configurations/functions.dart';
import '../../../../../../../configurations/validators.dart';
import '../../../../../../../generated/locale_keys.g.dart/codegen_loader.g.dart';

class ClientName extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode nextNode;

  const ClientName({
    super.key,
    required this.controller,
    required this.nextNode,
  });

  @override
  State<ClientName> createState() => _ClientNameState();
}

class _ClientNameState extends State<ClientName> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: LocaleKeys.home_subscriptions_newMainSubscription_subscriptionForm_clientName.tr(),
        ),
        validator: (val) => sharedValidator(val),
        onFieldSubmitted: (d) => focusWidget(context, node: widget.nextNode),
      ),
    );
  }
}
