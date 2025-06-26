import 'package:flutter/material.dart';

import 'consts/consts_colors.dart';

class CustomCirculerProgress extends StatefulWidget {
  final double value;
  const CustomCirculerProgress({
    super.key,
    required this.value,
  });

  @override
  State<CustomCirculerProgress> createState() => _CustomCirculerProgressState();
}

class _CustomCirculerProgressState extends State<CustomCirculerProgress> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 75,
          height: 75,
          child: CircularProgressIndicator(
            value: (widget.value) / 100,
            backgroundColor: grey,
            color: themeColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('${widget.value.toStringAsFixed(1)} %'),
        )
      ],
    );
  }
}
