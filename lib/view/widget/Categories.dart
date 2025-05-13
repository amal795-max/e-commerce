import 'package:flutter/material.dart';

import '../../core/constants/appColor.dart';

class Categories extends StatelessWidget {
  final IconData iconData;
  const Categories({super.key, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding:const EdgeInsets.all(8),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5),
          color: AppColor.orange,boxShadow:[
        BoxShadow(
          color: AppColor.lightGrey,
          offset: Offset(0, 10),
          blurRadius: 7,

        )
      ]
      ),
        child: IconButton(onPressed: (){}, icon: Icon(iconData,color: AppColor.white,))
    );
  }
}
