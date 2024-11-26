import 'package:e_commerce/core/constants/appcolor.dart';
import 'package:e_commerce/core/functions/visibility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomTextField extends StatelessWidget {
 final IconData icon;
  final String label;
  final String Function(String?)? validator;
  const CustomTextField({super.key, required this.label, required this.icon, this.validator});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<visibility>(
      init: visibility(),
      builder: (controller) {
        return Container(
          height: 60,
          padding:const EdgeInsets.symmetric(horizontal: 30),
          child: TextFormField(
            validator:validator ,
            obscureText:icon==Icons.lock?controller.obs:false,
            cursorColor: AppColor.black,
            cursorOpacityAnimates: true,
            decoration: InputDecoration(
              prefixIcon: Icon(icon),
              prefixIconColor: AppColor.orange,
              suffixIcon:icon==Icons.lock? IconButton(onPressed: (){
              controller.obscureText();
              }, icon:  controller.obs?const Icon(Icons.visibility_off):const Icon(Icons.visibility) ):null,
              filled: true,
              fillColor: Colors.grey.shade200,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(25)
              ), focusedBorder:OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(25),
            ),
              labelText: label ,
              labelStyle: const TextStyle(fontSize: 12),
              floatingLabelStyle:  TextStyle(fontSize: 15, color: AppColor.orange), // For floating label


            ),
          ),
        );
      }
    );
  }
}
