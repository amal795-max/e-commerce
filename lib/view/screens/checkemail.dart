import 'package:e_commerce/core/constants/gradientBall.dart';
import 'package:e_commerce/view/widget/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/appColor.dart';
import '../../core/constants/approutes.dart';
import '../../core/functions/validation.dart';
import '../widget/CustomTextField.dart';

class CheckEmail extends StatelessWidget {
  const CheckEmail({Key? key}) ;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            const Positioned(right: -40, top: -40, child: GradientBall(),),
            const Positioned(left: -30, bottom: -30, child: GradientBall(),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 150),
              child: ListView(
                children: [

                  const SizedBox(height: 15),
                  Text("Forget Password", textAlign: TextAlign.center, style: Theme.of(context).textTheme.titleLarge,),
                  const SizedBox(height: 15),
                  Text("Check Phone Number", textAlign: TextAlign.center, style: TextStyle(color: AppColor.grey, fontSize: 15),),
                  const SizedBox(height: 15),

                  CustomTextField(
                    label: "phone number".tr,
                    icon: Icons.phone,
                    validator: (val) => validInput(10, 10, "phone number", val!),),

                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: CustomButton(
                      text: "Check",
                      onPressed: () {
                        Get.offNamed(AppRoutes.verifyCode);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
