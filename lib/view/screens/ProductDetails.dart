import 'package:e_commerce/controller/cubit/api/endPoints.dart';
import 'package:e_commerce/controller/cubit/cartCubit.dart';
import 'package:e_commerce/core/constants/approutes.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/view/widget/CustomButton.dart';
import 'package:e_commerce/view/widget/CustomListTile.dart';
import 'package:e_commerce/view/widget/Loading.dart';
import 'package:e_commerce/view/widget/favorite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../controller/cubit/UserState.dart';
import '../../controller/cubit/cart.dart';
import '../../controller/cubit/getProductByIdCubit.dart';
import '../../core/constants/appcolor.dart';
import '../widget/onboarding/circles.dart';

class ProductDetails extends StatefulWidget {
   const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int current = 0;
  String? selectedColor;
  String? selectedSize;

  @override
  Widget build(BuildContext context) {
    MyServices myServices=Get.find();
    return BlocConsumer<GetProductByIdCubit,UserState>(
       listener: (context, state) {
         if (state is GetProductByIdSuccess)
          if(state.available_quantity==0)
            Get.defaultDialog(title :"sorry".tr, middleText: "The quantity is out of stock".tr,
              barrierDismissible: false,confirm: TextButton(onPressed: (){Get.offNamed(AppRoutes.tabBar);},
                    child:Text("ok".tr) ));},

        builder: (context, state) {
          if (state is GetProductByIdSuccess) {
            state.sizesArray.length==1?
            myServices.saveData(key: ApiKeys.selectedProductSize,value: "."):null;
            return Scaffold(
                bottomSheet: Container(
                   padding: EdgeInsets.all(15),
                  child: BlocBuilder<CartCounter, CartState>( builder: (context, s) {
                    return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                          context.read<CartCounter>().minus(); },
                          icon: const Icon(Icons.remove_circle_outline), ),

                        Text("${s.quantity}", style: const TextStyle(fontSize: 18)),
                        IconButton(
                          onPressed: () {
                          if (s.quantity < state.available_quantity)
                            context.read<CartCounter>().plus();
                          },
                          icon: const Icon(Icons.add_circle_outline), ),

                        CustomButton(
                            text: "Add to Cart".tr,
                            onPressed: () {
                              if(!state.colors_array.containsValue(selectedColor))
                              myServices.saveData(key: ApiKeys.selectedProductColor, value:  state.colors_array.values.first);

                              if(!state.sizesArray.containsValue(selectedSize))
                              myServices.saveData(key: ApiKeys.selectedProductSize, value:  state.sizesArray.values.first);

                              context.read<CartCubit>().addToCart( s.quantity, state.id,
                            myServices.getData(key: ApiKeys.selectedProductColor),
                            myServices.getData(key: ApiKeys.selectedProductSize), );
                          Get.rawSnackbar(message: "Added ${s.quantity} items to cart".tr);
                              context.read<CartCounter>().f();

                        } )]); } ) ),


                  body: CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        floating: true,
                        title:const Text("BuyBox"),
                        titleTextStyle: TextStyle(color: AppColor.black,fontSize: 20),
                        centerTitle: true,
                        actions: [
                          BlocBuilder<CartCounter, CartState>(
                              builder: (context,state) {
                                return IconButton(onPressed: (){}, icon:Badge.count(
                                    largeSize:18, count:state.quantity,
                                    child: const Icon(Icons.shopping_cart_outlined,)
                                ) );
                              }
                          )
                        ],
                      ),
                      SliverList(
                          delegate: SliverChildListDelegate([
                        SizedBox(
                            height: 250,
                        child: PageView.builder(
                            onPageChanged: (index){
                              setState(() {
                                current = index;
                              });
                              },
                            itemCount: state.image_urls.length,
                            itemBuilder: (BuildContext context, int index) {
                    return InteractiveViewer(
                        child: Image.network(state.image_urls[index]));})),
                        const SizedBox(height: 15),

                  Circles( length: state.image_urls.length, currentIndex: current),
                          const SizedBox(height: 15),

                 ListTile(
                      title: Text(state.name),
                      subtitle: Text("${state.price} \$", style: TextStyle(color: AppColor.green, fontSize: 18)),

                   ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (state.available_quantity <= 10 &&state.available_quantity>0)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text("only ${state.available_quantity} left", style: TextStyle(color: AppColor.red),
                            ),
                          ),
                        )
                      else const SizedBox(),
                      FavoriteWidget(id: state.id),
                    ],
                  ),

                  state.colors_array.length != 1 ? ListTile(
                    title:  Text("Select color".tr),
                    subtitle: Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children: [
                        for (var entry in state.colors_array.entries)
                          InkWell(
                            onTap: () {
                              myServices.saveData(key: ApiKeys.selectedProductColor, value: entry.value);
                              setState(() {
                                selectedColor = entry.value;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(top: 6),
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: selectedColor == entry.value ? AppColor.black : AppColor.white,
                                  width: 1
                                ),
                                shape: BoxShape.circle,
                                color: Color(int.parse(entry.value.replaceFirst('#', '0xFF'))),
                              ),
                            ),
                          ),
                      ],
                    ),
                  )
                      : const SizedBox(),
                        state.sizesArray.length!=1?
                        ListTile(
                            title:Text("Select size".tr),
                            subtitle: Wrap(
                                spacing: 8,
                                runSpacing: 4,
                                children: [
                         for (var entry in state.sizesArray.entries)
                         TextButton(
                      style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                     backgroundColor: AppColor.lightGrey2,
                      foregroundColor: AppColor.black,
                          side: BorderSide( color: selectedSize == entry.value ? AppColor.black : AppColor.white,
                         )
                     ),
                   onPressed: () {
                        myServices.saveData(key: ApiKeys.selectedProductSize, value: entry.value);
                         setState(() {
                      selectedSize = entry.value;});},
                       child: Text(entry.value),)])
                        )
                            :const SizedBox(),

                  CustomListTile(title: 'Description'.tr,subtitle: state.description,),
                  SizedBox(height: 50,)

                      ]))],
                      ) );
          }  else {
            return const Loading();
          }
      });}}

