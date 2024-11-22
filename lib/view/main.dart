import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return  GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'RobotoSlab',
      ),
      debugShowCheckedModeBanner: false,
      getPages: [],
      home: OnBoarding(),
    );
  }
}
