import 'package:e_commerce/controller/cubit/UserState.dart';
import 'package:e_commerce/controller/cubit/cartCubit.dart';
import 'package:e_commerce/core/constants/appcolor.dart';
import 'package:e_commerce/core/constants/approutes.dart';
import 'package:e_commerce/view/widget/CustomButton.dart';
import 'package:e_commerce/view/widget/Loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../widget/BottomSheet.dart';
import '../widget/CustomListTile.dart';
import '../widget/Text_iconButton.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CartCubit>().showCart();
    return BlocConsumer<CartCubit,UserState>(
        listener: (context,state){
          if(state is ConfirmSuccess)
            Get.snackbar("done", "Order Confirmed");
        },
        builder: (context,state){
    if (state is ShowCartSuccess) {
      return Scaffold(
          appBar: AppBar(
          title: Text("view cart".tr),),
      body: ListView(
      children: [
      const SizedBox(height: 10),
         ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.cart.length,
                  itemBuilder: (BuildContext context, int index) {
                    final cart=state.cart[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: SizedBox(
                        child: Row(
                          children: [
                            Expanded(
                              child: ListTile(
                                leading: Image.network(cart.image_urls[0]),

                                title: Text(cart.name,style: const TextStyle(fontSize: 10),),

                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                         Text("${cart.price} \$"),
                cart.selected_size!="."?Text("size : ${cart.selected_size}", style: TextStyle(fontSize: 10),):SizedBox(),


                            cart.selected_color!="." ?Row(
                              children: [
                                Text("color : ",style: TextStyle(fontSize: 10),),
                              Container(
                                height: 23,width: 23,
                                 decoration: BoxDecoration(
                                 shape: BoxShape.circle,
                                 color: Color(int.parse(cart.selected_color.replaceFirst('#', '0xFF')))))
                                      ],
                                    ):const SizedBox()
                                  ],
                                ),

                              ),
                            ),
                            Text("${cart.quantity}", style:const TextStyle(fontSize: 16),),

                            IconButton(
                         icon: Icon(Icons.delete_outlined, color: AppColor.orange),
                          onPressed: () {
                         context.read<CartCubit>().deleteFromCart(cart.id);
                         context.read<CartCubit>().showCart();
                       }),


                          ],),
                      ),);},
           separatorBuilder: (BuildContext context, int index) {
                    return Divider(endIndent: 20,indent: 20,);
         },
                  ),
                  TextIconButton(text:'add more',onPressed: (){Get.offNamed(AppRoutes.customBottom);}),

                 Divider(thickness: 12, color: AppColor.lightGrey2,),
                 CustomListTile(
                  title:"total".tr,
                  trailing: Text("${state.total_price} \$"),
                ),
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              child: CustomButton(text: "next".tr,onPressed: (){
              Get.bottomSheet(
                  backgroundColor: AppColor.white,
                  CustomBottomSheet()

              );
            }
          ))
      ]
      )
    );}
    else if (state is ShowCartFailure)
      return Scaffold(
          body:
          Container(
          color: AppColor.white,
          child: Center(child: Text(state.message))));
    else
      return const Loading();
  }); }
}