
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {

  PageController pageController = PageController();
  int current = 0;

  next() {
    current++;
    pageController.animateToPage(current, duration: const Duration(milliseconds: 700), curve: Curves.easeInSine);
  }

  pageChanged(int index) {
    current = index;
    update();
  }}


