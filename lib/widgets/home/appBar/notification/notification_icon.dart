import 'package:flutter/material.dart';

import '../../../../configurations/consts/consts_colors.dart';

class NotificationIcon extends StatefulWidget {
  const NotificationIcon({super.key});

  @override
  State<NotificationIcon> createState() => _NotificationIconState();
}

class _NotificationIconState extends State<NotificationIcon> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: CircleAvatar(
        backgroundColor: white,
        radius: 17,
        child: Icon(
          Icons.notifications,
          color: themeColorAccent,
          size: 20,
        ),
      ),
    );
  }
}
