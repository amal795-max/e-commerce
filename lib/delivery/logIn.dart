
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../Core/constants/appcolor.dart';
import '../../Core/constants/appimages.dart';
import '../../Core/functions/validation.dart';
import '../../core/constants/approutes.dart';
import 'SignInDeliveryCubit.dart';
import '../controller/cubit/UserState.dart';
import '../view/widget/CustomButton.dart';
import '../view/widget/CustomTextField.dart';
import '../view/widget/Loading.dart';
import '../view/widget/bottom_auth.dart';
import '../view/widget/header.dart';



class SignInDelivery extends StatelessWidget {
  const SignInDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    var signin = context.read<DeliverySignInCubit>();

    return BlocConsumer<DeliverySignInCubit, UserState>(
        listener: (context, state) {
          if (state is DeliverySignInSuccess) {
            Get.snackbar("done", state.message);
            Get.offAllNamed(AppRoutes.dashboard);
           // context.read<AllOrderCubit>().order();

          }
          if (state is DeliverySignInFailure) {
           Get.defaultDialog(title: "failure",middleText:  state.error);
          }
        },
        builder: (context, state) {
          return  state is DeliverySignInLoading?Loading():  Scaffold(
              backgroundColor: AppColor.white,
              body: ListView(
                    children: [
                      Image.asset(AppImages.signin, fit: BoxFit.cover),

                      Form(
                              key: signin.signinKey,
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  child: Column(
                                    children: [
                      Header2(title: "Driver login", subtitle: "Login to your account".tr),
                       SizedBox(height: 20),
                         CustomTextField(label: "Phone number", icon: Icons.phone,
                           controller1: signin.phone,
                           validator: (val) => validInput(10, 10, "Phone Number", val!),
                           ),
                       CustomTextField(label: "Password", icon: Icons.lock,
                         controller1: signin.password,
                         validator: (val) => validInput(64, 8, "Password", val!),
                        ),
                          SizedBox(height:15,),
                       CustomButton(text: "Log in", onPressed: () {
                   signin.signIn();
                    }),
                   SizedBox(height: 10),
                   BottomAuth(text: "don't have an account ?", data: "sign up",onPressed: ()
                   {Get.offNamed(AppRoutes.signupDev);},)],
                                  )),
                            )])


              );
    });
  }
}
