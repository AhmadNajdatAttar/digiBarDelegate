import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../configurations/functions.dart';
import '../../../../../../../../configurations/validators.dart';
import '../../../../../../../../generated/locale_keys.g.dart/codegen_loader.g.dart';
import '../../../../../../../../models/plan_cost.dart' as pc;
import '../../../../../../../../providers/plan_cost_provider.dart';
import 'plan_cost_item.dart';

class PlanCost extends StatefulWidget {
  final FocusNode node;
  final FocusNode nextNode;
  final Function(int id) selectedPlanCost;
  final int? selectedPlanClassId;
  final int? subscriptionPlanCostId;
  final int? selectedCoinId;
  const PlanCost({
    super.key,
    required this.node,
    required this.nextNode,
    required this.selectedPlanCost,
    required this.selectedPlanClassId,
    required this.subscriptionPlanCostId,
    required this.selectedCoinId,
  });

  @override
  State<PlanCost> createState() => _PlanCostState();
}

class _PlanCostState extends State<PlanCost> {
  @override
  Widget build(BuildContext context) {
    List<pc.PlanCost> plansCosts = Provider.of<PlanCostProvider>(context).plansCosts;

    return SizedBox(
      width: 300,
      child: DropdownButtonFormField<int>(
        style: Theme.of(context).textTheme.bodySmall,
        borderRadius: BorderRadius.circular(8),
        value: widget.subscriptionPlanCostId == 0 ? null : widget.subscriptionPlanCostId,
        items: widget.selectedPlanClassId == 0
            ? []
            : [
                for (int sp = 0; sp < plansCosts.length; sp++)
                  if (widget.selectedPlanClassId == plansCosts[sp].planClassId &&
                      widget.selectedCoinId == plansCosts[sp].coinId)
                    DropdownMenuItem<int>(
                      value: plansCosts[sp].id,
                      child: PlanCostItem(
                        planCost: plansCosts[sp],
                        selectedCoinId: widget.selectedCoinId,
                      ),
                    )
              ],
        decoration: InputDecoration(
            hintText: LocaleKeys.home_subscriptions_newMainSubscription_subscriptionForm_subscriptionPlan.tr()),
        focusNode: widget.node,
        onChanged: (p) {
          focusWidget(context, node: widget.nextNode);
          setState(() => widget.selectedPlanCost(p!));
        },
        validator: (val) => dropDownSharedValidator(val),
      ),
    );
  }
}
