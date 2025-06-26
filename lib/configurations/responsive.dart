import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobilePortrait;
  final Widget mobileLandscape;
  final Widget tabletPortrait;
  final Widget tabletLandscape;
  final Widget desktopPortrait;
  final Widget desktopLandscape;
  const Responsive({
    super.key,
    required this.mobilePortrait,
    required this.mobileLandscape,
    required this.tabletPortrait,
    required this.tabletLandscape,
    required this.desktopPortrait,
    required this.desktopLandscape,
  });

  /// is mobile < 650 ?
  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 650;

  /// tablet >= 650
  static bool isTablet(BuildContext context) => MediaQuery.of(context).size.width >= 650;

  ///desktop >= 1100
  static bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 1100;

  /// is Portrait ?
  static bool isPortrait(BuildContext context) => MediaQuery.of(context).orientation == Orientation.landscape;

  @override
  Widget build(BuildContext context) {
    Orientation orientationState = MediaQuery.of(context).orientation;
    return LayoutBuilder(builder: (context, constraints) {
      switch (constraints.maxWidth) {
        case >= 1100:
          if (orientationState == Orientation.landscape) {
            return desktopLandscape;
          } else {
            return desktopPortrait;
          }
        case >= 650:
          if (orientationState == Orientation.landscape) {
            return tabletLandscape;
          } else {
            return tabletPortrait;
          }
        default:
          if (orientationState == Orientation.landscape) {
            return mobileLandscape;
          } else {
            return mobilePortrait;
          }
      }
    });
  }
}
