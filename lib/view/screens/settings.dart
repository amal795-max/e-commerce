import 'package:e_commerce/controller/cubit/logoutcubit.dart';
import 'package:e_commerce/core/constants/appcolor.dart';
import 'package:e_commerce/core/localization/local.dart';
import 'package:e_commerce/view/widget/CustomListTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../controller/cubit/UserState.dart';
import '../../controller/cubit/showuser_cubit.dart';
import '../../controller/darkmode_controller.dart';
import '../../core/constants/approutes.dart';
import '../widget/changeLanguage.dart';

class Settings extends GetView<Localization> {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Dark());
    return Scaffold(
      appBar: AppBar(
        title:  Text("Settings".tr)),

       body: ListView(
            children: [
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 20),
               child: CustomListTile(
                 onTap: (){
                   Get.toNamed(AppRoutes.profile);
                   context.read<ShowUserCubit>().fetchUserProfile();

                 },
                 title: "my account".tr,
                 iconData:Icons.account_circle,
                 trailing:const Icon(Icons.edit),
               ),
             )
              ,
              const Divider(indent: 25, endIndent: 25,),
              SizedBox(height: 10,),
              ChangeLanguage(),
               SizedBox(height: 10,),
               CustomListTile(
                title: "Terms of use".tr,
                iconData: Icons.privacy_tip_rounded,
                trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                 onTap: (){Get.toNamed(AppRoutes.terms);},
              ),
              SizedBox(height: 10,),

              CustomListTile(
                title: "Privacy Policy".tr,
                iconData: Icons.help_outline,
                trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                onTap: () {
                  Get.toNamed(AppRoutes.privacy);
                },
              ),
              SizedBox(height: 10,),

               ExpansionTile(
                title: Text("Get Help".tr),
                leading:Icon( Icons.live_help,color: AppColor.orange,),
                 children: [
                Text("contact us on number".tr,style: TextStyle(color:AppColor.orange),)
              ],),

              SizedBox(height: 10,),

              GetBuilder<Dark>(
                builder: (controller) {
                  return CustomListTile(
                    title: "change mode".tr,
                    subtitle: controller.value ? "Dark mode".tr : "Light mode".tr,
                    iconData: controller.value ? Icons.dark_mode : Icons.light_mode,
                    trailing: Switch(
                      value: controller.value,
                      onChanged: (val) {
                        controller.on();
                        Get.changeTheme(controller.value ? ThemeData.dark() : ThemeData.light());
                      },
                      activeColor: Colors.green,
                    ),
                  );
                },
              ),
              SizedBox(height: 10,),

              BlocConsumer<LogoutCubit,UserState>(
              listener: (context,state){
              if(state is LogOutSuccess){
              Get.snackbar("done", state.message);
              Get.offAllNamed(AppRoutes.signIn);
              }
              if(state is LogOutFailure){
              Get.snackbar("fail", state.message);
              }
              },
              builder: (context,state){
              return CustomListTile(
                title: "Logout".tr,
                iconData: Icons.logout,
                onTap: () {
                   Get.defaultDialog(
                    title: "Alert".tr,
                    middleText:  "Are you sure you want to logout?".tr,
                    confirm: TextButton(
                      onPressed: () {
                        context.read<LogoutCubit>().logout();
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
                });}),

                const SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: Text("Version".tr),
              )
            ],
          ),


    );
  }
}
