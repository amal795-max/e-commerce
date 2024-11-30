import 'package:e_commerce/core/constants/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/bottomappbar_controller.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: BottomAppBarController(),
      builder: (controller) {
        return Scaffold(
          extendBody: true,
          bottomNavigationBar: Container(
            height: 75,
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            child: ClipRRect(
              borderRadius:  BorderRadius.circular(40),
              child: BottomAppBar(
                color: AppColor.lightGrey2,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () {
                            controller.changePage(0);},
                          icon: Icon(Icons.home,color: controller.current==0?AppColor.orange:null)),
                      IconButton(
                          onPressed: () {
                            controller.changePage(1);
                          },
                          icon: Badge.count(count:6,child: Icon(Icons.shopping_cart,color: controller.current==1?AppColor.orange:null,))),
                      IconButton(
                          onPressed: () {  controller.changePage(2);},
                          icon: Icon(Icons.favorite_outlined,color: controller.current==2?AppColor.orange:null)),
                      IconButton(
                          onPressed: () {  controller.changePage(3);},
                          icon: Icon(
                              Icons.account_circle_rounded,
                              color: controller.current==3?AppColor.orange:null)),
                    ],
                  ),
                ),
              ),

          ),
          body:controller.pages.elementAt(controller.current),
        );
      }
    );
  }
}
