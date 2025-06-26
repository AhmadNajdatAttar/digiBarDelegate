import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageList extends StatefulWidget {
  const LanguageList({super.key});

  @override
  State<LanguageList> createState() => _LanguageListState();
}

class _LanguageListState extends State<LanguageList> {
  selectLanguage({required Locale value}) async {
    setState(() {
      context.setLocale(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.translate_sharp),
      itemBuilder: (context) => const [
        PopupMenuItem(value: Locale('en'), child: Text('English', style: TextStyle(fontFamily: 'creato'))),
        PopupMenuItem(value: Locale('ar'), child: Text('العربية', style: TextStyle(fontFamily: 'arabeh'))),
      ],
      onSelected: (locale) => selectLanguage(value: locale),
    );
  }
}
