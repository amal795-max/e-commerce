import 'package:e_commerce/controller/cubit/UserState.dart';
import 'package:e_commerce/controller/cubit/signin_cubit.dart';
import 'package:e_commerce/core/constants/appcolor.dart';
import 'package:e_commerce/core/constants/appimages.dart';
import 'package:e_commerce/view/widget/CustomTextField.dart';
import 'package:e_commerce/view/widget/bottom_auth.dart';
import 'package:e_commerce/view/widget/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../core/constants/approutes.dart';
import '../../core/functions/validation.dart';
import '../widget/CustomButton.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    var signin = context.read<SignInCubit>();

    return BlocConsumer<SignInCubit, UserState>(
        listener: (context, state) {
          if (state is SignInSuccess) {
            Get.snackbar("done", state.message);
            Get.offAllNamed(AppRoutes.bottomAppbar);
          }
          if (state is SignInFailure) {
            Get.snackbar("fail", state.message);
          }
        },
        builder: (context, state) {
          return Scaffold(
              backgroundColor: AppColor.white,
              body: Stack(
                children: [
                  ListView(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 400,
                            width: 400,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(150),
                              child: Image.asset(
                                AppImages.signin,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                     Form(
                    key: signin.signInKey,
                    child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                    children: [
                     SizedBox(height: 270),
                      Header(title: "welcome back".tr, subtitle: "subtitle2".tr),
                         SizedBox(height: 30),
                        CustomTextField(label: "phone number".tr, icon: Icons.phone, validator: (val) => validInput(10, 10, "Phone Number", val!), controller1: signin.phoneNumber,),
                       CustomTextField(label: "password".tr, icon: Icons.lock, validator: (val) => validInput(64, 8, "Password", val!), controller1: signin.password,),
                        Align(
                       alignment: Alignment.bottomRight,
                          child: TextButton(
                            onPressed: () {Get.offNamed(AppRoutes.check);},
                            child: Text("Forget Password ?", style: TextStyle(color: AppColor.orange, fontSize: 12),),),),
                          CustomButton(text: "log in".tr, onPressed: () {signin.signIn();}),
                       BottomAuth(text: "don't have", data: "sign up",onPressed: () {Get.offNamed(AppRoutes.signUp);},)],
                              )),
                          )])],
                  ),
                  if (state is SignInLoading)
                    Container(
                      padding:const EdgeInsets.all(100),
                      color: Colors.black54,
                      child: Center(
                        child: Lottie.asset("lottie/loading.json"),
                      ),
                    ),
                ],
              ));
        });
  }
}
