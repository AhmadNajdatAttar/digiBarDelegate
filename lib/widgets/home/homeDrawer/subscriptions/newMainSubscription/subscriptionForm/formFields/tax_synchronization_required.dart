import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../../generated/locale_keys.g.dart/codegen_loader.g.dart';

class TaxSynchronizationRequired extends StatefulWidget {
  final FocusNode node;
  final bool taxSynchronizationRequired;
  final Function(bool id) selectedTaxSynchronizationRequired;
  final bool taxAccountRequired;
  final Function(bool id) selectedTaxAccountRequired;

  const TaxSynchronizationRequired({
    super.key,
    required this.node,
    required this.taxSynchronizationRequired,
    required this.selectedTaxSynchronizationRequired,
    required this.taxAccountRequired,
    required this.selectedTaxAccountRequired,
  });

  @override
  State<TaxSynchronizationRequired> createState() => _TaxSynchronizationRequiredState();
}

class _TaxSynchronizationRequiredState extends State<TaxSynchronizationRequired> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: CheckboxListTile(
        focusNode: widget.node,
        dense: true,
        value: widget.taxSynchronizationRequired,
        title: Text(LocaleKeys.home_subscriptions_newMainSubscription_subscriptionForm_taxSynchronizationRequired.tr()),
        onChanged: (d) {
          setState(() {
            widget.selectedTaxSynchronizationRequired(d!);
            if (!widget.taxAccountRequired) {
              widget.selectedTaxAccountRequired(d);
            }
          });
        },
      ),
    );
  }
}
