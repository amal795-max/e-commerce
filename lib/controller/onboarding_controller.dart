
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/services/services.dart';
class OnBoardingController extends GetxController {
  MyServices myServices =Get.find();

  PageController pageController = PageController();
  int current = 0;

  next() {
    current++;
    pageController.animateToPage(
        current, duration: const Duration(milliseconds: 700),
        curve: Curves.easeInSine);
  }

  pageChanged(int index) {
    current = index;
    update();
  }}
//@override
  // void onInit() {
  //   myServices.saveData(key: "get in", value: true);
  //   super.onInit();
  // }
//}

