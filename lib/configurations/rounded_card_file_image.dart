import 'dart:io';
import 'package:flutter/material.dart';
import 'consts/consts_colors.dart';
import 'theme/light/colors_light.dart';

class RoundedCardFileImage extends StatefulWidget {
  final double width;
  final double height;
  final double radius;
  final File image;

  const RoundedCardFileImage({
    super.key,
    required this.width,
    required this.height,
    required this.image,
    required this.radius,
  });

  @override
  State<RoundedCardFileImage> createState() => _RoundedCardFileImageState();
}

class _RoundedCardFileImageState extends State<RoundedCardFileImage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 5,
        shape: const StadiumBorder(),
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration:
              BoxDecoration(border: Border.all(color: orange), borderRadius: BorderRadius.circular(widget.radius)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(widget.radius),
            child: Image.file(
              widget.image,
              fit: BoxFit.cover,
              errorBuilder: (c, s, w) => const Icon(Icons.error_outline, size: 50, color: grey500),
            ),
          ),
        ),
      ),
    );
  }
}
