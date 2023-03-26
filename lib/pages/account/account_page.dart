import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:muapp6/controllers/auth_controller.dart';
import 'package:muapp6/controllers/user_controller.dart';
import 'package:muapp6/routes/route_helper.dart';
import 'package:muapp6/wigets/account_widget.dart';
import 'package:muapp6/wigets/app_icon.dart';
import 'package:muapp6/wigets/big_text.dart';

import '../../controllers/Cart_controller.dart';
import '../../utils/dimensions.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     bool _userLoggedIn= Get.find<AuthController>().userLoggedIn();
     if(_userLoggedIn){
       Get.find<UserController>().getUserInfo();
     }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFECB3),
        title: Center(child: BigText(text: "Mon profil",size: Dimensions.font26,font: "pacificio",)),
      ),
      backgroundColor: Color(0xFFFFF8E1),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimensions.height20),
        child: Column(
          children: [
            //Profileicon
            AppIcon(
              icon: Icons.person,iconColor: Colors.purple,
              backgroundColor: Color(0xFFFFECB3),
              iconSize: Dimensions.iconsize24*3,
            size: Dimensions.iconsize24*6,),
            SizedBox(height: Dimensions.height30,),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //name
                    AccountWidget(bigText: BigText(text: "Radhwen",), appIcon: AppIcon(
                        icon: Icons.person,iconColor: Colors.purpleAccent ,
                        backgroundColor: Color(0xFFFFECB3),
                        iconSize: Dimensions.height10*2.5,
                        size: Dimensions.height20*2.5)),
                    SizedBox(height: Dimensions.height20,),
                    //telephone
                    AccountWidget(bigText: BigText(text: "94465555",), appIcon: AppIcon(
                        icon: Icons.phone,iconColor: Colors.purpleAccent,
                        backgroundColor: Color(0xFFFFECB3),
                        iconSize: Dimensions.height10*2.5,
                        size: Dimensions.height20*2.5)),
                    SizedBox(height: Dimensions.height20,),
                    //email
                    AccountWidget(bigText: BigText(text: "radhwen.rmili@esprit.tn",), appIcon: AppIcon(
                        icon: Icons.email,iconColor: Colors.purpleAccent,
                        backgroundColor: Color(0xFFFFECB3),
                        iconSize: Dimensions.height10*2.5,
                        size: Dimensions.height20*2.5)),
                    SizedBox(height: Dimensions.height20,),
                    //addrress
                    AccountWidget(bigText: BigText(text: "Siliana",), appIcon: AppIcon(
                        icon: Icons.location_on,iconColor: Colors.purpleAccent,
                        backgroundColor: Color(0xFFFFECB3),
                        iconSize: Dimensions.height10*2.5,
                        size: Dimensions.height20*2.5)),
                    SizedBox(height: Dimensions.height20,),
                    //message
                    AccountWidget(bigText: BigText(text: "message",), appIcon: AppIcon(
                        icon: Icons.message_outlined,iconColor: Colors.purpleAccent,
                        backgroundColor: Color(0xFFFFECB3),
                        iconSize: Dimensions.height10*2.5,
                        size: Dimensions.height20*2.5)),
                    SizedBox(height: Dimensions.height20,),
                    GestureDetector(
                      onTap: (){
                        //backend first
                        if(Get.find<AuthController>().userLoggedIn()){
                        Get.find<AuthController>().clearSharedData();
                        Get.find<CartController>().clear();
                        Get.find<CartController>().clearCartHistory();
                        Get.offNamed(RouteHelper.getSignInPage());

                        }
                        else{
                          //Testing without backend
                          Get.find<AuthController>().clearSharedData();
                          Get.find<CartController>().clear();
                          Get.find<CartController>().clearCartHistory();
                          //Get.offNamed(RouteHelper.getSignInPage());
                          Get.offNamed(RouteHelper.getWelcomeAdPage());
                        }
                      },
                      child: AccountWidget(bigText: BigText(text: "se déconnecter",), appIcon: AppIcon(
                          icon: Icons.logout,iconColor: Colors.redAccent,
                          backgroundColor: Color(0xFFFFECB3),
                          iconSize: Dimensions.height10*2.5,
                          size: Dimensions.height20*2.5)),
                    ),
                    SizedBox(height: Dimensions.height20,),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
