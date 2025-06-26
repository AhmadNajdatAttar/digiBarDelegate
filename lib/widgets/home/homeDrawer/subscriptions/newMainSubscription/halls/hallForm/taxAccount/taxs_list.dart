import 'package:flutter/material.dart';

import '../../../../../../../../models/tax_account.dart';

class TaxsList extends StatefulWidget {
  final List<TaxAccount> taxsAccounts;
  final Function(int id) selectTaxAccount;

  const TaxsList({
    super.key,
    required this.taxsAccounts,
    required this.selectTaxAccount,
  });

  @override
  State<TaxsList> createState() => TaxsListState();
}

class TaxsListState extends State<TaxsList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: DropdownButtonFormField(
        value: widget.taxsAccounts[widget.taxsAccounts.length - 1].id,
        items: [
          for (int tc = 0; tc < widget.taxsAccounts.length; tc++)
            DropdownMenuItem(value: widget.taxsAccounts[tc].id, child: Text(widget.taxsAccounts[tc].number!))
        ],
        onChanged: (c) => setState(() => widget.selectTaxAccount(c!)),
      ),
    );
  }
}
