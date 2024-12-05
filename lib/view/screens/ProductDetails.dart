import 'package:e_commerce/controller/detailscontroller.dart';
import 'package:e_commerce/view/widget/onboarding/circles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/appcolor.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final List images = [
    {'image': "images/laptop3.png"},
    {'image': "images/laptp2.png"},
  ];

  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
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

                // Product Title
                 ListTile(
                  title:const Text("Lenovo LOQ 15A"),
                  subtitle: const Text("by lenovo factory"),
                  trailing: IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border,size: 30,color: AppColor.orange,)),
                ),
                const SizedBox(height: 20),

                // Product Price
                Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text("580.00 \$", style: TextStyle(color: AppColor.green, fontSize: 18))),

                const SizedBox(height: 20),

                 ListTile(
                  title:const Text("Description"),
                  subtitle: Text(
                    "The Lenovo LOQ 15AHP9 is a gaming laptop launched in January 2024, featuring a 15.6-inch "
                        "IPS LCD display with a resolution of 1920 x 1080 pixels and a refresh rate of 144 Hz.",
                    style: TextStyle(color: AppColor.grey),
                  ),
                ),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (quantity > 1) quantity--;
                        });
                      },
                      icon: const Icon(Icons.remove_circle_outline),
                    ),
                    Text(
                      "$quantity",
                      style: const TextStyle(fontSize: 18),
                    ),
                    IconButton(onPressed: () {setState(() {quantity++;});
                      },
                      icon: const Icon(Icons.add_circle_outline),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.orange,
                        foregroundColor: AppColor.white,
                      ),
                      child: const Text("Add to Cart"),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Added $quantity items to cart"),),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
