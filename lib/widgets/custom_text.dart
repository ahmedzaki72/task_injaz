import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String title;
  final double fontSize;
  final Color color;
  final AlignmentGeometry alignment;
  final int maxLine;

  const CustomText({
    Key key,
    this.title = '',
    this.fontSize = 16,
    this.color = Colors.black,
    this.alignment = Alignment.topLeft,
    this.maxLine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        title,
        style: TextStyle(
            fontSize: fontSize,
            color: color
        ),
        maxLines: maxLine,
      ),
    );
  }
}
