import '../../../../../../../providers/client_classification_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../configurations/functions.dart';
import '../../../../../../../configurations/validators.dart';
import '../../../../../../../generated/locale_keys.g.dart/codegen_loader.g.dart';
import '../../../../../../../models/client_classification.dart' as ccm;

class ClientClassification extends StatefulWidget {
  final FocusNode node;
  final FocusNode nextNode;
  final Function(int id) selectedClientClassification;

  const ClientClassification({
    super.key,
    required this.node,
    required this.nextNode,
    required this.selectedClientClassification,
  });

  @override
  State<ClientClassification> createState() => _ClientClassificationState();
}

class _ClientClassificationState extends State<ClientClassification> {
  @override
  Widget build(BuildContext context) {
    List<ccm.ClientClassification> clientClassifications =
        Provider.of<ClientClassificationProvider>(context).clientClassifications;

    return SizedBox(
      width: 300,
      child: DropdownButtonFormField(
        style: Theme.of(context).textTheme.bodySmall,
        borderRadius: BorderRadius.circular(8),
        items: [
          for (int cc = 0; cc < clientClassifications.length; cc++)
            DropdownMenuItem(
              value: clientClassifications[cc].id,
              child: Text(clientClassifications[cc].title[context.locale.languageCode]!),
            )
        ],
        decoration: InputDecoration(
            hintText: LocaleKeys.home_subscriptions_newMainSubscription_subscriptionForm_clientClassification.tr()),
        focusNode: widget.node,
        onChanged: (c) {
          focusWidget(context, node: widget.nextNode);
          setState(() => widget.selectedClientClassification(c!));
        },
        validator: (val) => dropDownSharedValidator(val),
      ),
    );
  }
}
