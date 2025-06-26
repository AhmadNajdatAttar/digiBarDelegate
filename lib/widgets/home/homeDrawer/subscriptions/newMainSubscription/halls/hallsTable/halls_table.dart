import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../../configurations/consts/consts_colors.dart';
import '../../../../../../../configurations/theme/light/colors_light.dart';
import '../../../../../../../generated/locale_keys.g.dart/codegen_loader.g.dart';
import '../../../../../../../models/hall.dart';
import '../../../../../../../models/tax_account.dart';

class HallsTable extends StatefulWidget {
  final List<Hall> halls;
  final List<TaxAccount> taxAccounts;
  final Function(String hallName) deleteHall;
  final bool taxAccountRequired;

  const HallsTable({
    super.key,
    required this.halls,
    required this.deleteHall,
    required this.taxAccounts,
    required this.taxAccountRequired,
  });

  @override
  State<HallsTable> createState() => _HallsTableState();
}

class _HallsTableState extends State<HallsTable> {
  EdgeInsets padding = const EdgeInsets.all(8.0);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: Table(
        border: TableBorder.all(borderRadius: BorderRadius.circular(4), width: 1, color: grey500),
        children: [
          TableRow(
            children: [
              Padding(
                  padding: padding, child: Text(LocaleKeys.home_subscriptions_newMainSubscription_halls_hallName.tr())),
              if (widget.taxAccountRequired)
                Padding(
                    padding: padding,
                    child: Text(LocaleKeys.home_subscriptions_newMainSubscription_tax_taxNumber.tr())),
              Padding(padding: padding)
            ],
          ),
          for (int h = 0; h < widget.halls.length; h++)
            TableRow(
              children: [
                Padding(padding: padding, child: Text(widget.halls[h].hallName!)),
                if (widget.taxAccountRequired)
                  Padding(
                      padding: padding,
                      child: Text(widget.taxAccounts
                          .firstWhere((a) => a.id == widget.halls[h].taxAccountId)
                          .number
                          .toString())),
                Padding(
                  padding: padding,
                  child: InkWell(
                    onTap: () => setState(() => widget.deleteHall(widget.halls[h].hallName!)),
                    child: const Icon(Icons.remove_circle_outline, color: red),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
