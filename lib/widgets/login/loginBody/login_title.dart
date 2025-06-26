import 'package:flutter/material.dart';

import '../../../digi_bar_title.dart';

class LoginTitle extends StatefulWidget {
  const LoginTitle({super.key});

  @override
  State<LoginTitle> createState() => _LoginTitleState();
}

class _LoginTitleState extends State<LoginTitle> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [DigiBarTitle(), Text('Delegate', style: TextStyle(fontFamily: 'balingka', fontSize: 20))],
      ),
    );
  }
}
