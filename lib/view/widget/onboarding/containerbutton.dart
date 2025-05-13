import 'package:e_commerce/controller/cubit/api/endPoints.dart';
import 'package:e_commerce/controller/onboarding_controller.dart';
import 'package:e_commerce/core/constants/approutes.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/view/widget/onboarding/circles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/appcolor.dart';
import '../../../data/data_source/onboarding.dart';


class containerButton extends StatelessWidget {
  const containerButton({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices=Get.find();
    return GetBuilder<OnBoardingController>(
      init: OnBoardingController(),
      builder: (controller) {
        return Column(
          children: [
            FilledButton(
                onPressed: (){
              controller.next();
              myServices.saveData(key: ApiKeys.isFirstTime, value: true);
              if(controller.current==onboardingList.length){
                Get.offNamed(AppRoutes.signUp);}},
                style: FilledButton.styleFrom(
                    backgroundColor: AppColor.deepOrange),
                child: Text(controller.current!=onboardingList.length-1?"next".tr:"finish".tr)
            ),
            const SizedBox(height: 40),

           Circles(length: onboardingList.length, currentIndex: controller.current)
          ]
        );
      }
    );
  }
}
