import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../../configurations/functions.dart';
import '../../../../../../../configurations/validators.dart';
import '../../../../../../../generated/locale_keys.g.dart/codegen_loader.g.dart';

class ClientAddress extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode node;
  final FocusNode nextNode;

  const ClientAddress({
    super.key,
    required this.controller,
    required this.node,
    required this.nextNode,
  });

  @override
  State<ClientAddress> createState() => _ClientAddressState();
}

class _ClientAddressState extends State<ClientAddress> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextFormField(
        controller: widget.controller,
        focusNode: widget.node,
        decoration: InputDecoration(
          hintText: LocaleKeys.home_subscriptions_newMainSubscription_subscriptionForm_clientAddress.tr(),
        ),
        validator: (val) => sharedValidator(val),
        onFieldSubmitted: (d) => focusWidget(context, node: widget.nextNode),
      ),
    );
  }
}
