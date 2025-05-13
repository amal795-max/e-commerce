import 'package:e_commerce/controller/cubit/api/endPoints.dart';
import 'package:e_commerce/controller/cubit/updateProfile_cubit.dart';
import 'package:e_commerce/core/constants/approutes.dart';
import 'package:e_commerce/view/widget/CustomButton.dart';
import 'package:e_commerce/view/widget/CustomExpanionTile.dart';
import 'package:e_commerce/view/widget/CustomListTile.dart';
import 'package:e_commerce/view/widget/Loading.dart';
import 'package:e_commerce/view/widget/PickImageWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../controller/cubit/UserState.dart';
import '../../core/class/HeaderPainter.dart';
import '../../core/services/services.dart';
class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices =Get.find();
    var update =context.read<UpdateProfileCubit>();
    var size = MediaQuery.of(context).size;
    return BlocConsumer<UpdateProfileCubit, UserState>(
      listener: (context, state) {
        if(state is UpdateProfileSuccess){
          Get.snackbar("","Profile updated successfully!");
        };
      },
      builder: (context, state) {
    return state is UpdateProfileLoading?
         Loading():Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      CustomPaint(
                        painter: HeaderPaint(),
                        child: SizedBox(
                          height: size.height / 3,
                          width: size.width,
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: size.width / 2,
                            bottom: 30,
                          ),
                          child: PickImageWidget(backgroundImage: NetworkImage(myServices.getData(key: ApiKeys.image)),)
                        ),
                      ),
                    ],
                  ),
                  CustomExpansionTile(
                    iconData: Icons.account_box,
                    trailing: Icons.edit,
                    subtitle: myServices.getData(key: ApiKeys.first_name),
                    title: "first name",
                    hintText: "enter new first name :",
                    controller: update.updateFirstName,
                  ),
                  CustomExpansionTile(
                    iconData: Icons.account_box,
                    trailing: Icons.edit,
                    subtitle: myServices.getData(key: ApiKeys.last_name),
                    title: "last name",
                    hintText: "Enter new last name:",
                    controller: update.updateLastName,

                  ),
                  CustomExpansionTile(
                    iconData: Icons.location_on,
                    trailing: Icons.edit_location_alt_rounded,
                    subtitle: myServices.getData(key: ApiKeys.location),
                    title: "location",
                    hintText: "enter new location :",
                    controller: update.updateLocation,

                  ),
                  CustomListTile(
                    onTap: (){
                      Get.toNamed(AppRoutes.changePassword);
                    },
                    title: "change password".tr,iconData: Icons.password_outlined,),

                  const SizedBox(height: 20,),
                 state is ShowUserLoading?const CircularProgressIndicator():
                 CustomButton(text: "save".tr,onPressed: (){
                   update.updateProfile();



                 })
                ],
              ),
            ),
    );
      }
    );
  }
}
