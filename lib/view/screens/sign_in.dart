import 'package:e_commerce/core/constants/appcolor.dart';
import 'package:e_commerce/core/constants/appimages.dart';
import 'package:e_commerce/view/widget/CustomTextField.dart';
import 'package:e_commerce/view/widget/header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/approutes.dart';
import '../../core/functions/validation.dart';
import '../widget/CustomButton.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> signInKey = GlobalKey();
    return Scaffold(
        backgroundColor:AppColor.white,
        body:
        ListView(
            children: [
              Stack(
                  children:[
                    Container(
                      height: 400,
                      width: 400,
                      child:
                      ClipRRect(borderRadius: BorderRadius.circular(150),
                        child: Image.asset(AppImages.signin,fit: BoxFit.cover ,),
                      )
                  ),

                    Padding(
                      padding:const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          SizedBox(height: 270,),


                          Header(title: "Welcome Back", subtitle: "Login to your account"),



                            SizedBox(height: 30,),
                          CustomTextField(label: "Phone Number",icon: Icons.phone,
                              validator: (val) => validInput(10, 10, "Phone Number", val!)),
                          SizedBox(height: 20,),
                          CustomTextField(label: "Password", icon: Icons.lock,
                              validator: (val) => validInput(64, 8, "Password", val!)),
                          SizedBox(height: 20,),
                          CustomButton(text: "Log In",onPressed: (){
                            Get.offAllNamed(AppRoutes.bottomAppbar);}),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Don't have an account ?", style: TextStyle(color: AppColor.black)),
                                TextButton(
                                    onPressed: () {
                                      Get.offNamed(AppRoutes.signUp);},
                                    child: Text("Sign up", style: TextStyle(color: AppColor.orange))),
                              ],
                            ),]
                              ),
                    )
    ])]));

  }
}