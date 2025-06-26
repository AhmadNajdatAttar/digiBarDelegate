import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../models/coin.dart';
import '../../../../../../../../models/plan_cost.dart';
import '../../../../../../../../models/plan_duration.dart';
import '../../../../../../../../providers/coin_provider.dart';
import '../../../../../../../../providers/plan_duratioin_provider.dart';

class PlanCostItem extends StatefulWidget {
  final PlanCost planCost;
  final int? selectedCoinId;
  const PlanCostItem({
    super.key,
    required this.planCost,
    required this.selectedCoinId,
  });

  @override
  State<PlanCostItem> createState() => _PlanCostItemState();
}

class _PlanCostItemState extends State<PlanCostItem> {
  @override
  Widget build(BuildContext context) {
    List<PlanDuration> durations = Provider.of<PlanDurationProvider>(context).planDurations;
    PlanDuration selectedDuration = durations.firstWhere((d) => d.id == widget.planCost.durationId);
    List<Coin> coins = Provider.of<CoinProvider>(context).coins;
    Coin selectedCoin = coins.firstWhere((c) => c.id == widget.selectedCoinId);
    return Text(
        '${selectedDuration.type.toString()} ${selectedDuration.title[context.locale.languageCode]} ${widget.planCost.cost} ${selectedCoin.name[context.locale.languageCode]}');
  }
}
