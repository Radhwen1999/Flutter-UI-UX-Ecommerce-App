import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:muapp6/routes/route_helper.dart';
import 'package:muapp6/wigets/big_text.dart';

import '../../controllers/nov_app_controller.dart';
import '../../controllers/populart_product_controller.dart';
import '../../utils/dimensions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  Future<void> _loadResource()async{
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<NovAppController>().getNovAppList();
  }

  @override
  void initState(){
    super.initState();
    _loadResource();
    controller=  AnimationController(
        vsync: this,
        duration:const Duration(seconds: 2))..forward();

    animation= CurvedAnimation(parent: controller, curve: Curves.linear);

    Timer(
      const Duration(seconds: 3),
        ()=>Get.offNamed(RouteHelper.getInitial())
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8E1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(scale: animation,
          child: Center(child: Image.asset("assets/palmproducts/palmlogo.png",width: Dimensions.splashImage,))),
          SizedBox(height: Dimensions.height10,),
          BigText(text: "Drink And Think",size: 50,font: "dance",)
        ],
      ),
    );
  }
}
