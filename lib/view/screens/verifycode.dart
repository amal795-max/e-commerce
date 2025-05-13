import 'package:e_commerce/controller/cubit/resetPasswordCubit.dart';
import 'package:e_commerce/core/constants/appimages.dart';
import 'package:e_commerce/view/widget/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../../core/constants/appColor.dart';
import '../../../core/constants/approutes.dart';
import '../../controller/cubit/UserState.dart';
import '../../core/functions/validation.dart';
import '../widget/CustomTextField.dart';
import '../widget/Loading.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    var verify = context.read<ResetPasswordCubit>();
    String? message;
    final defaultPinTheme = PinTheme(
      width: 55,
      height: 50,
      textStyle: TextStyle(
        fontSize: 20,
        color: Colors.black54,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.orange),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: AppColor.lightOrange,
      ),
    );
    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: AppColor.orange),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    return BlocConsumer<ResetPasswordCubit, UserState>(
      listener: (context, state) {
        if (state is VerifyCodeSuccess) {
          Get.offNamed(AppRoutes.resetPassword);
        } else if (state is VerifyCodeFailure) {
          message = "${state.message}\n${state.errors}";
        }
      },
      builder: (context, state) {
        return state is VerifyCodeLoading
            ? const Loading()
            : Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: verify.verifyKey,
              child: Column(
                children: [
                  Image.asset(AppImages.verify),
                  const SizedBox(height: 20),
                  Text(
                    "Verification Code".tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Please Enter The Digit Code Sent \nTo Your Email".tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 25),
                  // CustomTextField(
                  //   label: "email".tr,
                  //   icon: Icons.email,
                  //   controller1: verify.email,
                  //   validator: (val) => validInput(30, 10, "Email", val!),
                  // ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Pinput(
                      controller: verify.code,
                      length: 6,
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: focusedPinTheme,
                      submittedPinTheme: submittedPinTheme,
                      keyboardType: TextInputType.text,
                      validator: (s) {
                        return message;
                      },
                      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                      showCursor: true,
                      onCompleted: (pin) => print(pin),
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (message != null)
                    Text(message!, style: TextStyle(color: Colors.red,fontSize: 12), textAlign: TextAlign.center,),
                    const SizedBox(height: 20),

                  CustomButton(text: "verify".tr, onPressed: () {verify.verifyCode();},),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
