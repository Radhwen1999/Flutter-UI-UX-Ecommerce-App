import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:muapp6/ad_welcome_page/welcom_ad.dart';
import 'package:muapp6/pages/auth/sign_in_page.dart';
import 'package:muapp6/pages/cart/cart-page.dart';
import 'package:muapp6/pages/food/recommanded_food_detail.dart';
import 'package:muapp6/pages/home/hom_page.dart';
import 'package:muapp6/pages/home/main_food_page.dart';
import 'package:muapp6/pages/splash/splash_page.dart';

import '../pages/food/popular_food_detail.dart';

class RouteHelper{
  static const String initial="/";
  static const String popularFood="/popular_food";
  static const String novApp="/nov_app";
  static const String cartPage="/cart-page";
  static const String splashPage="/splash-page";
  static const String signIn="/sign-in";
  static const String welcomeAd="/welcome-ad";

  static String getSplashPage()=>'$splashPage';
  static String getInitial()=>'$initial';
  static String getNovApp(int pageId)=>'$novApp?pageId=$pageId';
  static String getPopularFood(int pageId,String page)=>'$popularFood?pageId=$pageId&page=$page';
  static String getCartPage()=>'$cartPage';
  static String getSignInPage()=>'$signIn';
  static String getWelcomeAdPage()=>'$welcomeAd';

  static List<GetPage> routes=[
    GetPage(name: initial, page: (){return HomePage();},transition: Transition.fadeIn),
    GetPage(name: popularFood,page: (){
      var page=Get.parameters['page'];
      var pageId=Get.parameters['pageId'];
      return PopularFoodDetail(pageId:int.parse(pageId!),page:page!);},
    transition: Transition.fadeIn,
    ),
    GetPage(name: signIn,page: (){
      return SignInPage();},
      transition: Transition.fadeIn,
    ),
    GetPage(name: novApp,page: (){
      var pageId=Get.parameters['pageId'];
      return RecommendedFoodDetail(pageId:int.parse(pageId!));},
      transition: Transition.fadeIn,
    ),
    GetPage(name: cartPage, page: (){
      return CartPage();},
    transition: Transition.fadeIn),
    GetPage(name: splashPage, page: (){
      return SplashScreen();},
        transition: Transition.fadeIn),
    GetPage(name: welcomeAd,page: (){
      return Welcome();},
      transition: Transition.fadeIn,
    ),
  ];
}