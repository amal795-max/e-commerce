import 'package:flutter/material.dart';

import '../../core/constants/appcolor.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding:const EdgeInsets.symmetric(horizontal: 30),
    child: ElevatedButton(
    style: ElevatedButton.styleFrom(
    backgroundColor: AppColor.orange,
    foregroundColor: AppColor.white
    ),
    child: const Text("Log In"), onPressed: (){}));
  }
}
