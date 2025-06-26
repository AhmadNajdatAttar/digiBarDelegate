import 'package:flutter/material.dart';

import '../../../../../configurations/rounded_card_image.dart';

class UsernameAndImage extends StatefulWidget {
  final String username;
  final String image;
  const UsernameAndImage({
    super.key,
    required this.username,
    required this.image,
  });

  @override
  State<UsernameAndImage> createState() => _UsernameAndImageState();
}

class _UsernameAndImageState extends State<UsernameAndImage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RoundedCardImage(width: 100, height: 100, image: widget.image),
        Padding(padding: const EdgeInsets.symmetric(vertical: 10), child: Text(widget.username)),
        const Divider(),
      ],
    );
  }
}
