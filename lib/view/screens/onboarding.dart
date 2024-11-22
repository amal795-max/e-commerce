import 'package:e_commerce/view/widget/onboarding/containerbutton.dart';
import 'package:e_commerce/view/widget/onboarding/pageview.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
            children: [
             const  SizedBox(height: 55),
            SizedBox(
                height: size.height/1.6,
                child:const pageView()),

                const containerButton()


            ],
      ),
    );
  }
}
