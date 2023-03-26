import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:muapp6/ad_welcome_page/welcom_ad.dart';
import 'package:muapp6/controllers/Cart_controller.dart';
import 'package:muapp6/controllers/nov_app_controller.dart';
import 'package:muapp6/controllers/populart_product_controller.dart';
import 'package:muapp6/pages/auth/sign_in_page.dart';
import 'package:muapp6/pages/auth/sign_up_page.dart';
import 'package:muapp6/pages/cart/cart-page.dart';
import 'package:muapp6/pages/food/popular_food_detail.dart';
import 'package:muapp6/pages/food/recommanded_food_detail.dart';
import 'package:muapp6/pages/home/food_page_body.dart';
import 'package:muapp6/pages/home/main_food_page.dart';
import 'package:muapp6/pages/splash/splash_page.dart';
import 'package:muapp6/routes/route_helper.dart';
import 'helper/dependencies.dart' as dep;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();

    return GetBuilder<PopularProductController>(builder: (_){
      return GetBuilder<NovAppController>(builder: (_){
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          //home: SignInPage(),
          //home: const SplashScreen(),
          initialRoute: RouteHelper.getSplashPage(),
          getPages: RouteHelper.routes,
        );
      });
    });
  }
}

