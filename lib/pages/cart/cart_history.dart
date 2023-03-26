import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:muapp6/base/no_data_page.dart';
import 'package:muapp6/controllers/Cart_controller.dart';
import 'package:muapp6/models/cart_model.dart';
import 'package:muapp6/routes/route_helper.dart';
import 'package:muapp6/wigets/app_icon.dart';
import 'package:muapp6/wigets/big_text.dart';
import 'package:muapp6/wigets/small_text.dart';

import '../../utils/dimensions.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  //var product = Get.find<CartController>().getCartHistoryList();
  Widget build(BuildContext context) {
    var getCartHistoryList=Get.find<CartController>().getCartHistoryList().reversed.toList();


    Map<String,int> cartItemsPerOrder=Map();


    for(int i=0;i<getCartHistoryList.length;i++){
      if(cartItemsPerOrder.containsKey(getCartHistoryList[i].time!)){
        cartItemsPerOrder.update(getCartHistoryList[i].time!, (value) => ++value);
      }else{
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!,() =>1);
      }
    }
    List<int> cartItemsToOrderToList(){
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }
    List<String> cartOrderTimeToList(){
      return cartItemsPerOrder.entries.map((e) => e.key).toList();
    }
    List<int> itemsPerOrder = cartItemsToOrderToList();
    var listCounter=0;
    Widget timeWidget (int index){
      var outputDate=DateTime.now().toString();
      if(index<getCartHistoryList.length){
        DateTime parseDate=DateFormat("yyyy-MM-dd HH:mm:ss").parse(getCartHistoryList[listCounter].time!);
        var inputDate=DateTime.parse(parseDate.toString());
        var outputFormat=DateFormat("MM/dd/yyyy hh:mm a");
        var outputDate =outputFormat.format(inputDate);
      }
      return BigText(text: outputDate);
    }

    return Scaffold(

      backgroundColor: Color(0xFFFFF8E1),
      body: Column(
        children: [
            Container(
              height: Dimensions.height20*5,
              color: Color(0xFFFFECB3),
              width: double.maxFinite,
              padding: EdgeInsets.only(top: Dimensions.height20*2.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BigText(text: "Vote historique d'achats",color: Colors.purpleAccent,),
                  AppIcon(icon: Icons.shopping_cart_outlined,backgroundColor: Color(0xFFFFF8E1),iconColor: Colors.black54,)
                ],
              ),
            ),
          GetBuilder<CartController>(builder: (_cartController){
            return _cartController.getCartHistoryList().length>0?Expanded(
              child: Container(
                margin: EdgeInsets.only(top: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
                child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView(
                    children: [
                      for(int j=0;j<itemsPerOrder.length;j++)
                        Container(
                          height: Dimensions.width40*3,
                          margin: EdgeInsets.only(bottom: Dimensions.height20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              timeWidget(listCounter),
                              SizedBox(height: Dimensions.height10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Wrap(
                                      direction: Axis.horizontal,
                                      children: List.generate(itemsPerOrder[j], (index) {
                                        if(listCounter<getCartHistoryList.length){
                                          listCounter++;
                                        }
                                        return
                                          index<3?
                                          Container(
                                            width: Dimensions.width20*4,
                                            height: Dimensions.height20*4,
                                            margin: EdgeInsets.only(right: Dimensions.width10/2),
                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius20/2),
                                                image: DecorationImage(
                                                  image: AssetImage(getCartHistoryList[listCounter-1].img!),
                                                  fit: BoxFit.cover,
                                                )
                                            ),
                                          )
                                              :Container()
                                        ;
                                      }
                                      )
                                  ),
                                  Container(
                                    height: Dimensions.width40*2,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SmallText(text: "Totale"),
                                        BigText(text: "${itemsPerOrder[j]} article(s)",),
                                        GestureDetector(
                                          onTap: (){
                                            var orderTime= cartOrderTimeToList();
                                            Map<int,CartModel> moreOrder={};
                                            for(int x=0;x<getCartHistoryList.length;x++){
                                              if(getCartHistoryList[x].time==orderTime[j]){
                                                moreOrder.putIfAbsent(getCartHistoryList[x].id!,
                                                        ()=>CartModel.fromJson(jsonDecode(jsonEncode(getCartHistoryList[x])))
                                                );
                                              }
                                            }
                                            Get.find<CartController>().setItems=moreOrder;
                                            Get.find<CartController>().addToCartList();
                                            Get.toNamed(RouteHelper.getCartPage());
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(horizontal: Dimensions.width10/1.5,vertical: Dimensions.height10/1.5),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(Dimensions.radius20/2),
                                                border: Border.all(width: 1,color: Colors.purple)
                                            ),
                                            child: SmallText(text: "recommander",color: Colors.purple,),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),

                        )

                    ],
                  ),
                ),
              ),
            ):
            SizedBox(
                height: MediaQuery.of(context).size.height/1.5,
                child: const Center(child: NoDataPage(text: "Vous n'avez rien achetez jusqu'à présent ")));
          })

        ],
      ),
    );
  }
}
