import 'package:e_commerce/controller/cubit/api/endPoints.dart';
import 'package:e_commerce/core/constants/approutes.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/view/widget/CustomProducts.dart';
import 'package:e_commerce/view/widget/CustomStores.dart';
import 'package:e_commerce/view/widget/CustomTextField.dart';
import 'package:e_commerce/view/widget/Loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../controller/cubit/AllStoresCubit.dart';
import '../../controller/cubit/UserState.dart';
import '../../core/constants/appcolor.dart';
import '../../data/data_source/Search.dart';
import 'Products.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    context.read<AllStoresCubit>().getAllStores();
    List stores=[];
    MyServices myServices=Get.find();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            foregroundColor: AppColor.orange,
            title:  Text("Hi.${myServices.getData(key: ApiKeys.first_name)+" "+myServices.getData(key: ApiKeys.last_name)}"),
            actions: [
              GestureDetector(
                onTap:(){
                  Get.toNamed(AppRoutes.profile);},
                child: Container(
                  padding: const EdgeInsets.only(right: 10),
                  height: 70,
                  width: 70,
                  child:  CircleAvatar(
                    backgroundColor: AppColor.lightGrey,
                    backgroundImage: NetworkImage(myServices.getData(key: ApiKeys.image_url)),
                  ),
                ),
              ),
            ],
            floating: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
               CustomTextField(label: "Search".tr, icon: Icons.search,
               onTap: (){
                 context.read<AllStoresCubit>().getAllStores();
                 showSearch(context: context, delegate: search());}),
            ListTile(leading:  Text("most popular".tr, style:const TextStyle(fontSize: 18))),

             // CustomProducts(itemCount: 5, image: "images/lenovo.png", name: "lenovo 15AQ", price: "600 \$"),
             const SizedBox(height: 10),
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Text("our stores".tr,style:const TextStyle(fontSize: 18),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
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
                        myServices.saveData(key: ApiKeys.selectedStoreId,value:state.stores[index].id); // Save selected store ID
                        Get.toNamed(AppRoutes.stores);},

                        imageData: "http://192.168.1.112:8000/StoreImages/"+state.stores[index].store_image,
                        storeName: state.stores[index].name,
                        description: state.stores[index].description);
                    },
                ):const Loading() ;
              }),
          )],
      ),
    )]));
  }
}
