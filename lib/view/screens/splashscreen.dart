import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:e_commerce/controller/cubit/api/endPoints.dart';
import 'package:e_commerce/core/constants/appcolor.dart';
import 'package:e_commerce/core/constants/approutes.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import '../../core/constants/appimages.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{
  LatLng? endPoint;
  MyServices myServices =Get.find();

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
    Timer(const Duration(seconds: 3), () {Get.offNamed(AppRoutes.onboarding);});
  }
  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.rawSnackbar(message: 'يرجى تفعيل خدمات الموقع');
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
       Get.rawSnackbar(message: 'تم رفض إذن الوصول للموقع');
        return;
      }
    }

    Position position = await Geolocator.getCurrentPosition();
    setState(() {
     endPoint=LatLng(position.latitude, position.longitude);
     myServices.saveData(key: ApiKeys.latitude, value: position.latitude);
     myServices.saveData(key: ApiKeys.longitude, value: position.longitude);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SizedBox.expand(
          child: FadeInLeft(
              delay: const Duration(milliseconds: 500),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.splashUser),
                  FadeInLeft(
                    duration: const Duration(milliseconds: 800),
                    delay: const Duration(milliseconds: 800),
                    child:  TextButton.icon(onPressed: (){},
                        icon: Icon(Icons.waving_hand,color: AppColor.black,),
                        label:Text("welcome".tr , style: TextStyle(
                          color: AppColor.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,))),
                  )  ],
              )),
        )
    );
  }
}

