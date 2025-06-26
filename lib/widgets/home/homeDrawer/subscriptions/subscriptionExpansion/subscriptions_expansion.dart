import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/locale_keys.g.dart/codegen_loader.g.dart';
import 'new_main_subscription_tile.dart';
import 'new_support_subscription_tile.dart';

class SubscriptionsExpansion extends StatefulWidget {
  final int userId;
  const SubscriptionsExpansion({super.key, required this.userId});

  @override
  State<SubscriptionsExpansion> createState() => _SubscriptionsExpansionState();
}

class _SubscriptionsExpansionState extends State<SubscriptionsExpansion> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(LocaleKeys.home_subscriptions_subscriptions.tr()),
      trailing: const Icon(Icons.list_alt_outlined),
      children: [
        NewMainSubscriptionTile(userId: widget.userId),
        NewSupportSubscriptionTile(userId: widget.userId),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 1),
          child: ListTile(
            leading: const Icon(Icons.circle, size: 6),
            title: Text(LocaleKeys.home_subscriptions_subscriptionsList.tr()),
            trailing: const Icon(Icons.list),
          ),
        ),
      ],
    );
  }
}
