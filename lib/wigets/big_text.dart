import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class BigText extends StatelessWidget {
  BigText({Key? key,
    this.font,
    this.color=Colors.black,
    required this.text,
    this.overFlow=TextOverflow.ellipsis,
  this.size=0})
      : super(key: key);
Color? color;
final String text;
double size;
TextOverflow overFlow;
String? font;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overFlow,
      style: TextStyle(
        fontFamily: font,
        fontSize: size==0?Dimensions.font20:size,
        color: color,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
