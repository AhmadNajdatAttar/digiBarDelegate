import 'package:flutter/material.dart';

import '../../../digi_bar_title.dart';
import '../../../models/user.dart';
import 'subscriptions/subscriptionExpansion/subscriptions_expansion.dart';

class HomeDrawer extends StatefulWidget {
  final User user;
  const HomeDrawer({super.key, required this.user});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 300,
      child: SafeArea(
        child: Column(
          children: [
            const DigiBarTitle(),
            SubscriptionsExpansion(userId: widget.user.id),
          ],
        ),
      ),
    );
  }
}
