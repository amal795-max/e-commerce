// ignore_for_file: unused_import

import 'package:e_commerce/controller/cubit/api/endPoints.dart';
import 'package:e_commerce/controller/cubit/searchCubit.dart';
import 'package:e_commerce/core/class/MostPopular.dart';
import 'package:e_commerce/core/constants/approutes.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/data_source/mostPobular.dart';
import 'package:e_commerce/view/screens/tabbar.dart';
import 'package:e_commerce/view/widget/Categories.dart';
import 'package:e_commerce/view/widget/CustomProducts.dart';
import 'package:e_commerce/view/widget/CustomStores.dart';
import 'package:e_commerce/view/widget/CustomTextField.dart';
import 'package:e_commerce/view/widget/Loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../controller/cubit/AllStoresCubit.dart';
import '../../controller/cubit/UserState.dart';
import '../../controller/cubit/getProductByIdCubit.dart';
import '../../core/constants/appcolor.dart';
import '../../data/data_source/SearchStore.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    context.read<AllStoresCubit>().getAllStores();
    MyServices myServices=Get.find();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title:  Text("Hello.${myServices.getData(key: ApiKeys.first_name)}".tr,
              style: TextStyle(fontSize: 14,color: AppColor.grey),),
            actions: [
             Container(
               margin: const EdgeInsets.symmetric(horizontal: 15),
               decoration: BoxDecoration(
                 color: AppColor.lightGrey,
               shape: BoxShape.circle),
                 child: IconButton(onPressed: (){
                   Get.toNamed(AppRoutes.order);
                   }, icon: const Icon(Icons.notifications_active_rounded)))
            ],
            floating: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
    [
       Text("Let's find your best system".tr,style: TextStyle(color: AppColor.black,fontSize: 17),),

               const SizedBox(height: 10),
               CustomTextField(label: "Search".tr, icon: Icons.search,
               onTap: (){
                 showSearch(context: context, delegate: SearchStore(context));}),
                Padding(padding: const EdgeInsets.all(15), child: Text("most popular".tr, style:const TextStyle(fontSize: 15)),),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: mostPopular.length,
                scrollDirection: Axis.horizontal,
                  itemBuilder:(context,i){
                    return CustomProducts(
                      onTap: (){
                        Get.toNamed(AppRoutes.productDetails);
                        context.read<GetProductByIdCubit>().getProduct(mostPopular[i].id);

                        },
                      image:mostPopular[i].image,
                      name:mostPopular[i].name,
                      price: mostPopular[i].price);
                  }),
            ),
      const SizedBox(height: 20),

      Padding(padding: const EdgeInsets.symmetric(horizontal: 15), child: Text("our stores".tr,style:const TextStyle(fontSize: 15),),),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: BlocConsumer<AllStoresCubit, UserState>(
              listener: (context, state){
              },
              builder: (context, state) {
                return state is GetAllStoresSuccess ? ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:state.stores.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CustomStores(
                      onTap: (){
                        myServices.saveData(key: ApiKeys.selectedStoreId,value:state.stores[index].id);
                        Get.to(()=>const TabBarPage());},
                        imageData: "http://192.168.104.85:8000/StoreImages/"+state.stores[index].store_image,
                        storeName: state.stores[index].name,
                        description: state.stores[index].description);

                    }):const Loading() ;
              }),
          )]),
    )]));
  }
}
