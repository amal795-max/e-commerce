import 'package:flutter/material.dart';

import '../../core/constants/appcolor.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const CustomButton({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {

    return Container(
        width: double.infinity,
        padding:const EdgeInsets.symmetric(horizontal: 20),
    child: ElevatedButton(
    style: ElevatedButton.styleFrom(
    backgroundColor: AppColor.orange,
    foregroundColor: AppColor.white
    ),
    child: Text(text), onPressed: onPressed));
  }
}
