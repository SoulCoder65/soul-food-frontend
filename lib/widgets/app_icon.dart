import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color iconColor;
  final double size;
  AppIcon(
      {Key? key,
      required this.icon,
      this.color = const Color(0xFFfcf4e4),
      this.iconColor = const Color(0xFF756d54),
      this.size = 40})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size / 2), color: color),
      child: Icon(
        icon,
        color: iconColor,
        size: Dimensions.icon16,
      ),
    );
  }
}
