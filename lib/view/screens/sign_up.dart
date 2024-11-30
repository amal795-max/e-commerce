import 'package:e_commerce/controller/cubit/UserState.dart';
import 'package:e_commerce/controller/cubit/signup_cubit.dart';
import 'package:e_commerce/core/constants/appcolor.dart';
import 'package:e_commerce/core/constants/approutes.dart';
import 'package:e_commerce/core/functions/validation.dart';
import 'package:e_commerce/view/widget/CustomButton.dart';
import 'package:e_commerce/view/widget/PickImageWidget.dart';
import 'package:e_commerce/view/widget/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../core/constants/gradientBall.dart';
import '../widget/CustomTextField.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    var signup =context.read<SignUpCubit>();
    GlobalKey<FormState> signUpKey = GlobalKey();
    return BlocConsumer<SignUpCubit,UserState>(
      listener: (context, state) {
       if( state is SignUpSuccess){
       }
      if ( state is SignUpFailure){}
      },
      builder: (context,state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Stack(
              children: [
                const Positioned(
                  top: -40,
                  left: -30,
                  child: GradientBall(),
                ),
                const Positioned(
                  top: 175,
                  right: -60,
                  child: GradientBall(),
                ),
                Form(
                  key: signUpKey,
                  child: Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                      const Header(title: "Create account", subtitle: "Please, Provide your information",),
                       const SizedBox(height: 15),
                       const PickImageWidget(),
                        const SizedBox(height: 25),
                         CustomTextField(
                             label: "First Name", icon: Icons.text_format,controller1: signup.firstName,
                           validator: (val) => validInput(20, 3, "First Name", val!)),
                        const SizedBox(height: 15),
                         CustomTextField(label: "Last Name", icon: Icons.text_format,controller1: signup.lastName,
                            validator:(val)=>validInput(20, 3, "Last Name",val!)),
                        const SizedBox(height: 15),
                         CustomTextField(label: "phone number", icon: Icons.phone,controller1: signup.phoneNumber,
                            validator:(val)=> validInput(10, 10, "phone number", val!)),
                        const SizedBox(height: 15),
                         CustomTextField(label: "Password", icon: Icons.lock,controller1: signup.password,
                             validator:(val)=>validInput(64, 8,"Password", val!)),
                        const SizedBox(height: 15),
                         CustomTextField(label: "Location", icon: Icons.location_pin,controller1: signup.location,
                             validator:(val)=> validInput(35, 4,"Location",val!)),
                        const SizedBox(height: 15),

                          CustomButton(
                            text: "Sign Up",
                              onPressed: (){
                            if(signUpKey.currentState!.validate()){
                              print("yes");
                            }
                          }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("already have an account ?", style: TextStyle(color: AppColor.black)),
                            TextButton(
                                onPressed: () {
                                  Get.offNamed(AppRoutes.signIn);
                                },
                                child: Text("Sign in", style: TextStyle(color: AppColor.orange))),
                          ],
                        ),
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
