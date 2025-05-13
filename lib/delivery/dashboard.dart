import 'package:animate_do/animate_do.dart';
import 'package:e_commerce/controller/cubit/UserState.dart';
import 'package:e_commerce/core/constants/appimages.dart';
import 'package:e_commerce/core/constants/approutes.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/view/widget/CustomButton.dart';
import 'package:e_commerce/view/widget/Loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../Core/constants/appcolor.dart';
import '../controller/cubit/api/endPoints.dart';
import '../controller/cubit/logoutcubit.dart';

class dashboard extends StatelessWidget {
  const dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    return  Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
          title:  FadeInLeftBig(
            child: Text("Hello.${myServices.getData(key: ApiKeys.name)}".tr,
              style: TextStyle(fontSize: 14,color: AppColor.grey),),
          ),
        actions: [
          Container(
              margin: const EdgeInsets.only(right: 16,top: 10),
              decoration: BoxDecoration(
                  color: AppColor.lightGrey,
                  shape: BoxShape.circle),
              child: BlocConsumer<LogoutCubit,UserState>(
                listener: (context,state) {
                  if(state is LogOutSuccess){
                    Get.snackbar("done", state.message);
                    Get.offAllNamed(AppRoutes.signinDev);
                  }
                },
                builder: (context,state) {
                  return IconButton(onPressed: () {
                  Get.defaultDialog(
                      title: "Alert".tr,
                      middleText: "Are you sure you want to logout ?".tr,
                      confirm: TextButton(
                        onPressed: () {
                          context.read<LogoutCubit>().logoutDriver();
                        },
                        child: Text("Yes".tr,style: TextStyle(color: AppColor.orange),),
                      ),
                      cancel: TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text("No".tr,style: TextStyle(color: AppColor.orange),),
                      ),
                    );
                  },
                      icon: const Icon(Icons.logout_outlined));
                }   ))
        ],
        ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInLeftBig(
            delay: Duration(milliseconds: 700),
              child: Text("  Welcome to the driver\n   dashboard".tr,
                style: TextStyle(color: AppColor.black,fontSize: 17),)),
          SizedBox(height: 30,),

          FadeInLeftBig(
              delay: Duration(milliseconds: 1100),

              child: Image.asset(AppImages.dashboard)),
       SizedBox(height: 50,),
          FadeInLeftBig(
            delay: Duration(milliseconds: 1500),

            child: Center(child: CustomButton(text: "Show Orders",onPressed:(){
              Get.toNamed(AppRoutes.allOrders);
            } ,)),
          )

        ],

      ),
    );
  }
}
