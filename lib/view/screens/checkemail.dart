
import 'package:e_commerce/controller/cubit/resetPasswordCubit.dart';
import 'package:e_commerce/core/constants/appimages.dart';
import 'package:e_commerce/view/widget/CustomButton.dart';
import 'package:e_commerce/view/widget/Loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../core/constants/appColor.dart';
import '../../controller/cubit/UserState.dart';
import '../../core/constants/approutes.dart';
import '../../core/functions/validation.dart';
import '../widget/CustomTextField.dart';

class CheckEmail extends StatelessWidget {
  const CheckEmail({Key? key}) ;

  @override
  Widget build(BuildContext context) {
    var check=context.read<ResetPasswordCubit>();
    return  BlocConsumer<ResetPasswordCubit, UserState>(
        listener: (context, state) {
          if( state is SendCodeFailure)
            Get.defaultDialog(title: "error",middleText: state.message);
          if( state is SendCodeSuccess){
            Get.snackbar("done".tr,state.message);
            Get.offNamed(AppRoutes.verifyCode);
            }},
    builder: (context, state) {
      return state is SendCodeLoading?const Loading(): Scaffold(
          body: SingleChildScrollView(
            child: Column(
                    children: [

                      Image.asset(AppImages.verify),
                      const SizedBox(height: 20),
                      Text("Forget Password".tr, textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,),
                      const SizedBox(height: 15),
                      Text("Check Your Email".tr, textAlign: TextAlign.center,
                        style: TextStyle(color: AppColor.grey, fontSize: 15),),
                      const SizedBox(height: 15),

                      Form(
                        key: check.sendKey,
                         child: CustomTextField(
                         label: "email".tr,
                           icon: Icons.email,
                          controller1: check.email,
                          validator: (val) => validInput(30, 10, "Email", val!),),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: CustomButton(
                          text: "check".tr,
                          onPressed: () {
                            check.sendCode();
                          },
                        ),
                      ),
                    ],
                  ),

              ),

      );
    });}}