
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muapp6/wigets/app_icon.dart';
import 'package:muapp6/wigets/big_text.dart';

import '../utils/dimensions.dart';

class AccountWidget extends StatelessWidget {
  AppIcon appIcon;
  BigText bigText;
  AccountWidget({Key? key,required this.bigText,required this.appIcon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.only(left: Dimensions.width20,
      top: Dimensions.width10,
      bottom: Dimensions.width10),
      child: Row(
        children: [
          appIcon,
          SizedBox(width: Dimensions.height20,),
          bigText
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white60,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            offset: Offset(0,5),
            color: Colors.grey.withOpacity(0.2),

          )
        ]
      ),
    );
  }
}
