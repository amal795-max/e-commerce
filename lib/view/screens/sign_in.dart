import 'package:e_commerce/core/constants/appcolor.dart';
import 'package:e_commerce/core/constants/appimages.dart';
import 'package:e_commerce/view/widget/CustomTextField.dart';
import 'package:e_commerce/view/widget/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../core/constants/approutes.dart';
import '../widget/CustomButton.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
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

                    Column(
                      children: [
                        SizedBox(height: 270,),
                        Header(title: "Welcome Back", subtitle: "Login to your account"),
              SizedBox(height: 30,),
                CustomTextField(label: "Phone Number",icon: Icons.phone,),
              SizedBox(height: 20,),
             CustomTextField(label: "Password", icon: Icons.lock),
              SizedBox(height: 20,),
        CustomButton(),

      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Don't haave an account ?", style: TextStyle(color: AppColor.black)),
          TextButton(
              onPressed: () {
                Get.offNamed(AppRoutes.signUp);},
              child: Text("Sign up", style: TextStyle(color: AppColor.orange))),
        ],
      ),]
        )
    ])]));

  }
}