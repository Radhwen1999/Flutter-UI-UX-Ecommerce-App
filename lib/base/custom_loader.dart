import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muapp6/controllers/auth_controller.dart';
import 'package:muapp6/utils/dimensions.dart';
import 'package:get/get.dart';
class CustomLoader extends StatelessWidget {
  const CustomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("loading state"+Get.find<AuthController>().isLoading.toString());
    return Center(
      child: Container(
        height: Dimensions.height20*5,
        width: Dimensions.height20*5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.height20*5/2),
          color: Color(0xFFFFECB3)
        ),
        alignment: Alignment.center,
        child: CircularProgressIndicator(color: Color(0xFFFFF8E1),),
      ),
    );
  }
}
