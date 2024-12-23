import 'package:e_commerce/controller/cubit/UserState.dart';
import 'package:e_commerce/controller/cubit/signup_cubit.dart';
import 'package:e_commerce/core/constants/approutes.dart';
import 'package:e_commerce/core/functions/validation.dart';
import 'package:e_commerce/view/widget/CustomButton.dart';
import 'package:e_commerce/view/widget/Loading.dart';
import 'package:e_commerce/view/widget/bottom_auth.dart';
import 'package:e_commerce/view/widget/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../core/constants/gradientBall.dart';
import '../widget/CustomTextField.dart';
import '../widget/pick.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});
  @override
  Widget build(BuildContext context) {
    var signup =context.read<SignUpCubit>();
    return BlocConsumer<SignUpCubit,UserState>(
      listener: (context, state) {
       if( state is SignUpSuccess){
         Get.snackbar("done", state.message);
        Get.offAllNamed(AppRoutes.bottomAppbar);
       }
      if ( state is SignUpFailure){
        Get.defaultDialog(title: state.message);
      }},
      builder: (context,state) {
        return state is SignUpLoading ? Loading(): Scaffold(
          body: SingleChildScrollView(
            child: Stack(
              children: [
                const Positioned(top: -40, left: -30, child: GradientBall()),
                const Positioned(top: 155, right: -60, child: GradientBall()),
                Form(
                  key: signup.signUpKey,
                  child: Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                       Header(title: "create account".tr, subtitle: "subtitle".tr,),
                       const SizedBox(height: 10),
                        PickImage(),
                        const SizedBox(height: 15),
                         CustomTextField(
                             label: "first name".tr, icon: Icons.text_format,controller1: signup.firstName,
                           validator: (val) => validInput(20, 3, "First Name", val!)),

                        CustomTextField(label: "last name".tr, icon: Icons.text_format,controller1: signup.lastName,
                            validator:(val)=>validInput(20, 3, "Last Name",val!)),

                         CustomTextField(label: "phone number".tr, icon: Icons.phone,controller1: signup.phoneNumber,
                            validator:(val)=> validInput(10, 10, "phone number", val!)),

                         CustomTextField(label: "Email".tr, icon: Icons.email,controller1: signup.email,
                            validator:(val)=> validInput(30, 8, "Email", val!)),

                        CustomTextField(label: "password".tr, icon: Icons.lock,controller1: signup.password,
                             validator:(val)=>validInput(64, 8,"Password", val!)),

                        CustomTextField(label: "confirm password".tr, icon: Icons.lock,controller1: signup.confirmPassword,
                            validator:(val)=>validInput(64, 8,"Confirm Password", val!)),

                         CustomTextField(label: "location".tr, icon: Icons.location_pin,controller1: signup.location,
                             validator:(val)=> validInput(35, 4,"Location",val!)),

                        const SizedBox(height: 6),

                          CustomButton(text: "sign up".tr, onPressed: (){
                           signup.signup();}),

                        BottomAuth(text: "already have", data:"sign in",onPressed: () {Get.offNamed(AppRoutes.signIn);}),

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
