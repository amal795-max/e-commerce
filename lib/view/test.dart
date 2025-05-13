import 'dart:async';
import 'package:e_commerce/Core/constants/appcolor.dart';
import 'package:e_commerce/Core/constants/approutes.dart';
import 'package:e_commerce/view/widget/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/functions/checkInternet.dart';

class TestInternet extends StatefulWidget {
  @override
  _TestInternetState createState() => _TestInternetState();
}

class _TestInternetState extends State<TestInternet> {
  @override
  void initState() {
    super.initState();
    checkConnection();
  }
  Future<void> checkConnection() async {
    bool isConnected = await checkInternetAccess();
    if (isConnected) {
      Get.offNamed(AppRoutes.splash);
    } else {
         Get.off(()=> NoInternetScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: CircularProgressIndicator(color: AppColor.orange,),
      ),
    );
  }
}

class NoInternetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.wifi_off_sharp, color: Colors.orange, size: 100),
            const SizedBox(height: 30),
             Text('No Internet Connection'.tr,
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            const SizedBox(height: 30),
            CustomButton(
              onPressed: () {
               Get.off(()=>TestInternet(),);
              },
              text: 'Retry'.tr,

            ),
          ],
        ),
      ),
    );
  }
}




