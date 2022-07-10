import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow textOverflow;

  BigText(
      {Key? key,
      this.color=const Color(0xFF332d2b),
      required this.text,
      this.size = 0,
      this.textOverflow = TextOverflow.fade})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: textOverflow,
      style: TextStyle(
          fontFamily: 'Roboto',
          color: color,
          fontWeight: FontWeight.w400,
          fontSize: size==0?Dimensions.font20:size),
    );
  }
}
