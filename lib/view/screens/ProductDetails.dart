import 'package:e_commerce/controller/cart_controller.dart';
import 'package:e_commerce/controller/details_controller.dart';
import 'package:e_commerce/view/widget/CustomButton.dart';
import 'package:e_commerce/view/widget/onboarding/circles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../controller/cubit/UserState.dart';
import '../../controller/cubit/favoriteCubit.dart';
import '../../core/constants/appcolor.dart';

class ProductDetails extends StatelessWidget {
   ProductDetails({super.key});

  final List images = [
    {'image': "images/laptop3.png"},
    {'image': "images/laptp2.png"},
  ];

  @override
  Widget build(BuildContext context) {
   Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        title:  Text("Product Details".tr),
        centerTitle: true,
        titleTextStyle: TextStyle(fontSize: 18, color: AppColor.black),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined),),
        ],
      ),

      body: GetBuilder<DetailsController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 250,
                    child: PageView.builder(
                      onPageChanged: (index){
                        controller.pageChanged(index);
                      },
                      itemCount: images.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InteractiveViewer(
                  child: Image.asset(images[index]['image']));})),


                Circles( length: images.length, currentIndex: controller.current,)

                ,const SizedBox(height: 20),

                 ListTile(
                  title:const Text("Lenovo LOQ 15A"),
                  subtitle: const Text("by lenovo factory"),
                  trailing:  BlocConsumer<FavoriteCubit, UserState>(
                      listener: (context, state){
                      if(state is AddToFavoriteSuccess){
                        Get.snackbar("", "product added to favorite successfully");}
                      },
                      builder: (context, state) {
                        return IconButton(
                            onPressed: () {
                              context.read<FavoriteCubit>().addToFavorite();},
                              icon: Icon(Icons.favorite, size: 30,
                              color: AppColor.orange,));
                      }  )),


                const SizedBox(height: 20),

                // Product Price
                Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text("580.00 \$", style: TextStyle(color: AppColor.green, fontSize: 18))),

                const SizedBox(height: 20),

                 ListTile(
                  title: Text("Description".tr),
                  subtitle: Text(
                    "The Lenovo LOQ 15AHP9 is a gaming laptop launched in January 2024, featuring a 15.6-inch "
                        "IPS LCD display with a resolution of 1920 x 1080 pixels and a refresh rate of 144 Hz.",
                    style: TextStyle(color: AppColor.grey)),
                ),
                const SizedBox(height: 20),

                GetBuilder<CartController>(
                  builder: (controller) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(onPressed: () {
                          controller.minus();
                          controller.remove(Text("data"));},
                          icon: const Icon(Icons.remove_circle_outline),),

                        Text("${controller.quantity}", style: const TextStyle(fontSize: 18)),


                        IconButton(onPressed: () {
                          controller.plus();
                         controller.add(Text("data"));
                          },
                          icon: const Icon(Icons.add_circle_outline),),

                        CustomButton(
                          text: "Add to Cart".tr,
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Added ${controller.quantity} items to cart"),),
                            );
                          },
                        ),
                      ],
                    );
                  }
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
