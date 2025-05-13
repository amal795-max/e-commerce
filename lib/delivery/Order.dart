
import 'package:e_commerce/controller/cubit/Allorder.dart';
import 'package:e_commerce/controller/cubit/UserState.dart';
import 'package:e_commerce/delivery/orderDetails.dart';
import 'package:e_commerce/view/widget/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../core/constants/appColor.dart';
import '../view/widget/Loading.dart';

class allOrders extends StatelessWidget {
  const allOrders({super.key});

  @override
  Widget build(BuildContext context) {
   context.read<AllOrderCubit>().order();
    return BlocConsumer<AllOrderCubit, UserState>(
        listener: (context, state){
        },
        builder: (context, state) {
          return state is OrderSuccess ? Scaffold(
            appBar: AppBar(
                title: Text("Orders".tr,)),
            body: state.orders.length==0?Center(child: Text("There are no orders")): ListView.builder(
                itemCount: state.orders.length,
                itemBuilder: (context, i) {
                  return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.lightGrey2,
                      ),
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text("Order ${state.orders[i].order_id}", style: TextStyle(color: AppColor.orange)),
                            subtitle:  Text(" order on : ${state.orders[i].created_at}",style: TextStyle(fontSize: 12),),

                          ),
                          ListTile(title: Text(state.products[i].store_name)),

                       const SizedBox(height: 10),
                      
                          CustomButton(text: "Order details",
                            onPressed: (){
                            Get.to(()=>const OrderDetails(), arguments: {
                              'products': state.products,
                              'orders':state.orders[i],
                              'store name':state.products[i].store_name,
                            });
                          },),
                        const SizedBox(height: 15)

                        ],
                       ),
                  );
                }),
          ) : const Loading();
        });}
}
