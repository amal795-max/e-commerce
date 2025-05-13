import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:e_commerce/core/constants/appimages.dart';
import 'package:e_commerce/core/constants/approutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Splash>  {
  

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Get.offNamed(AppRoutes.signinDev);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SizedBox.expand(
        child: FadeInLeft(
            delay: Duration(milliseconds: 500),
            child: Image.asset(AppImages.splash)),
      )
    );
  }
}
