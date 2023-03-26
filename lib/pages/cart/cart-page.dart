import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muapp6/base/no_data_page.dart';
import 'package:muapp6/controllers/Cart_controller.dart';
import 'package:muapp6/controllers/populart_product_controller.dart';
import 'package:muapp6/pages/home/main_food_page.dart';
import 'package:muapp6/routes/route_helper.dart';
import 'package:muapp6/wigets/big_text.dart';
import 'package:muapp6/wigets/small_text.dart';

import '../../controllers/auth_controller.dart';
import '../../controllers/nov_app_controller.dart';
import '../../utils/dimensions.dart';
import '../../wigets/app_icon.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8E1),
      body: Stack(
        children: [
          Positioned(
              left: Dimensions.width20,
              right: Dimensions.width20,
              top: Dimensions.height20 * 3,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppIcon(
                      icon: Icons.arrow_back_ios,
                      backgroundColor: Colors.purpleAccent,
                      iconSize: Dimensions.iconsize24,
                      iconColor: Color(0xFFFFF8E1),
                    ),
                    SizedBox(
                      width: Dimensions.width20 * 5,
                    ),
                    GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteHelper.getInitial());
                        },
                        child: AppIcon(
                            icon: Icons.home_outlined,
                            backgroundColor: Colors.purpleAccent,
                            iconSize: Dimensions.iconsize24,
                            iconColor: Color(0xFFFFF8E1))),
                    AppIcon(
                        icon: Icons.shopping_cart_outlined,
                        backgroundColor: Colors.purpleAccent,
                        iconSize: Dimensions.iconsize24,
                        iconColor: Color(0xFFFFF8E1)),
                  ])),
          GetBuilder<CartController>(builder: (_cartController){
            return _cartController.getItems.length>0?Positioned(
                top: Dimensions.height20 * 5,
                left: Dimensions.width20,
                right: Dimensions.width20,
                bottom: 0,
                child: Container(
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: GetBuilder<CartController>(builder: (cartController) {
                      var _cartList = cartController.getItems;
                      return ListView.builder(
                          itemCount: _cartList.length,
                          itemBuilder: (_, index) {
                            return Container(
                              margin: EdgeInsets.only(top: Dimensions.height10),
                              height: Dimensions.height20 * 5,
                              width: double.maxFinite,
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap:(){
                                      var popularIndex=Get.find<PopularProductController>().
                                      popularProductList.
                                      indexOf(_cartList[index].productModel!);
                                      if(popularIndex>=0){
                                        Get.toNamed(RouteHelper.getPopularFood(popularIndex,"cart-page"));
                                      }else{
                                        var novIndex=Get.find<NovAppController>().
                                        novAppList.
                                        indexOf(_cartList[index].productModel!);
                                        if(novIndex<0){
                                          Get.snackbar("Désolé", "Cet article existe dans vos historiques",backgroundColor: Colors.purpleAccent,colorText: Color(0xFFFFF8E1));
                                        }else{
                                          Get.toNamed(RouteHelper.getNovApp(popularIndex));
                                        }
                                      }
                                    },
                                    child: Container(
                                      width: Dimensions.height20 * 5,
                                      height: Dimensions.height20 * 5,
                                      margin: EdgeInsets.only(
                                          bottom: Dimensions.height10),
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(cartController
                                                .getItems[index].img!),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.radius20),
                                          color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(
                                    width: Dimensions.width10,
                                  ),
                                  Expanded(
                                      child: Container(
                                        height: Dimensions.height20 * 5,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: [
                                            BigText(
                                              text: _cartList[index].name!,
                                              font: "pacificio",
                                              color: Colors.black54,
                                            ),
                                            SmallText(text: "Sucré Salé"),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                BigText(
                                                  text: _cartList[index]
                                                      .price
                                                      .toString() +
                                                      " Dt",
                                                  color: Colors.black,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      top: Dimensions.height10 / 2,
                                                      bottom: Dimensions.height10 / 2,
                                                      left: Dimensions.width10,
                                                      right: Dimensions.width10),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions.radius20),
                                                    color: Color(0xFFFFECB3),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          cartController.addItem(_cartList[index].productModel!,-1);
                                                        },
                                                        child: Icon(
                                                          Icons.remove,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: Dimensions.width10 / 2,
                                                      ),
                                                      BigText(
                                                          text: _cartList[index]
                                                              .quantity
                                                              .toString()),
                                                      // popularProduct.inCartItems.toString()),
                                                      SizedBox(
                                                        width: Dimensions.width10 / 2,
                                                      ),
                                                      GestureDetector(
                                                          onTap: () {
                                                            cartController.addItem(_cartList[index].productModel!,1);
                                                          },
                                                          child: Icon(
                                                            Icons.add,
                                                            color: Colors.black,
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ))
                                ],
                              ),
                            );
                          });
                    }),
                  ),
                )):NoDataPage(text: "Votre Carte est vide!");
          })
        ],
      ),
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (cartController) {
          return Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(
                top: Dimensions.height30,
                bottom: Dimensions.height30,
                left: Dimensions.width20,
                right: Dimensions.width20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20 * 2),
                topRight: Radius.circular(Dimensions.radius20 * 2),
              ),
              color: Color(0xFFFFECB3),
            ),
            child: cartController.getItems.length>0?Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      left: Dimensions.width20,
                      right: Dimensions.width20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Color(0xFFFFF8E1),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: Dimensions.width10 / 2,
                      ),
                      BigText(text: cartController.getTotalAmount.toString()+" Dt"),
                      SizedBox(
                        width: Dimensions.width10 / 2,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    //complete the Backend First
                              //if(Get.find<AuthController>().userLoggedIn()){
                    //if(userHasloogedIn)
                    //popularProduct.addItem(product);
                    cartController.addToHistory();
                  //}
                   /* else{
                      Get.toNamed(RouteHelper.getSignInPage());
                    }*/
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.height20,
                        bottom: Dimensions.height20,
                        left: Dimensions.width20,
                        right: Dimensions.width20),
                    child: BigText(
                      text: "Passez au paiement",
                      color: Color(0xFFFFF8E1),
                      size: Dimensions.font15,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.purpleAccent,
                    ),
                  ),
                ),
              ],
            ):Container(),
          );
        },
      ),
    );
  }
}
