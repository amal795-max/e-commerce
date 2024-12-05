import 'package:e_commerce/core/constants/approutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/services.dart';

class AuthMiddleware extends GetMiddleware{
  MyServices myServices =Get.find();

@override
  RouteSettings? redirect(String? route) {
if(  myServices.getData(key: "get in")==true)
return RouteSettings(name: AppRoutes.home);
else
  return null;

  }
}
