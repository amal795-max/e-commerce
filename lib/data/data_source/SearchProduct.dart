import 'package:e_commerce/core/constants/approutes.dart';
import 'package:e_commerce/view/widget/Loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../controller/cubit/UserState.dart';
import '../../controller/cubit/getProductByIdCubit.dart';
import '../../controller/cubit/searchCubit.dart';
import '../../core/services/services.dart';

class SearchProduct extends SearchDelegate{
  MyServices myServices=Get.find();

  @override
  List<Widget>? buildActions(BuildContext context) {
  return [
    CloseButton(onPressed: (){query='';})
  ]
  ;}

  @override
  Widget? buildLeading(BuildContext context) {
   return const BackButton();
  }

  @override
  Widget buildResults(BuildContext context) {
    if(query.isEmpty)
      return SizedBox();
    context.read<SearchCubit>().searchProduct(query);
    return BlocConsumer<SearchCubit, UserState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is SearchProductSuccess) {
          if (state.searchProducts.isEmpty) {
            return  Center(child: Text("No Products found".tr, style: TextStyle(fontSize: 15)));
          }
          return ListView.separated(
            padding: const EdgeInsets.all(10),
            itemCount: state.searchProducts.length,
            itemBuilder: (BuildContext context, int index) {
              final products=state.searchProducts[index];
              return ListTile(
                onTap: (){
                  context.read<GetProductByIdCubit>().getProduct(products.id);
                  Get.offNamed(AppRoutes.productDetails);
                },
                leading: Image.network(products.image_urls[0]),
                title:Text(products.name),
                subtitle: Text(products.price),
              );
            }, separatorBuilder: (BuildContext context, int index) {
              return const Divider(indent: 15,endIndent: 15);
          },
          );
        } else if (state is SearchProductLoading) {
          return const Loading();
        } else {
          return  Center(child: Text("Search to find products".tr, style: TextStyle(fontSize: 15)));
        }
      },
    );}

  @override
  Widget buildSuggestions(BuildContext context) {
   return SizedBox();
  }
}