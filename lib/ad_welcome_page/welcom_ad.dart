import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:muapp6/utils/dimensions.dart';
import 'package:muapp6/wigets/big_text.dart';

import '../routes/route_helper.dart';
import 'glassmorphism.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.maxFinite,
            height: double.infinity,
            child: Image.asset(
              "assets/palmproducts/logo4.png",
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 50.0,
                ),
                Center(
                    child: Container(
                  child: Image.asset(
                    "assets/palmproducts/titlepalm.png",
                  ),
                )),
                Spacer(),
                BigText(
                  text: "-POWERED  BY AD- ",
                  font: "monoton",
                  size:10,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 130,
                ),

                // Build Widget Glassmorphism
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Container(
                    /*decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/palmproducts/gmbg.png")
                      ),),*/
                    child: Glassmorphism(
                      blur: 15,
                      opacity: 0.2,
                      radius: 50,
                      child: Container(

                        height: 100,
                        padding: const EdgeInsets.only(bottom: 6,left: 5,right: 5),
                        child: Column(
                          children: [
                            /*const Text(
                              'Explorer votre Salon De Thé',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Venez pour vivre une experience unique',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.8),
                                fontSize: 16.0,
                              ),
                            ),*/
                            const Spacer(),
                            /*Glassmorphism(
                              blur: 20,
                              opacity: 0.1,
                              radius: 50.0,*/
                              /*child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/palmproducts/gmbg.png"),
                                    fit: BoxFit.cover,
                                  ),),*/
                                //child:
                                TextButton(
                                  onPressed: () {
                                    Get.toNamed(RouteHelper.getSignInPage());
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 20,
                                      horizontal: 20,
                                    ),



                                    child: const Text(
                                      'Cliquer ici',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                ),
                              //),
                      //),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
