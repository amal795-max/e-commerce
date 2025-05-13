import 'package:e_commerce/core/constants/appimages.dart';
import 'package:e_commerce/view/widget/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../core/constants/appColor.dart';
import '../../controller/cubit/UserState.dart';
import '../../controller/cubit/resetPasswordCubit.dart';
import '../../core/constants/approutes.dart';
import '../../core/functions/validation.dart';
import '../widget/CustomTextField.dart';
import '../widget/Loading.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var reset=context.read<ResetPasswordCubit>();
    return BlocConsumer<ResetPasswordCubit, UserState>(
        listener: (context, state) {
      if( state is ResetPasswordFailure){
        Get.defaultDialog(title: "failure",middleText: state.message);}
      if( state is ResetPasswordSuccess){
        Get.snackbar("done",state.message);
        Get.offAllNamed(AppRoutes.signIn);
      }},
    builder: (context, state) {
      return state is ResetPasswordLoading ? const Loading() :  Scaffold(
          body: Form(
              key: reset.resetKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(AppImages.verify),
                   const SizedBox(height: 15),
                    Text("Create New Password".tr, textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge,),
                    const SizedBox(height: 20),

                    Text("Your New Password must be different \nfrom previous used password".tr,
                        textAlign: TextAlign.center, style: TextStyle(color: AppColor.grey),),
                    const SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: CustomTextField(
                        label: "Email".tr, icon: Icons.email, controller1: reset.email,
                        validator: (val) => validInput(30, 10, "Email", val!),),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: CustomTextField(label: "password".tr, icon: Icons.lock,controller1: reset.password,
                          validator: (val) => validInput(64, 8, "Password", val!)),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: CustomTextField(label: "confirm password".tr, icon: Icons.lock,
                          controller1: reset.password_confirmation,
                          validator: (val) => validInput(64, 8, "Confirm Password", val!)),
                    ),
                     const SizedBox(height: 8),
                     CustomButton(text: "save".tr, onPressed: () {reset.resetPassword();}),

                  ],
                ),
              ),
            ),


      );
    });}}

