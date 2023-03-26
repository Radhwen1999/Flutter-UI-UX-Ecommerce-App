import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:muapp6/base/custom_loader.dart';
import 'package:muapp6/base/show_custom_snackbar.dart';
import 'package:muapp6/controllers/auth_controller.dart';
import 'package:muapp6/models/sign_up_body.dart';
import 'package:muapp6/pages/auth/sign_in_page.dart';
import 'package:muapp6/wigets/app_text_field.dart';
import 'package:muapp6/wigets/big_text.dart';

import '../../utils/dimensions.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController=TextEditingController();
    var passwordController=TextEditingController();
    var nameController=TextEditingController();
    var phoneController=TextEditingController();
    var signUpImages=[
      "assets/palmproducts/t.png",
      "assets/palmproducts/f.png",
      "assets/palmproducts/g.png",
    ];
    void _registration(AuthController authController){
      //var authController=Get.find<AuthController>();
      String name= nameController.text.trim();
      String email= emailController.text.trim();
      String password= passwordController.text.trim();
      String phone= phoneController.text.trim();
      if(name.isEmpty){
        showCustomSnackBar(title: "Veuillez vérifier","Saisir votre nom");
      }else if(phone.isEmpty){
        showCustomSnackBar(title:"Veuillez vérifier", "Saisir votre numéro de Téléphone");
      }else if(email.isEmpty){
        showCustomSnackBar(title: "Veuillez vérifier","Saisir votre addresse Email");
      }else if(!GetUtils.isEmail(email)){
        showCustomSnackBar(title:"Veuillez vérifier", "Addresse email non valide");
      }else if(password.isEmpty){
        showCustomSnackBar(title:"Veuillez vérifier", "Saisir votre mot de passe");
      }else if(password.length<6){
        showCustomSnackBar(title:"Veuillez vérifier","Mot de passe ne peut pas être moins de 6 caractères");
      }else{
        showCustomSnackBar("Votre compte est crée avec succèes",title: "");
        SignUpBody signUpBody = SignUpBody(
            name: name,
            phone: phone,
            email: email,
            password: password);
        authController.registration(signUpBody).then((status){
          if(status.isSuccess){
                print("succes registration");
          }else{
            showCustomSnackBar(status.message);
          }
        });
      }
    }
    return Scaffold(
      backgroundColor: Color(0xFFFFF8E1),
      body:GetBuilder<AuthController>(builder: (_authcontroller){
       return !_authcontroller.isLoading?SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: Dimensions.screenHeight*0.05,),
              Container(
                height: Dimensions.screenHeight*0.25,
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: Dimensions.radius20*5,
                    backgroundImage: AssetImage("assets/palmproducts/palmlogo.png"),
                  ),
                ),
              ),
              SizedBox(height: Dimensions.height20,),
              AppTextField(hintText: "saisir votre email", icon: Icons.email, textController: emailController),
              SizedBox(height: Dimensions.height30,),
              AppTextField(hintText: "saisir votre mot de passe", icon: Icons.password_sharp, textController: passwordController,isObscure:true,),
              SizedBox(height: Dimensions.height30,),
              AppTextField(hintText: "saisir votre nom", icon: Icons.person, textController: nameController),
              SizedBox(height: Dimensions.height30,),
              AppTextField(hintText: "saisir votre telephone", icon: Icons.phone, textController: phoneController),
              SizedBox(height: Dimensions.width30,),
              //signupbutton
              GestureDetector(
                onTap: (){
                  _registration(_authcontroller);
                },
                child: Container(
                  width: Dimensions.screenWidth/2,
                  height: Dimensions.screenHeight/13,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius30),
                      color: Colors.black54
                  ),
                  child: Center(child: BigText(text: "S'inscrire",color: Colors.white,size: Dimensions.width30,font: "pacificio",)),
                ),
              ),
              SizedBox(height: Dimensions.height10,),
              //tagline
              RichText(text: TextSpan(
                  recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SignInPage(),transition: Transition.fade),
                  text: "Avez-vous déja un compte?",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: Dimensions.font20,
                      fontFamily: "lobster"
                  )
              )
              ),
              SizedBox(height: Dimensions.screenHeight*0.005,),
              //signupoptions
              RichText(text: TextSpan(
                  text: "Ou bien s'incrire par",
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: Dimensions.font15,
                      fontFamily: "lobster"
                  )
              )
              ),
              Wrap(
                children: List.generate(3, (index) => Padding(
                  padding: EdgeInsets.all(8),
                  child: CircleAvatar(
                    radius: Dimensions.radius30,
                    backgroundImage: AssetImage(signUpImages[index]),

                  ),
                )),
              )

            ],
          ),
        ):CustomLoader();
      },) ,
    );


  }
}
