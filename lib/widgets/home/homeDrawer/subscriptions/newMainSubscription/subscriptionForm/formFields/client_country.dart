import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../configurations/functions.dart';
import '../../../../../../../configurations/validators.dart';
import '../../../../../../../generated/locale_keys.g.dart/codegen_loader.g.dart';
import '../../../../../../../models/country.dart';
import '../../../../../../../providers/country_provider.dart';

class ClientCountry extends StatefulWidget {
  final FocusNode node;
  final FocusNode nextNode;
  final Function(int id, bool taxAccount) selectedClientCountry;

  const ClientCountry({
    super.key,
    required this.node,
    required this.nextNode,
    required this.selectedClientCountry,
  });

  @override
  State<ClientCountry> createState() => _ClientCountryState();
}

class _ClientCountryState extends State<ClientCountry> {
  @override
  Widget build(BuildContext context) {
    List<Country> countries = Provider.of<CountryProvider>(context).countries;

    return SizedBox(
      width: 300,
      child: DropdownButtonFormField(
        style: Theme.of(context).textTheme.bodySmall,
        borderRadius: BorderRadius.circular(8),
        items: [
          for (int cc = 0; cc < countries.length; cc++)
            DropdownMenuItem(
              value: countries[cc].id,
              child: Text(countries[cc].name),
            )
        ],
        decoration: InputDecoration(hintText: LocaleKeys.globalVocabulary_country.tr()),
        focusNode: widget.node,
        onChanged: (c) {
          focusWidget(context, node: widget.nextNode);
          bool haveTaxAccount = countries.firstWhere((cc) => cc.id == c).haveTaxAccount;
          setState(() => widget.selectedClientCountry(c!, haveTaxAccount));
        },
        validator: (val) => dropDownSharedValidator(val),
      ),
    );
  }
}
