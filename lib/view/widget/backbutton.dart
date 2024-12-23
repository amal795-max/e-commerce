import 'package:flutter/material.dart';

import '../../core/constants/appColor.dart';

class CustomBackButton extends StatelessWidget {
 final void Function()? onPressed;
  const CustomBackButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin:const EdgeInsets.symmetric(vertical: 20),
        height: 45,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
            color: AppColor.lightGrey,
        ),
        child: IconButton(onPressed: onPressed
      , icon:const Icon(Icons.arrow_back_ios_new),color: AppColor.orange,),
      ),
    );
  }
}
