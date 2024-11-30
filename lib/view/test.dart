import 'package:e_commerce/core/constants/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class test extends StatelessWidget {
  const test({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: AppColor.white,
      padding: EdgeInsets.all(80),
      child: Lottie.asset("lottie/loading.json"),
    );
  }
}
