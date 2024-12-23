import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/appcolor.dart';

class CustomExpansionTile extends StatelessWidget {
  final IconData iconData;
  final IconData trailing;
  final String subtitle;
  final String title;
  final String hintText;
  final TextEditingController? controller;
  const CustomExpansionTile({super.key, required this.iconData, required this.trailing, required this.subtitle, required this.title, required this.hintText, this.controller});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(title.tr),
      leading: Icon(iconData,color: AppColor.orange,),
      trailing:  Icon(trailing,color: AppColor.black),
      subtitle:  Text(subtitle),
      children:[
        TextField(
          controller: controller,
          cursorColor: AppColor.orange,
          decoration:  InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none
            ),
            hintText:hintText.tr,
            hintStyle: TextStyle(fontSize: 12),
          ),
        )],
    );
  }
}
