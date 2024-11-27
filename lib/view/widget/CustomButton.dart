import 'package:flutter/material.dart';

import '../../core/constants/appcolor.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  const CustomButton({super.key, this.onPressed});

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
    child: const Text("Log In"), onPressed: onPressed));
  }
}
