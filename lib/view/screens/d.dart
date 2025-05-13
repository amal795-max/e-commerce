import 'package:e_commerce/core/constants/appColor.dart';
import 'package:e_commerce/view/widget/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/BottomSheet.dart';

class Details extends StatelessWidget {
  const Details({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Order details", style: TextStyle(fontSize: 18)),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
          IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
        ],
      ),
      body: Column(
        children: [
          ListTile(tileColor: AppColor.lightGrey2, title: Text("Order ID :  #"),subtitle: Text("storeName"),),
          const SizedBox(height: 15),
          Text("Items", style: TextStyle(color: AppColor.grey, fontSize: 16),),

          Expanded(
            child: ListView.builder(
              itemCount: 5,
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
                                title: Text("products[i].name",style: const TextStyle(fontSize: 10),),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(""),
                                    Text("size :",
                                      style: TextStyle(fontSize: 10),),
                                    Row(
                                      children: [
                                        Text("color :  ",style: TextStyle(fontSize: 10),),
                                        Container(
                                            height: 23,width: 23,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                )),
                                      ],
                                    )

                                  ],
                                ),
                                trailing:Text("qty :", style:const TextStyle(fontSize: 16),),

                              ))]),
                  ),);
              },
            ),
          ),
      CustomButton(onPressed: (){
        Get.bottomSheet(
            backgroundColor: AppColor.white,
            CustomBottomSheet()

        );
      }, text: 'next'.tr,)

        ],

      ),
    );
  }
}
