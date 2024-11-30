import 'package:e_commerce/core/constants/appcolor.dart';
import 'package:e_commerce/view/screens/home.dart';
import 'package:flutter/material.dart';

class BottomAppBarCustom extends StatelessWidget {
  const BottomAppBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
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
                      onPressed: () {},
                      icon: Icon(Icons.home, )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.shopping_cart_rounded,)),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite_outlined,)),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.account_circle_rounded,)),
                ],
              ),
            ),
          ),

      ),
      body: Home(),
    );
  }
}
