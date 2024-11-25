import 'package:e_commerce/core/constants/approutes.dart';
import 'package:e_commerce/view/screens/onboarding.dart';
import 'package:e_commerce/view/screens/sign_up.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? getPages=[

  GetPage(name:AppRoutes.onboarding , page: ()=>OnBoarding(), ),
  GetPage(name:AppRoutes.signUp , page: ()=>SignUp(),transition: Transition.zoom)
];