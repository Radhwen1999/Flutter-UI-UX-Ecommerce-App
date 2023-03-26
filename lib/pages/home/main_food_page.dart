import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:muapp6/pages/home/food_page_body.dart';
import 'package:muapp6/utils/dimensions.dart';
import 'package:muapp6/wigets/big_text.dart';
import 'package:muapp6/wigets/small_text.dart';

import '../../controllers/nov_app_controller.dart';
import '../../controllers/populart_product_controller.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  Future<void> _loadResource()async{
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<NovAppController>().getNovAppList();
  }
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh:_loadResource ,
      backgroundColor: Color(0xFFFFECB3),
      color: Color(0xFFFFF8E1),
      child: Scaffold(
        backgroundColor: Color(0xFFFFF8E1),
        body: Column(
          children: [
            Container(
              color: Color(0xFFFFF8E1),
              width: double.infinity,
              margin: EdgeInsets.only(bottom: Dimensions.height10),
              child: Container(
                margin: EdgeInsets.only(top: Dimensions.width40,bottom: Dimensions.height15),
                padding: EdgeInsets.only(right: Dimensions.width20,left: Dimensions.width20),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          BigText(text: "Tunisie",color: Colors.purpleAccent,),
                          Row(
                            children: [
                              SmallText(text: "Siliana",color: Colors.black54,),
                              Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ],
                      ),
                      Center(
                        child: Container(
                          width: Dimensions.width45,
                          height: Dimensions.width45,
                          child: Icon(Icons.search,color: Colors.white,size: Dimensions.iconsize24,),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.purpleAccent,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(child: SingleChildScrollView(child: FoodPageBody())),
          ],
        ),
      )
    );
  }
}
