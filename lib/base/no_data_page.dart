import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoDataPage extends StatelessWidget {
  final String text;
  final String imgPath;
  const NoDataPage({Key? key,required this.text,this.imgPath="assets/palmproducts/emptycart.png"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(imgPath,
          height: MediaQuery.of(context).size.height*0.40,
          width: MediaQuery.of(context).size.height*0.40,
        ),
        SizedBox(height:MediaQuery.of(context).size.height*0.03 ,),
        Text(text,
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.height*0.0175,
          color: Theme.of(context).disabledColor,
        ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
