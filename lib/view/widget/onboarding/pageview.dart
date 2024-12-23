import 'package:e_commerce/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/data_source/onboarding.dart';

class pageView extends StatelessWidget {
  const pageView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingController>(
      init: OnBoardingController(),
      builder: (controller) {
        return PageView.builder(
          controller: controller.pageController,
          onPageChanged: (index){
            controller.pageChanged(index);
          },
          itemCount: onboardingList.length,
          itemBuilder: (context, index) {
            return Column(
                children: [
                  Image.asset(onboardingList[index].image),
                  Text(
                    onboardingList[index].title,
                    style: const TextStyle(fontSize: 24, ),
                    textAlign: TextAlign.center,

                  ),
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: Text(
                      onboardingList[index].body,
                      style: const TextStyle(fontSize: 15, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ),


                ])
            ;},
        );
      }
    );
  }
}
