import 'package:flutter/cupertino.dart';
import 'package:muapp6/utils/dimensions.dart';
import 'package:muapp6/wigets/small_text.dart';

class IconAndTextWidget extends StatelessWidget {
  IconAndTextWidget({Key? key ,
    required this.icon,
    required this.text,
    required this.color,
    required this.iconColor}) : super(key: key);
  final IconData icon;
  final String text;
  final Color color;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: iconColor,size: Dimensions.iconsize24,),
        SizedBox(width: 5,),
        SmallText(text: text,color: color,),
      ],
    );
  }
}
