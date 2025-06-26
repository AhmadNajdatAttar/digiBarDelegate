import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../configurations/functions.dart';
import '../../../../../../../configurations/validators.dart';
import '../../../../../../../generated/locale_keys.g.dart/codegen_loader.g.dart';
import '../../../../../../../models/client_category.dart' as ccm;
import '../../../../../../../providers/client_category_provider.dart';

class ClientCategory extends StatefulWidget {
  final FocusNode node;
  final FocusNode nextNode;
  final Function(int id) selectedClientCategory;
  const ClientCategory({
    super.key,
    required this.node,
    required this.nextNode,
    required this.selectedClientCategory,
  });

  @override
  State<ClientCategory> createState() => _ClientCategoryState();
}

class _ClientCategoryState extends State<ClientCategory> {
  @override
  Widget build(BuildContext context) {
    List<ccm.ClientCategory> clientCategories = Provider.of<ClientCategoryProvider>(context).clientCategories;
    return SizedBox(
      width: 300,
      child: DropdownButtonFormField(
        style: Theme.of(context).textTheme.bodySmall,
        borderRadius: BorderRadius.circular(8),
        items: [
          for (int cc = 0; cc < clientCategories.length; cc++)
            DropdownMenuItem(
              value: clientCategories[cc].id,
              child: Text(clientCategories[cc].title[context.locale.languageCode]!),
            )
        ],
        decoration: InputDecoration(
            hintText: LocaleKeys.home_subscriptions_newMainSubscription_subscriptionForm_clientCategory.tr()),
        focusNode: widget.node,
        onChanged: (c) {
          focusWidget(context, node: widget.nextNode);
          setState(() => widget.selectedClientCategory(c!));
        },
        validator: (val) => dropDownSharedValidator(val),
      ),
    );
  }
}
