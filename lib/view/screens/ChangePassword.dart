import 'package:e_commerce/controller/cubit/changePasswordCubit.dart';
import 'package:e_commerce/core/constants/appimages.dart';
import 'package:e_commerce/view/widget/CustomButton.dart';
import 'package:e_commerce/view/widget/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../Core/constants/appcolor.dart';
import '../../controller/cubit/UserState.dart';
import '../../core/functions/validation.dart';
import '../widget/Loading.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    var change=context.read<ChangePasswordCubit>();

    return BlocConsumer<ChangePasswordCubit, UserState>(
        listener: (context, state) {
      if(state is ChangePasswordSuccess){
        Get.snackbar("done",state.message);
      };
      if(state is ChangePasswordFailure){
        Get.defaultDialog(title: state.message,content:Text(state.errors,style: TextStyle(color: AppColor.red),));
      };
    },
    builder: (context, state) {
    return state is ChangePasswordLoading?
    const Loading(): Scaffold(
    body: SingleChildScrollView(
    child: Form(
      key: change.changePasswordKey,
      child: Column(
      children: [
      Image.asset(AppImages.verify),

      Padding(padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text("change password".tr,style: Theme.of(context).textTheme.headlineSmall)),

      CustomTextField(label: "Current password".tr, icon: Icons.password_outlined,controller1: change.currentPassword,
          validator:(val)=>validInput(64, 8,"Current password", val!)),
      CustomTextField(label: "New password".tr, icon: Icons.lock,controller1: change.newPassword,
          validator:(val)=>validInput(64, 8,"New password", val!)),
      CustomTextField(label: "Confirm new password".tr, icon: Icons.lock,controller1: change.confirmNewPassword,
          validator:(val)=>validInput(64, 8,"Confirm new password", val!)),
      const SizedBox(height: 15),
      CustomButton(text: "Change".tr,onPressed: (){change.changePassword();})
      ],
      ),
    ),
    ),
    );
    }); }
}
