
import 'package:e_commerce/delivery/SignUpDeliveryCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../Core/constants/approutes.dart';
import '../../Core/constants/gradientBall.dart';
import '../../Core/functions/validation.dart';
import '../controller/cubit/UserState.dart';
import '../view/widget/CustomButton.dart';
import '../view/widget/CustomTextField.dart';
import '../view/widget/Loading.dart';
import '../view/widget/bottom_auth.dart';
import '../view/widget/header.dart';


class SignUpDelivery extends StatelessWidget {
  const SignUpDelivery({super.key});
  @override
  Widget build(BuildContext context) {
    var signup =context.read<DeliverySignUpCubit>();
    return BlocConsumer<DeliverySignUpCubit,UserState>(
      listener: (context, state) {
        if( state is DeliverySignUpSuccess){
          Get.snackbar("done", state.message);
        }
        if ( state is DeliverySignUpFailure){
          Get.defaultDialog(title: state.message,middleText: state.errors);
        }},
      builder: (context,state) {
        return  state is DeliverySignUpLoading ? const Loading():  Scaffold(
          body: SingleChildScrollView(
            child: Stack(
              children: [
                const Positioned(top: -40, left: -25, child: GradientBall()),
                const Positioned(top: 150, right: -65, child: GradientBall()),

                Form(
                  key: signup.signupKey,
                  child: Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 15,vertical: 30),
                    child: Column(

                      children: [
                        const SizedBox(height: 80),
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(right: 80),
                  child: Header2(title: "Create account", subtitle: "Please, provide your information".tr,),
                )),

                        SizedBox(height: 40),
                         CustomTextField(
                              label: "Name", icon: Icons.text_format,
                              controller1: signup.name,
                              validator: (val) => validInput(20, 3, "Name", val!)),

                       // const SizedBox(height: 20),

                        CustomTextField(label: "Phone number", icon: Icons.phone,
                            controller1: signup.phone,
                            validator:(val)=> validInput(10, 10, "phone number", val!)),

                        CustomTextField(label: "Password", icon: Icons.lock,
                            controller1: signup.password,
                            validator:(val)=>validInput(64, 8,"Password", val!)),

                        CustomTextField(label: "Confirm password", icon: Icons.lock,
                            controller1: signup.confirmPassword,
                            validator:(val)=>validInput(64, 8,"Confirm Password", val!)),

                        const SizedBox(height: 15),

                       CustomButton(text: "Sign up", onPressed: (){
                         signup.signUp();
                        }),
                           SizedBox(height: 10),
                 BottomAuth(text: "already have an account ?", data:"sign in",onPressed: () {Get.offNamed(AppRoutes.signinDev);}),

                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        );
      },
    );
  }
}
