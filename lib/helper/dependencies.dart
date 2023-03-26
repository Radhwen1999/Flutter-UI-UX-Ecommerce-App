import 'package:get/get.dart';
import 'package:muapp6/controllers/Cart_controller.dart';
import 'package:muapp6/controllers/auth_controller.dart';
import 'package:muapp6/controllers/nov_app_controller.dart';
import 'package:muapp6/controllers/populart_product_controller.dart';
import 'package:muapp6/data/api/api_client.dart';
import 'package:muapp6/data/repository/auth_repo.dart';
import 'package:muapp6/data/repository/nov_app_repo.dart';
import 'package:muapp6/data/repository/popular_product_repo.dart';
import 'package:muapp6/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/repository/cart_repo.dart';



Future<void> init()async{
  final sharedPreferences=await SharedPreferences.getInstance();
  Get.lazyPut(()=>sharedPreferences);
  //api Client
  Get.lazyPut(()=>ApiClient(appBaseUrl:AppConstants.BASE_URL));
  Get.lazyPut(()=>AuthRepo(sharedPreferences: Get.find(), apiClient:Get.find() ));

  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => NovAppRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences:Get.find()));


  //controllers
  Get.lazyPut(()=>AuthController(authRepo: Get.find()));
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => NovAppController(novAppRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));


}

