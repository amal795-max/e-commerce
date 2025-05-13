import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/appcolor.dart';

class TextIconButton extends StatelessWidget {
  final String text;
  final  void Function()? onPressed;
  const TextIconButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: TextButton.icon(
          onPressed: onPressed, icon:Icon(Icons.add,color: AppColor.orange) ,
          label: Text(text.tr,style: TextStyle(color: AppColor.orange))),
    );
  }
}
