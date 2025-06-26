import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../configurations/functions.dart';
import '../../../../../../../configurations/validators.dart';
import '../../../../../../../generated/locale_keys.g.dart/codegen_loader.g.dart';
import '../../../../../../../models/city.dart';
import '../../../../../../../providers/city_provider.dart';

class ClientCity extends StatefulWidget {
  final FocusNode node;
  final FocusNode nextNode;
  final int? selectedCountryId;
  final int clientCity;
  final Function(int id) selectedClientCity;

  const ClientCity({
    super.key,
    required this.node,
    required this.nextNode,
    required this.selectedClientCity,
    required this.selectedCountryId,
    required this.clientCity,
  });

  @override
  State<ClientCity> createState() => ClientCityState();
}

class ClientCityState extends State<ClientCity> {
  @override
  Widget build(BuildContext context) {
    List<City> cities = Provider.of<CityProvider>(context).cities;
    return SizedBox(
      width: 300,
      child: DropdownButtonFormField<int>(
        style: Theme.of(context).textTheme.bodySmall,
        borderRadius: BorderRadius.circular(8),
        value: widget.clientCity == 0 ? null : widget.clientCity,
        items: widget.selectedCountryId == 0
            ? []
            : [
                for (int cc = 0; cc < cities.length; cc++)
                  if (widget.selectedCountryId == cities[cc].countryId)
                    DropdownMenuItem(
                      value: cities[cc].id,
                      onTap: () {
                        focusWidget(context, node: widget.nextNode);
                        setState(() => widget.selectedClientCity(cities[cc].id));
                      },
                      child: Text(cities[cc].name[context.locale.languageCode]!),
                    )
              ],
        decoration: InputDecoration(hintText: LocaleKeys.globalVocabulary_city.tr()),
        focusNode: widget.node,
        onChanged: (c) {},
        validator: (val) => dropDownSharedValidator(val),
      ),
    );
  }
}
