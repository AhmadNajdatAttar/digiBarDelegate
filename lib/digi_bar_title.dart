import 'package:flutter/material.dart';

import 'configurations/consts/consts_colors.dart';

class DigiBarTitle extends StatelessWidget {
  const DigiBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text.rich(
      TextSpan(
        style: TextStyle(
          fontFamily: 'balingka',
          fontSize: 40,
          // shadows: [Shadow(color: grey400, offset: Offset(-1, 1))],
        ),
        children: [
          TextSpan(text: 'Di', style: TextStyle(color: themeColor)),
          TextSpan(text: 'g', style: TextStyle(color: themeColorAccent)),
          TextSpan(text: 'iB', style: TextStyle(color: themeColor)),
          TextSpan(text: 'a', style: TextStyle(color: themeColorAccent)),
          TextSpan(text: 'r', style: TextStyle(color: themeColor)),
        ],
      ),
    );
  }
}
