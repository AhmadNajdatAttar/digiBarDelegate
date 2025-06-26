import 'package:flutter/material.dart';

import 'custom_linear_progress.dart';
import 'success_check.dart';

class AnimatedSwitcherSuccess extends StatefulWidget {
  final bool showSuccess;
  final double progressValue;
  const AnimatedSwitcherSuccess({super.key, required this.showSuccess, required this.progressValue});

  @override
  State<AnimatedSwitcherSuccess> createState() => _AnimatedSwitcherSuccessState();
}

class _AnimatedSwitcherSuccessState extends State<AnimatedSwitcherSuccess> {
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, StateSetter setState) {
      return AlertDialog(
        content: AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          transitionBuilder: (child, animation) => FadeTransition(opacity: animation, child: child),
          child: widget.showSuccess
              ? const SuccessCheck(key: ValueKey('success'))
              : CustomCirculerProgress(value: widget.progressValue, key: const ValueKey('progress')),
        ),
      );
    });
  }
}
