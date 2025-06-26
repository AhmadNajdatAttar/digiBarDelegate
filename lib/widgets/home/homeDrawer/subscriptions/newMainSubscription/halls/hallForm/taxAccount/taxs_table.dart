import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../configurations/consts/consts_colors.dart';
import '../../../../../../../../configurations/theme/light/colors_light.dart';
import '../../../../../../../../generated/locale_keys.g.dart/codegen_loader.g.dart';
import '../../../../../../../../models/tax_account.dart';

class TaxsTable extends StatefulWidget {
  final bool taxSynchronizationRequired;

  final List<TaxAccount> taxAccounts;
  final Function(int taxId) deleteTaxAccount;

  const TaxsTable({
    super.key,
    required this.taxAccounts,
    required this.deleteTaxAccount,
    required this.taxSynchronizationRequired,
  });

  @override
  State<TaxsTable> createState() => _TaxsTableState();
}

class _TaxsTableState extends State<TaxsTable> {
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
                  padding: padding, child: Text(LocaleKeys.home_subscriptions_newMainSubscription_tax_taxNumber.tr())),
              if (widget.taxSynchronizationRequired)
                Padding(
                    padding: padding,
                    child: Text(LocaleKeys.home_subscriptions_newMainSubscription_tax_accountUsername.tr())),
              if (widget.taxSynchronizationRequired)
                Padding(
                    padding: padding,
                    child: Text(LocaleKeys.home_subscriptions_newMainSubscription_tax_accountPassword.tr())),
              Padding(padding: padding)
            ],
          ),
          for (int t = 0; t < widget.taxAccounts.length; t++)
            TableRow(
              children: [
                Padding(padding: padding, child: Text(widget.taxAccounts[t].number.toString())),
                if (widget.taxSynchronizationRequired)
                  Padding(padding: padding, child: Text(widget.taxAccounts[t].userName!)),
                if (widget.taxSynchronizationRequired)
                  Padding(padding: padding, child: Text(widget.taxAccounts[t].password!)),
                Padding(
                  padding: padding,
                  child: InkWell(
                    onTap: () => setState(() => widget.deleteTaxAccount(widget.taxAccounts[t].id!)),
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
