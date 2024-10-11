import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppIcon extends StatelessWidget {
  IconData iconData;
  Color? iconColor;
  double iconSize;

  AppIcon(
      {Key? key, this.iconColor, required this.iconData, this.iconSize = 16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      size: iconSize,
      color: iconColor,
    );
  }
}
