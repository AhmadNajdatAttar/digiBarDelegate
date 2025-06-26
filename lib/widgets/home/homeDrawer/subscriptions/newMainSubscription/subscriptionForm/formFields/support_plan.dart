import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../configurations/functions.dart';
import '../../../../../../../configurations/validators.dart';
import '../../../../../../../generated/locale_keys.g.dart/codegen_loader.g.dart';
import '../../../../../../../models/support_plan.dart' as spm;
import '../../../../../../../providers/support_plan_provider.dart';

class SupportPlan extends StatefulWidget {
  final FocusNode node;
  final FocusNode nextNode;
  final int selectedPlanId;
  final double selectedPlanCost;
  final Function(int id, int durationId, int length) selectedSupportPlan;

  const SupportPlan({
    super.key,
    required this.node,
    required this.nextNode,
    required this.selectedPlanId,
    required this.selectedSupportPlan,
    required this.selectedPlanCost,
  });

  @override
  State<SupportPlan> createState() => _SupportPlanState();
}

class _SupportPlanState extends State<SupportPlan> {
  @override
  Widget build(BuildContext context) {
    List<spm.SupportPlan> supportPlans = Provider.of<SupportPlanProvider>(context).supportPlans;

    return SizedBox(
      width: 300,
      child: DropdownButtonFormField<int>(
        style: Theme.of(context).textTheme.bodySmall,
        borderRadius: BorderRadius.circular(8),
        value: supportPlans.any((e) => e.planId == widget.selectedPlanId)
            ? supportPlans.firstWhere((sp) => sp.planId == widget.selectedPlanId).id
            : null,
        items: widget.selectedPlanId == 0
            ? []
            : [
                for (int sp = 0; sp < supportPlans.length; sp++)
                  if (widget.selectedPlanId == supportPlans[sp].planId)
                    DropdownMenuItem(
                      value: supportPlans[sp].id,
                      child: Text(supportPlans[sp].title[context.locale.languageCode]!),
                    )
              ],
        decoration: InputDecoration(
            hintText: LocaleKeys.home_subscriptions_newMainSubscription_subscriptionForm_supportPlan.tr()),
        focusNode: widget.node,
        onChanged: (spv) {
          spm.SupportPlan supportPlan = supportPlans.firstWhere((t) => t.id == spv);
          int durationId = supportPlan.durationId;
          int planLength = supportPlan.length;

          setState(() => widget.selectedSupportPlan(spv!, durationId, planLength));
          focusWidget(context, node: widget.nextNode);
        },
        validator: (val) => widget.selectedPlanCost == 0 ? null : dropDownSharedValidator(val),
      ),
    );
  }
}
