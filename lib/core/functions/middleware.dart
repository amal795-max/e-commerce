import 'package:e_commerce/controller/cubit/api/endPoints.dart';
import 'package:e_commerce/core/constants/approutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/services.dart';

class AuthMiddleware extends GetMiddleware{
  MyServices myServices =Get.find();

@override
  RouteSettings? redirect(String? route) {
if(myServices.getData(key: ApiKeys.isFirstTime)==true &&myServices.getData(key: ApiKeys.isLogin)==true)
   return RouteSettings(name: AppRoutes.customBottom);
else if(myServices.getData(key: ApiKeys.isFirstTime)==true &&myServices.getData(key: ApiKeys.isLogin)==null)
  return RouteSettings(name: AppRoutes.signIn);
else return null;

  }
}
