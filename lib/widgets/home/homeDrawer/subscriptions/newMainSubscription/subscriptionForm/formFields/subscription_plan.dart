import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../../configurations/functions.dart';
import '../../../../../../../configurations/validators.dart';
import '../../../../../../../generated/locale_keys.g.dart/codegen_loader.g.dart';
import '../../../../../../../models/plan_class.dart';
import '../../../../../../../providers/plan_class_provider.dart';

class SubscriptionPlan extends StatefulWidget {
  final FocusNode node;
  final FocusNode nextNode;
  final Function(int id) selectedPlan;

  const SubscriptionPlan({
    super.key,
    required this.node,
    required this.nextNode,
    required this.selectedPlan,
  });

  @override
  State<SubscriptionPlan> createState() => _SubscriptionPlanState();
}

class _SubscriptionPlanState extends State<SubscriptionPlan> {
  @override
  Widget build(BuildContext context) {
    List<PlanClass> plans = Provider.of<PlanClassProvider>(context).plansClass;

    return SizedBox(
      width: 300,
      child: DropdownButtonFormField(
        style: Theme.of(context).textTheme.bodySmall,
        borderRadius: BorderRadius.circular(8),
        items: [
          for (int sp = 0; sp < plans.length; sp++)
            DropdownMenuItem(
              value: plans[sp].id,
              child: Text(plans[sp].title[context.locale.languageCode]!),
            )
        ],
        decoration: InputDecoration(
            hintText: LocaleKeys.home_subscriptions_newMainSubscription_subscriptionForm_subscriptionPlan.tr()),
        focusNode: widget.node,
        onChanged: (p) {
          focusWidget(context, node: widget.nextNode);
          setState(() => widget.selectedPlan(p!));
        },
        validator: (val) => dropDownSharedValidator(val),
      ),
    );
  }
}
