import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton_plus/flutter_skeleton_plus.dart';

import 'consts/consts.dart';
import 'consts/consts_colors.dart';
import 'theme/light/colors_light.dart';

class RoundedCardImage extends StatefulWidget {
  final double width;
  final double height;
  final String image;

  const RoundedCardImage({super.key, required this.width, required this.height, required this.image});

  @override
  State<RoundedCardImage> createState() => _RoundedCardImageState();
}

class _RoundedCardImageState extends State<RoundedCardImage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 5,
        shape: const StadiumBorder(),
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(border: Border.all(color: orange), borderRadius: BorderRadius.circular(100)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: CachedNetworkImage(
              imageUrl: userImage + widget.image,
              fit: BoxFit.cover,
              placeholder: (c, url) => const SkeletonAvatar(style: SkeletonAvatarStyle(width: 100, height: 100)),
              errorWidget: (c, s, w) => const Icon(Icons.error_outline, size: 50, color: grey500),
            ),
          ),
        ),
      ),
    );
  }
}
