import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:muapp6/base/custom_loader.dart';
import 'package:muapp6/pages/auth/sign_up_page.dart';
import 'package:muapp6/routes/route_helper.dart';
import 'package:muapp6/wigets/app_text_field.dart';
import 'package:muapp6/wigets/big_text.dart';
import '../../base/show_custom_snackbar.dart';
import '../../controllers/auth_controller.dart';
import '../../utils/dimensions.dart';


class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController=TextEditingController();
    var passwordController=TextEditingController();
    void _login(AuthController authController){
      //var authController=Get.find<AuthController>();

      String email= emailController.text.trim();
      String password= passwordController.text.trim();
       if(email.isEmpty){
        showCustomSnackBar(title: "Veuillez vérifier","Saisir votre addresse Email");
      }else if(!GetUtils.isEmail(email)){
        showCustomSnackBar(title:"Veuillez vérifier", "Addresse email non valide");
      }else if(password.isEmpty){
        showCustomSnackBar(title:"Veuillez vérifier", "Saisir votre mot de passe");
      }else if(password.length<6){
        showCustomSnackBar(title:"Veuillez vérifier","Mot de passe ne peut pas être moins de 6 caractères");
      }else{
        showCustomSnackBar("",title: "Welcome back");

        authController.login(email,password).then((status){
          if(status.isSuccess){
            //print("succes registration");
            Get.toNamed(RouteHelper.getInitial());
            //Get.toNamed(RouteHelper.getCartPage());
          }else{
            //Delete after backend
            //Get.toNamed(RouteHelper.getInitial());
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: Color(0xFFFFF8E1),
      body:GetBuilder<AuthController>(builder: (authController){
        return !authController.isLoading?SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: Dimensions.screenHeight*0.03,),
              Container(
                height: Dimensions.screenHeight*0.25,
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: Dimensions.radius20*4,
                    backgroundImage: AssetImage("assets/palmproducts/palmlogo.png"),
                  ),
                ),
              ),
              //welcome
              Container(
                width: double.maxFinite,
                margin:EdgeInsets.only(left: Dimensions.width20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "Bonjour",font: "lobster",size: Dimensions.font20*3.5,),
                    BigText(text: "Connectez-vous à votre compte",color: Colors.black54,font: "lobster",size: Dimensions.font26)
                  ],
                ),
              ),
              SizedBox(height: Dimensions.height20,),
              AppTextField(hintText: "saisir votre email", icon: Icons.email, textController: emailController),
              SizedBox(height: Dimensions.height30,),
              AppTextField(hintText: "saisir votre mot de passe", icon: Icons.password_sharp,isObscure: true, textController: passwordController),
              SizedBox(height: Dimensions.height20,),
              //tagline
              Row(
                  children:[
                    Expanded(child: Container()),
                    RichText(text: TextSpan(
                        text: "entrez vos coordonnées",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: Dimensions.font20,
                            fontFamily: "lobster"
                        )
                    )
                    ),
                    SizedBox(width: Dimensions.width20,)
                  ]
              ),
              SizedBox(height: Dimensions.width30*2,),
              //signupbutton
              GestureDetector(
                onTap: (){
                  _login(authController);
                },
                child: Container(
                  width: Dimensions.screenWidth/2,
                  height: Dimensions.screenHeight/13,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius30),
                      color: Colors.black54
                  ),
                  child: Center(child: BigText(text: "S'identifier",color: Colors.white,size: Dimensions.width30,font: "pacificio",)),
                ),
              ),
              SizedBox(height: Dimensions.screenHeight*0.02,),
              //signupoptions
              RichText(text: TextSpan(
                  text: "Vouns n'avez pas un compte?",
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: Dimensions.font15,
                      fontFamily: "lobster"
                  ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SignUpPage(),transition: Transition.fade),
                      text: "  Créer un compte",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: Dimensions.font20,
                          fontFamily: "lobster"
                      ),)
                  ]

              )
              ),
              Container(
                width: double.maxFinite,
                height: Dimensions.height20*5,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/palmproducts/titlepalm.png")
                    )
                ),
              )

            ],
          ),
        ):CustomLoader();
      },) ,
    );
  }
}
