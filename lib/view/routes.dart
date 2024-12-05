import 'package:e_commerce/core/constants/approutes.dart';
import 'package:e_commerce/core/functions/middleware.dart';
import 'package:e_commerce/view/screens/Contents.dart';
import 'package:e_commerce/view/screens/Favorite.dart';
import 'package:e_commerce/view/screens/Profile.dart';
import 'package:e_commerce/view/screens/home.dart';
import 'package:e_commerce/view/screens/onboarding.dart';
import 'package:e_commerce/view/screens/sign_in.dart';
import 'package:e_commerce/view/screens/sign_up.dart';
import 'package:get/get.dart';
import '../controller/binding.dart';
import 'screens/Cart.dart';
import 'widget/CustomBottomAppBar.dart';

List<GetPage<dynamic>>? getPages=[

  GetPage(name:AppRoutes.onboarding , page: ()=>const OnBoarding(), ),
  GetPage(name:AppRoutes.signUp , page: ()=>const SignUp(),transition: Transition.zoom,),
  GetPage(name:AppRoutes.signIn , page: ()=>const SignIn(),transition: Transition.zoom),
  GetPage(name:AppRoutes.home , page: ()=>const Home(),transition: Transition.zoom),
  GetPage(name:AppRoutes.cart , page: ()=>const Cart(),),
  GetPage(name:AppRoutes.favorite , page: ()=>const Favorite(),),
  GetPage(name:AppRoutes.profile , page: ()=> Profile()),
  GetPage(name:AppRoutes.bottomAppbar , page: ()=>const CustomBottomAppBar(),),
  GetPage(name:AppRoutes.contents , page: ()=>const Contents()),
];