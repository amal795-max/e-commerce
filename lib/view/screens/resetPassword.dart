import 'package:e_commerce/view/widget/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/appColor.dart';
import '../../core/constants/approutes.dart';
import '../../core/functions/validation.dart';
import '../widget/CustomTextField.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              const SizedBox(height: 50),

              Text("Create New Password", textAlign: TextAlign.center, style: Theme.of(context).textTheme.titleLarge,),
              Icon(Icons.password,size: 100,color: AppColor.orange),

               Text("Your New Password must be different from previous used password ",
                textAlign: TextAlign.center, style: Theme.of(context).textTheme.titleSmall ),
              SizedBox(height: 30),

              CustomTextField(label: "password".tr, icon: Icons.lock,
                  validator:(val)=>validInput(64, 8,"Password", val!)),
              const SizedBox(height: 15),

              CustomTextField(label: "confirm password".tr, icon: Icons.lock,
                  validator:(val)=>validInput(64, 8,"Confirm Password", val!)),
              Padding(
                padding: const EdgeInsets.all(20),
                child: CustomButton(text: "Save",onPressed: (){
                  Get.offAllNamed(AppRoutes.signIn);
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
