import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:muapp6/controllers/Cart_controller.dart';
import 'package:muapp6/controllers/populart_product_controller.dart';
import 'package:muapp6/pages/cart/cart-page.dart';
import 'package:muapp6/pages/home/main_food_page.dart';
import 'package:muapp6/routes/route_helper.dart';
import 'package:muapp6/utils/dimensions.dart';
import 'package:muapp6/wigets/app_icon.dart';
import 'package:readmore/readmore.dart';

import '../../wigets/app_column.dart';
import '../../wigets/big_text.dart';
import '../../wigets/icon_and_text_widget.dart';
import '../../wigets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  PopularFoodDetail({Key? key, required this.pageId,required this.page}) : super(key: key);
  int pageId;
  String page;
  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initProduct(product,Get.find<CartController>());
    //print("page id is"+pageId.toString());
    //print("product name is"+product.name.toString());
    return Scaffold(
      backgroundColor: Color(0xFFFFF8E1),
      body: Stack(
        children: [
          //background image
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImgSize,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage(product.img!))),
              )),
          //icon widgets
          Positioned(
              left: Dimensions.width20,
              right: Dimensions.width20,
              top: Dimensions.width45,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        if(page=="cartpage"){Get.toNamed(RouteHelper.getCartPage());}
                        else{Get.toNamed(RouteHelper.getInitial());}
                      },
                      child: AppIcon(
                        icon: Icons.arrow_back_ios,
                        backgroundColor: Color(0xFFFFF8E1).withOpacity(0.5),
                      )),
                 GetBuilder<PopularProductController>(builder: (controller){
                   return Stack(
                     children: [
                       GestureDetector(
                           onTap:(){
                             if(controller.totalItems>=1){
                               Get.toNamed(RouteHelper.getCartPage());
                             }
                              else{Get.snackbar("Veuillez Vérifiez", "Pas d'articles dans le panier",backgroundColor: Colors.purpleAccent,colorText: Color(0xFFFFF8E1));}
                           },
                           child: AppIcon(icon: Icons.shopping_cart_outlined, backgroundColor: Color(0xFFFFF8E1).withOpacity(0.5),)),
                       controller.totalItems>=1?
                       Positioned(
                         right:0,top:0,
                         child: AppIcon(icon: Icons.circle,
                           backgroundColor: Colors.purpleAccent.withOpacity(0.8),
                           iconColor: Colors.transparent,
                           size: 20,),
                       ):
                        Container(),
                       Get.find<PopularProductController>().totalItems>=1?
                       Positioned(
                         right:6,top:3,
                         child: BigText(text: Get.find<PopularProductController>().totalItems.toString(),
                           size:12,color: Colors.white,),
                       ):
                       Container(),


                     ],
                   );
                 })
                ],
              )),
          //introduction of food
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularFoodImgSize - 30,
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    top: Dimensions.height20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    topLeft: Radius.circular(Dimensions.radius20),
                  ),
                  color: Color(0xFFFFF8E1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(
                      text: product.name!,
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    BigText(
                      text: "à propos:",
                      size: Dimensions.font20,
                      font: "lobster",
                    ),
                    //expandable text widget
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Container(
                          padding: EdgeInsets.only(top: Dimensions.height20),
                          child: ReadMoreText(
                            product.description!,
                            trimLines: 3,
                            textAlign: TextAlign.justify,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: "Lire la suite",
                            trimExpandedText: "Afficher moins",
                            lessStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.purpleAccent),
                            moreStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.purpleAccent),
                            style: TextStyle(
                              fontSize: Dimensions.font15,
                              color: Colors.black54,
                              height: 1.8,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (popularProduct) {
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
            child: Row(
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
                      GestureDetector(
                        onTap: () {
                          popularProduct.setQuantity(false);
                        },
                        child: Icon(
                          Icons.remove,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: Dimensions.width10 / 2,
                      ),
                      BigText(text: popularProduct.inCartItems.toString()),
                      SizedBox(
                        width: Dimensions.width10 / 2,
                      ),
                      GestureDetector(
                          onTap: () {
                            popularProduct.setQuantity(true);
                          },
                          child: Icon(
                            Icons.add,
                            color: Colors.black,
                          )),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    popularProduct.addItem(product);
                    Get.snackbar("Article ajouté a la carte","${product.name!}",backgroundColor: Colors.purpleAccent,colorText: Color(0xFFFFF8E1));
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.height20,
                        bottom: Dimensions.height20,
                        left: Dimensions.width20,
                        right: Dimensions.width20),
                    child: BigText(
                      text: "${product.price!} dt | Ajouter à la carte",
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
            ),
          );
        },
      ),
    );
  }
}
