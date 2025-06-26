import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/locale_keys.g.dart/codegen_loader.g.dart';
import '../newMainSubscription/new_main_subscription.dart';

class NewMainSubscriptionTile extends StatefulWidget {
  final int userId;

  const NewMainSubscriptionTile({super.key, required this.userId});

  @override
  State<NewMainSubscriptionTile> createState() => _NewMainSubscriptionTileState();
}

class _NewMainSubscriptionTileState extends State<NewMainSubscriptionTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: ListTile(
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => NewMainSubscription(clerckId: widget.userId))),
        leading: const Icon(Icons.circle, size: 6),
        title: Text(LocaleKeys.home_subscriptions_newMainSubscription_newMainSubscription.tr()),
        trailing: const Icon(Icons.new_label_outlined),
      ),
    );
  }
}
