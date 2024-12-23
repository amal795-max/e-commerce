import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/view/widget/CustomListTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../controller/cubit/UserState.dart';
import '../../controller/cubit/api/endPoints.dart';
import '../../controller/cubit/productCubit.dart';
import '../widget/CustomProducts.dart';
import '../widget/CustomTextField.dart';
import '../widget/Loading.dart';
class StoresProduct extends StatelessWidget {
  const StoresProduct({super.key,});

  @override
  Widget build(BuildContext context) {
    MyServices myServices =Get.find();
    Map<String, List> groupedProducts = {};
    context.read<ProductCubit>().product();

    return BlocConsumer<ProductCubit,UserState>(
    listener: (context, state) {
      if(state is GetProductSuccess){
        for (var product in state.products) {
          if (!groupedProducts.containsKey(product.typeText)) {
            groupedProducts[product.typeText] = [];
          }
          groupedProducts[product.typeText]!.add(product);
        }}},
    builder: (context,state) {
    return state is GetProductSuccess ? Scaffold(
      body: CustomScrollView(
        slivers: [
           SliverAppBar(
          title: Text(state.storeName),
      actions: [IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart_outlined))],
      centerTitle: true,
          floating: true
          ),
          SliverList(
              delegate: SliverChildListDelegate(
              [
             const CustomTextField(label: "Search on product", icon: Icons.search),

        Column(
        children: groupedProducts.entries.map((entry) {
        return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          CustomListTile(title: "${entry.key} "),

          SizedBox(
            height:200,
           child: ListView.builder(
            scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: entry.value.length,
          itemBuilder: (context, index) {
          final product = entry.value[index];
          return CustomProducts(
            onTap: (){
              myServices.saveData(key: ApiKeys.selectedProductId,value:product.id);
            },
            image: product.imageUrls.first,
            price: "${product.price} \$",
            name: product.name,
          );
          })),
        ],);
        }).toList(),
        )
              ]))])):const Loading();

  });}
}
