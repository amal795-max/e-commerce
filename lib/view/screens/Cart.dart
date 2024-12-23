import 'package:e_commerce/controller/cart_controller.dart';
import 'package:e_commerce/core/constants/appcolor.dart';
import 'package:e_commerce/view/widget/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/CustomListTile.dart';
import '../widget/Text_iconButton.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("view cart".tr,style: TextStyle(color: AppColor.green),),
        actions: [
          GetBuilder<CartController>(
            init: CartController(),
            builder: (controller) {
              return IconButton(onPressed: () {
                Get.defaultDialog(
                  title: "Alert !",
                  titleStyle: TextStyle(color: AppColor.green)
                  ,middleText: "are you sure  you want to delete all the entire cart ?",
                  textConfirm: "Confirm",
                 buttonColor: AppColor.green,
                 onCancel: ()=>Get.back(),
                  textCancel: "Cancel",
                  onConfirm: (){controller.removeAll();
                  Get.back();}

                );
              }, icon: const Icon(Icons.delete));
            }
          ),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 15),
          ListTile(
            tileColor: AppColor.lightGrey2,
            leading: Text("delivery to",style: TextStyle(color: AppColor.grey),),
            title: Text("My address",style: TextStyle(color: AppColor.black),),
          ),
          const SizedBox(height: 15),

          GetBuilder<CartController>(
              init: CartController(),
              builder: (controller) {
                  return  ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: AppColor.lightGrey2,
                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),bottomRight:  Radius.circular(20)),
                           ),
                        child: Row(
                          children: [
                            Expanded(
                              child: ListTile(
                                leading: Image.asset("images/lenovo.png"),
                                title:const Text("laptop",style:  TextStyle(fontSize: 14),),
                                subtitle:const Text("500 \$"),
                              ),
                            ),
                            IconButton(onPressed: () {}, icon: Icon(Icons.remove_circle_outline_sharp, color: AppColor.orange,),),
                            const Text("1", style: TextStyle(fontSize: 16),),
                            IconButton(onPressed: () {}, icon: Icon(Icons.add_circle_outlined, color: AppColor.orange)),
                          ],),
                      ),);},
                  );
                        }
                            ),
                 const TextIconButton(text: 'add more'),
                 Divider(
                   thickness: 12,
                  color: AppColor.lightGrey2,
                ),
                 ListTile(
                  title: Text("total".tr),
                  trailing: const Text("81.80 \$"),
                ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
            child: CustomButton(text: "next".tr,onPressed: (){
              Get.bottomSheet(
                  backgroundColor: AppColor.white,
                  Column(
                    children:
                        [
                      const SizedBox(height: 15),
                      const CustomListTile(
                        title:"item count",
                        trailing: Text("4"),
                      ) ,
                      const Divider(indent: 15,endIndent: 15,)
                      ,    const CustomListTile(
                        title: "delivery",
                        trailing: Text("4.90\$"),
                      )
                      ,const Divider(indent: 15,endIndent: 15,)  ,

                      const CustomListTile(
                        title:"tax",
                        trailing: Text("0.90\$"),
                      )
                      ,const Divider(indent: 15,endIndent: 15,)
                      ,const CustomListTile(
                        title: "total price",
                        trailing: Text("92.90\$"),
                      ),
                      const SizedBox(height:20),

                      CustomButton(text: 'Confirm order'.tr,onPressed: (){},)

                    ],
                  ));
            }
          ))

      ],


      )
    );
  }
}