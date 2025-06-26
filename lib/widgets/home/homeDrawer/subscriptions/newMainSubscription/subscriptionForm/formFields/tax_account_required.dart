import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../../generated/locale_keys.g.dart/codegen_loader.g.dart';

class TaxAccountRequired extends StatefulWidget {
  final FocusNode node;
  final FocusNode nextNode;
  final bool taxAccountRequired;
  final bool taxSynchronizationRequired;
  final Function(bool state) selectedTaxAccountRequired;
  final Function(bool id) selectedTaxSynchronizationRequired;

  const TaxAccountRequired({
    super.key,
    required this.node,
    required this.nextNode,
    required this.taxAccountRequired,
    required this.selectedTaxAccountRequired,
    required this.taxSynchronizationRequired,
    required this.selectedTaxSynchronizationRequired,
  });

  @override
  State<TaxAccountRequired> createState() => _TaxAccountRequiredState();
}

class _TaxAccountRequiredState extends State<TaxAccountRequired> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: CheckboxListTile(
        dense: true,
        title: Text(LocaleKeys.home_subscriptions_newMainSubscription_subscriptionForm_taxAccountRequired.tr()),
        value: widget.taxAccountRequired,
        onChanged: (d) {
          setState(() {
            widget.selectedTaxAccountRequired(d!);
            if (!d & widget.taxSynchronizationRequired) {
              widget.selectedTaxSynchronizationRequired(false);
            }
          });
        },
      ),
    );
  }
}
