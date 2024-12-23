import 'package:e_commerce/view/widget/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../../core/constants/appColor.dart';
import '../../../core/constants/approutes.dart';


class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle:const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(0, 0, 0, 100),
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.orange),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color:const Color.fromRGBO(239, 174, 68, 100),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: AppColor.orange),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
                children: [
                  const SizedBox(height: 30),
                  Text(" Verification Code",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,),
                  const SizedBox(height: 15),
                  Icon(Icons.verified_rounded,size: 100,color: AppColor.orange,),
                  const SizedBox(height: 20,),


                   Text("Please Enter The Digit Code Sent To Your Number", textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleSmall,),

                  const SizedBox(height: 20),

                  Pinput(
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    submittedPinTheme: submittedPinTheme,
                    validator: (s) {
                      return s == '2222' ? "correct" : 'Pin is incorrect';
                    },
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    showCursor: true,
                    onCompleted: (pin) => print(pin),
                  ),
                  const   SizedBox(height: 15),

                CustomButton(text: "verify",onPressed: (){
                        Get.offNamed( AppRoutes.resetPassword);},),
                      ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: AppColor.orange,
                        ),child: const Text( "Send again"),),


            ]  ),
        ),
          ),


    );
  }
}
