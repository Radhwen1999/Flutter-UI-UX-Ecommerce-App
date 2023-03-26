import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muapp6/controllers/Cart_controller.dart';
import 'package:muapp6/controllers/nov_app_controller.dart';
import 'package:muapp6/controllers/populart_product_controller.dart';
import 'package:muapp6/pages/cart/cart-page.dart';
import 'package:muapp6/routes/route_helper.dart';
import 'package:muapp6/utils/dimensions.dart';
import 'package:muapp6/wigets/app_icon.dart';
import 'package:muapp6/wigets/big_text.dart';
import 'package:readmore/readmore.dart';
import 'package:get/get.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;
  const RecommendedFoodDetail({Key? key,required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var   product=Get.find<NovAppController>().novAppList[pageId];
    Get.find<PopularProductController>().initProduct(product, Get.find<CartController>());
    return Scaffold(
      backgroundColor: Color(0xFFFFF8E1),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(onTap: (){Get.toNamed(RouteHelper.initial);},child: AppIcon(icon: Icons.clear,backgroundColor: Color(0xFFFFF8E1).withOpacity(0.5),)),
                GestureDetector(
                    onTap: (){
                      Get.toNamed(RouteHelper.getCartPage());
                    },
                    child:GetBuilder<PopularProductController>(builder: (controller){
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
                    }))
                    //AppIcon(icon: Icons.shopping_cart_outlined,backgroundColor: Color(0xFFFFF8E1).withOpacity(0.5),))

              ],
            ),
            bottom: PreferredSize(preferredSize: Size.fromHeight(40),
              child:  Container(
                child: Center(child: BigText(text:product.name!,size: Dimensions.font26,font: "pacificio",)),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5,bottom: 10),
                decoration: BoxDecoration(
                  color: Color(0xFFFFECB3),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    topLeft: Radius.circular(Dimensions.radius20),
                  )
                ),
                
              )
            ),
            pinned: true,
            backgroundColor: Colors.purpleAccent,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom:Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20,top: Dimensions.height5),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                        //padding: EdgeInsets.only(top: Dimensions.height20),
                        child: ReadMoreText(product.description!,
                          trimLines: 5,textAlign: TextAlign.justify,trimMode: TrimMode.Line,
                          trimCollapsedText: "\nLire la suite",
                          trimExpandedText: "\nAfficher moins",
                          lessStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.purpleAccent
                          ),
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
                )
              ],
            )
          )
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder:(controller){
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: Dimensions.width20*2.5,
                right: Dimensions.width20*2.5,
                top: Dimensions.height10,
                bottom: Dimensions.height10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap:(){Get.snackbar("Ajouté avec succés", "Merci pour votre support!",backgroundColor: Colors.purpleAccent,colorText: Color(0xFFFFF8E1));},
                      child: AppIcon(icon: Icons.thumb_up_alt_outlined,backgroundColor: Colors.purpleAccent.withOpacity(0.5),size: Dimensions.iconsize40,)),
                  BigText(text: "Aimez-vous cet article?",font: "pacificio",size: Dimensions.font20,),
                  GestureDetector(
                      onTap: (){Get.snackbar("Ajouté avec succés", "Avez-vous des recommandation?",backgroundColor: Colors.purpleAccent,colorText: Color(0xFFFFF8E1));},
                      child: AppIcon(icon: Icons.thumb_down_alt_outlined,backgroundColor: Colors.purpleAccent.withOpacity(0.5),size: Dimensions.iconsize40,))
                ],
              ),
            ),
            Container(
              height: Dimensions.bottomHeightBar,
              padding: EdgeInsets.only(top:Dimensions.height30,bottom: Dimensions.height30,left: Dimensions.width20,right: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20*2),
                  topRight: Radius.circular(Dimensions.radius20*2),
                ),
                color: Color(0xFFFFECB3),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                        color: Color(0xFFFFF8E1),
                      ),
                      child: Icon(
                        Icons.star,
                        color: Colors.purpleAccent,
                      )
                  ),
                  Container(
                    padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
                    child: BigText(text: "Avez-vous des recommandations?",color: Color(0xFFFFF8E1),size: Dimensions.font15,),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.purpleAccent,

                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
