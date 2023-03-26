import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  SmallText({Key? key,
    this.color=Colors.black54,
    required this.text,
    this.height=1.2,
    this.size=12})
      : super(key: key);
  Color? color;
  final String text;
  double size;
  double height;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      style: TextStyle(
        fontSize: size,
        color: color,
        height: height,
      ),
    );
  }
}
