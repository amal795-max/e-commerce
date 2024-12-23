import 'package:e_commerce/core/constants/appcolor.dart';
import 'package:e_commerce/core/constants/approutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("my favorite".tr,style: TextStyle(color: AppColor.green),),

        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: AppColor.black,))
        ],
      ),
      body:  ListView.separated(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: (){
                Get.toNamed(AppRoutes.details);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child:  ListTile(
              leading: Container(
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.lightGrey,),
              child: Image.asset("images/lenovo.png"), ),
              title: const Text("Laptop Lenovo",style: TextStyle(fontSize: 14),),
              subtitle: const Text("500 \$"),
                trailing: IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: AppColor.orange,)),
              ))
            );
          }, separatorBuilder: (BuildContext context, int index) {
            return Divider(
              color: AppColor.lightGrey,
              thickness: 2,
            );
      },


        ),

    );
  }
}
