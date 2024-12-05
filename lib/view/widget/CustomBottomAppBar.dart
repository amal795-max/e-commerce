import 'package:e_commerce/core/constants/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/bottomappbar_controller.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final List bottomIcons = [
      {IconData: Icons.home},
      {IconData: Icons.shopping_cart },
      {IconData: Icons.favorite_outlined},
      {IconData: Icons.settings},
    ];

    return GetBuilder(
      init: BottomAppBarController(),
      builder: (controller) {
        return Scaffold(
          extendBody: true,
          bottomNavigationBar: Container(
            height: 75,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),

              child: BottomAppBar(
                color: AppColor.lightGrey2,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: bottomIcons.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: IconButton(
                        onPressed: () => controller.changePage(i),
                        icon: Icon(bottomIcons[i][IconData],
                          color: controller.current == i ?AppColor.orange :null,
                        )

                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          body: controller.pages.elementAt(controller.current),
        );
      },
    );
  }
}
