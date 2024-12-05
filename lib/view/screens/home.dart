import 'package:e_commerce/view/screens/ProductDetails.dart';
import 'package:e_commerce/view/widget/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/binding.dart';
import '../../core/constants/appcolor.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            foregroundColor: AppColor.orange,
            title: const Text("Hi.UserName"),
            actions: [
              Container(
                padding: const EdgeInsets.only(right: 10),
                height: 70,
                width: 70,
                child:  CircleAvatar(
                  backgroundColor: AppColor.lightGrey,
                ),
              ),
            ],
            floating: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15,horizontal: 12),
                  child: CustomTextField(label: "Search on store ..", icon: Icons.search),
                ),
                ListTile(leading: const Text("Most Popular ", style: TextStyle(fontSize: 18))),

            SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap:(){Get.to(() =>const ProductDetails(), binding: Binding());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.lightGrey2,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.lightGrey,
                            blurRadius: 4,
                            spreadRadius: 1.3,
                            offset: const Offset(6, -4),
                          )]),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7,vertical: 3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("images/lenovo.png", height: 130, width: 140,),
                             Text("Lenovo LOQ 15A ", style: TextStyle(fontSize: 12,color: AppColor.black),),
                            Text(" 720 \$", style: TextStyle(color: AppColor.green)),
                          ])),),
                  ),
                );
              }
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Text("Our Stores ",style: TextStyle(fontSize: 18),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GridView.builder(
              physics:const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount: 2, childAspectRatio: 0.8,),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                  color: AppColor.lightOrange,
                  borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            Image.asset("images/store.png",height: 140,width: 140,),
                            Text("Laptops",style: TextStyle(color: AppColor.black),),
                            TextButton.icon(
                                onPressed: (){
                                }, icon: Icon(Icons.pin_drop_outlined,color: AppColor.orange,),
                              label: Text("Damascus",style: TextStyle(color: AppColor.orange)),)

                          ],
                        ),

                    );
                },

            ),
          ),
        ],
      ),
    )]));
  }
}
