import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../../configurations/validators.dart';
import '../../../../../../../generated/locale_keys.g.dart/codegen_loader.g.dart';

class HallName extends StatefulWidget {
  final TextEditingController hallNameController;
  const HallName({super.key, required this.hallNameController});

  @override
  State<HallName> createState() => _HallNameState();
}

class _HallNameState extends State<HallName> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: TextFormField(
        controller: widget.hallNameController,
        decoration: InputDecoration(hintText: LocaleKeys.home_subscriptions_newMainSubscription_halls_hallName.tr()),
        validator: (v) => sharedValidator(v),
      ),
    );
  }
}
