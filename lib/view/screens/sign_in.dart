import 'package:e_commerce/controller/cubit/UserState.dart';
import 'package:e_commerce/controller/cubit/signin_cubit.dart';
import 'package:e_commerce/core/constants/appcolor.dart';
import 'package:e_commerce/core/constants/appimages.dart';
import 'package:e_commerce/view/widget/CustomTextField.dart';
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
    var signin= context.read<SignInCubit>();

    return BlocConsumer<SignInCubit,UserState>(
        listener: (context,state){
          if(state is SignInSuccess){
            Get.snackbar("done", state.message);
            Get.offAllNamed(AppRoutes.bottomAppbar);
          }
          if(state is SignInFailure){
            Get.snackbar("fail", state.message);
          }
        },
        builder: (context,state){
          return state is SignInLoading?Container(
     color: AppColor.white,
     padding:const EdgeInsets.all(80),
     child: Lottie.asset("lottie/loading.json"),) : Scaffold(
    backgroundColor:AppColor.white,
    body:
    ListView(
    children: [
    Stack(
    children:[
    Container(
    height: 400,
    width: 400,
    child:
    ClipRRect(borderRadius: BorderRadius.circular(150),
    child: Image.asset(AppImages.signin,fit: BoxFit.cover ,),
    )
    ),

    Form(
      key: signin.signInKey,
      child: Padding(
      padding:const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
      children: [
      SizedBox(height: 270,),


      Header(title: "Welcome Back", subtitle: "Login to your account"),

      SizedBox(height: 30,),
      CustomTextField(label: "Phone Number",icon: Icons.phone,
      validator: (val) => validInput(10, 10, "Phone Number", val!),
      controller1: signin.phoneNumber,),
      SizedBox(height: 20,),
      CustomTextField(label: "Password", icon: Icons.lock,
      validator: (val) => validInput(64, 8, "Password", val!),
      controller1: signin.password,),
      SizedBox(height: 20,),
      CustomButton(text: "Log In",onPressed: (){
        signin.signIn();
      }),

      Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text("Don't have an account ?", style: TextStyle(color: AppColor.black)),
      TextButton(
      onPressed: () {
        Get.offNamed(AppRoutes.signUp);

      },
      child: Text("Sign up", style: TextStyle(color: AppColor.orange))),
      ],
      ),]
      ),
      ),
    )
    ])]));

      });}}
