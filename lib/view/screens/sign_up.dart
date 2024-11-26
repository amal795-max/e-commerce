import 'package:e_commerce/core/constants/appcolor.dart';
import 'package:e_commerce/core/constants/approutes.dart';
import 'package:e_commerce/view/widget/CustomButton.dart';
import 'package:e_commerce/view/widget/PickImageWidget.dart';
import 'package:e_commerce/view/widget/header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/gradientBall.dart';
import '../widget/CustomTextField.dart';
class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const Positioned(
              top: -40,
              left: -30,
              child: GradientBall(),
            ),
            const Positioned(
              top: 175,
              right: -60,
              child: GradientBall(),
            ),
            Column(
              children: [
              const Header(title: "Create account", subtitle: "Please, Provide your information",),
               const SizedBox(height: 15),
               const PickImageWidget(),
                const SizedBox(height: 25),
                const CustomTextField(label: "First Name", icon: Icons.text_format),
                const SizedBox(height: 15),
                const CustomTextField(label: "Last Name", icon: Icons.text_format),
                const SizedBox(height: 15),
                const CustomTextField(label: "phone number", icon: Icons.phone),
                const SizedBox(height: 15),
                const CustomTextField(label: "password", icon: Icons.lock),
                const SizedBox(height: 15),
                const CustomTextField(label: "Location", icon: Icons.location_pin),
                const SizedBox(height: 15),

                 const CustomButton(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("already have an account ?", style: TextStyle(color: AppColor.black)),
                    TextButton(
                        onPressed: () {
                          Get.offNamed(AppRoutes.signIn);
                        },
                        child: Text("Sign in", style: TextStyle(color: AppColor.orange))),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
