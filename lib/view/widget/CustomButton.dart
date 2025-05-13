import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/appcolor.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const CustomButton({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
     return SizedBox(
       child: ElevatedButton(
        style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.orange,
        foregroundColor: AppColor.white
        ),
        child: Text(text.tr), onPressed: onPressed
           ),
     );
  }
}

