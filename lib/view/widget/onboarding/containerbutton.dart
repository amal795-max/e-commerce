import 'package:e_commerce/controller/onboardingcontroller.dart';
import 'package:e_commerce/core/constants/approutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/appcolor.dart';
import '../../../data/data_source/onboarding.dart';


class containerButton extends StatelessWidget {
  const containerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingController>(
      init: OnBoardingController(),
      builder: (controller) {
        return Column(
          children: [
            FilledButton(onPressed: (){
              controller.next();
              if(controller.current==onboardingList.length){
                Get.toNamed(AppRoutes.signUp);
                }
              },
                style: FilledButton.styleFrom(
                    backgroundColor: AppColor.green),
                child: Text(controller.current!=onboardingList.length-1?"Next":"finish")
            ),
            const SizedBox(height: 40),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(onboardingList.length, (i) => Container(
                      margin:const EdgeInsets.all(5),
                      height: 12,
                      width: controller.current==i ? 18 : 12,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: controller.current==i ?AppColor.orange :AppColor.lightGrey
                      )
                  ))]
            ),
          ]
        );
      }
    );
  }
}
