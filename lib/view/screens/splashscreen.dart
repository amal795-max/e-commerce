import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:e_commerce/core/constants/appcolor.dart';
import 'package:e_commerce/core/constants/approutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _colorAnimation = ColorTween(
      begin:AppColor.deepOrange,
      end: AppColor.green,
    ).animate(_controller);

    Timer(Duration(seconds: 4), () {
      Get.offNamed(AppRoutes.onboarding);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _colorAnimation,
            builder: (context, child) {
              return Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [_colorAnimation.value!, AppColor.white],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              );
            },
          ),
          Center(
         child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeInRight(
                      duration: Duration(milliseconds: 800),
                      delay: Duration(milliseconds: 300),
                      child: Image.asset("images/store.png")),
            FadeInRight(
              duration: Duration(milliseconds: 800),
              delay: Duration(milliseconds: 800),
                 child:  Text("Welcome to our app ..",  style: TextStyle(
                   fontSize: 20,
                   fontWeight: FontWeight.bold,))),

                ],
              ),

          ),
        ],
      ),
    );
  }
}
