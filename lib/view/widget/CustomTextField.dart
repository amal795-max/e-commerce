import 'package:e_commerce/core/constants/appcolor.dart';
import 'package:e_commerce/core/functions/visibility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomTextField extends StatelessWidget {
 final IconData icon;
  final String label;
 final TextEditingController? controller1;
 final String? Function(String?)? validator;
 final void Function()? onTap;
  const CustomTextField({super.key, required this.label, required this.icon, this.validator, this.controller1, this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 7),
      child: GetBuilder<visibility>(
        init: visibility(),
        builder: (controller) {
          return TextFormField(
            onTap:onTap ,
            style: TextStyle(color: AppColor.black),
            controller: controller1,
              validator:validator ,
              obscureText:icon==Icons.lock?controller.obs:false,
              cursorColor: AppColor.black,
              cursorOpacityAnimates: true,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                prefixIcon: Icon(icon),
                prefixIconColor: AppColor.orange,
                suffixIcon:label=="Password"||label=="New password"? IconButton(onPressed: (){
                controller.obscureText();
                }, icon:  controller.obs?const Icon(Icons.visibility_off):const Icon(Icons.visibility) ):null,
                filled: true,
                fillColor: AppColor.lightGrey2,
                focusedErrorBorder:OutlineInputBorder(
                 borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(25)) ,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(25)
                ), focusedBorder:OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(25),
              ),
                errorBorder:OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(25)) ,
                labelText: label ,
                labelStyle: const TextStyle(fontSize: 12),
                floatingLabelStyle:  TextStyle(fontSize: 15, color: AppColor.orange), // For floating label


              ),
          );
        }
      ),
    );
  }
}
