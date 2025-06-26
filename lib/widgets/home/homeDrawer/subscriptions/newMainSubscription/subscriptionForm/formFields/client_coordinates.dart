import '../../../../../../../configurations/consts/consts_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../../../../configurations/consts/consts.dart';
import '../../../../../../../configurations/functions.dart';
import '../../../../../../../generated/locale_keys.g.dart/codegen_loader.g.dart';

class ClientCoordinates extends StatefulWidget {
  final FocusNode node;
  final FocusNode nextNode;
  final bool clientCoordinatesState;
  final Function(Position position, bool clientCoordinatesStateVal) selectedPosition;

  const ClientCoordinates({
    super.key,
    required this.node,
    required this.nextNode,
    required this.clientCoordinatesState,
    required this.selectedPosition,
  });

  @override
  State<ClientCoordinates> createState() => _ClientCoordinatesState();
}

class _ClientCoordinatesState extends State<ClientCoordinates> {
  bool getCoordinates = false;
  late Position position;
  gitPos() async {
    Position pos = await determinePosition();
    if (pos.latitude != 0) {
      setState(() {
        getCoordinates = true;
        position = pos;
      });
    } else {}
    focusWidget(context, node: widget.nextNode);
    setState(() => widget.selectedPosition(pos, true));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextFormField(
        readOnly: true,
        focusNode: widget.node,
        decoration: InputDecoration(
          hintText: getCoordinates
              ? '${position.longitude}  /  ${position.latitude}'
              : LocaleKeys.home_subscriptions_newMainSubscription_subscriptionForm_clientCoordinates.tr(),
          suffixIcon: getCoordinates
              ? const Icon(Icons.check_circle_outline_sharp, color: green)
              : InkWell(onTap: () => gitPos(), child: const Icon(locationIcon)),
        ),
        validator: (d) {
          if (!widget.clientCoordinatesState) {
            return LocaleKeys.login_loginForm_validation_thisFieldIsRequired.tr();
          } else {
            return null;
          }
        },
      ),
    );
  }
}
