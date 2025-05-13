import 'package:e_commerce/Core/constants/approutes.dart';
import 'package:e_commerce/controller/cubit/Allorder.dart';
import 'package:e_commerce/controller/cubit/showuser_cubit.dart';
import 'package:e_commerce/core/constants/appColor.dart';
import 'package:e_commerce/view/widget/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../core/services/PushNotificationService.dart';

class OrderDetails extends StatelessWidget {
   const OrderDetails({super.key});


  @override
  Widget build(BuildContext context) {
    NotificationsHelper notificationsHelper = NotificationsHelper();
    final Map<String, dynamic> arguments =Get.arguments;
    final products =arguments['products'];
    final orders =arguments['orders'];
    final storeName =arguments['store name'];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order details", style: TextStyle(fontSize: 18)),
        centerTitle: true,
      ),
      body: Column(
          children: [
            ListTile(tileColor: AppColor.lightGrey2, title: Text("Order ID :  # ${orders.order_id}"),subtitle: Text(storeName),),
            const SizedBox(height: 15),
            Text("Items", style: TextStyle(color: AppColor.grey, fontSize: 16),),

            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Container(
                      color: AppColor.lightGrey2,
                      margin: const EdgeInsets.all(2),
                      child: Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              title: Text(products[i].name,style: const TextStyle(fontSize: 10),),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${products[i].price} \$"),
                               Text("size : ${products[i].selected_size}",
                                    style: TextStyle(fontSize: 10),),
                                  Row(
                                    children: [
                                     Text("color : ",style: TextStyle(fontSize: 10)),
                                      products[i].selected_color!="."? Container(
                                          height: 23,width: 23,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color:  Color(int.parse(products[i].selected_color.replaceFirst("#","0xFF"))))):SizedBox(),
                                    ],
                                  )
                                  
                                ],
                              ),
                              trailing:Text("qty : ${products[i].quantity}", style:const TextStyle(fontSize: 16),),

                            ))]),
                    ),);
                },
              ),
            ),
            ListTile(title: const Text("Price"), trailing: Text("${orders.total_price} \$")),
            ListTile(title: const Text("Delivery and tax"), trailing: Text("${orders.delivery_price+1} \$")),
            const Divider(indent: 20, endIndent: 20),
            ListTile(title: const Text("Total price"), trailing: Text("${orders.total_price_with_delivery+1} \$")),
            Divider(color: AppColor.white, thickness: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(text: "Start order", onPressed: (){
                       notificationsHelper.sendNotifications(
                        title: "عزيزي العميل",
                         body: "طلبك رقم ${orders.order_id} قيد التحضير الآن"
                      );
                       context.read<AllOrderCubit>().orderState(orders.order_id,"processing");
                       Get.rawSnackbar(message:"The Order is being prepared now");}),


          CustomButton(text: "End order", onPressed: (){
      context.read<ShowUserCubit>().fetchUserByIdProfile(orders.user_id);
      Get.offNamed(AppRoutes.delivery,arguments: orders.order_id);
    }
    ),   ],
              )
          ],

      ),
    );
  }
}
