import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/appColor.dart';

class BottomAuth extends StatelessWidget {
  final String text;
  final String data;
  final void Function()? onPressed;
  const BottomAuth({super.key, required this.text, required this.data, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text.tr, style: TextStyle(color: AppColor.black)),
        TextButton(
            onPressed: onPressed,
            child: Text(
             data.tr,
              style:
              TextStyle(color: AppColor.orange),
            )),],
    );
  }
}
