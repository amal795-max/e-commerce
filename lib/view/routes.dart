import 'package:e_commerce/core/constants/approutes.dart';
import 'package:e_commerce/view/screens/onboarding.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? getPages=[
  GetPage(name:AppRoutes.onboarding , page: ()=>OnBoarding())
];