import 'package:flutter/material.dart';

import '../../../../configurations/consts/consts_colors.dart';
import '../../../../configurations/functions.dart';
import '../../../../configurations/rounded_card_image.dart';
import '../../../../models/user.dart';
import 'changeImage/change_image.dart';
import 'changeImage/username_and_image.dart';
import 'logOut/log_out.dart';
import 'modifyPassword/update_password.dart';

class PopUpInfo extends StatefulWidget {
  final User user;
  const PopUpInfo({super.key, required this.user});

  @override
  State<PopUpInfo> createState() => _PopUpInfoState();
}

class _PopUpInfoState extends State<PopUpInfo> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      padding: EdgeInsets.zero,
      icon: !widget.user.image.contains('notSet')
          ? RoundedCardImage(height: 35, width: 35, image: widget.user.image)
          : const CircleAvatar(
              backgroundColor: white, radius: 16, child: Icon(Icons.person, color: themeColor, size: 20)),
      onSelected: (val) {
        switch (val) {
          case 'changeImage':
            showChooseImageDialog(context);
          case 'updatePassword':
            showModifyPasswordDialog(context);
          case 'logout':
            showLogoutDialog(context);
        }
      },
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          value: 'info',
          child: UsernameAndImage(image: widget.user.image, username: widget.user.username),
        ),
        PopupMenuItem(
          value: 'changeImage',
          child: ChangeImage(id: widget.user.id, image: widget.user.image),
        ),
        PopupMenuItem(
          value: 'updatePassword',
          child: UpdatePassword(id: widget.user.id, token: widget.user.token),
        ),
        const PopupMenuItem(
          value: 'logout',
          child: Logout(),
        ),
      ],
    );
  }
}
