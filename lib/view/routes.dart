import 'package:e_commerce/core/constants/approutes.dart';
import 'package:e_commerce/view/screens/Contents.dart';
import 'package:e_commerce/view/screens/Favorite.dart';
import 'package:e_commerce/view/screens/ProductDetails.dart';
import 'package:e_commerce/view/screens/Profile.dart';
import 'package:e_commerce/view/screens/Products.dart';
import 'package:e_commerce/view/screens/settings.dart';
import 'package:e_commerce/view/screens/home.dart';
import 'package:e_commerce/view/screens/onboarding.dart';
import 'package:e_commerce/view/screens/sign_in.dart';
import 'package:e_commerce/view/screens/sign_up.dart';
import 'package:get/get.dart';
import 'screens/Cart.dart';
import 'screens/checkemail.dart';
import 'screens/resetPassword.dart';
import 'screens/verifycode.dart';
import 'widget/CustomBottomAppBar.dart';

List<GetPage<dynamic>>? getPages=[

  GetPage(name:AppRoutes.onboarding , page: ()=>const OnBoarding(), ),
  GetPage(name:AppRoutes.signUp , page: ()=>const SignUp(),transition: Transition.zoom,),
  GetPage(name:AppRoutes.signIn , page: ()=>const SignIn(),transition: Transition.zoom),
  GetPage(name:AppRoutes.home , page: ()=>const Home(),transition: Transition.zoom),
  GetPage(name:AppRoutes.cart , page: ()=>const Cart(),),
  GetPage(name:AppRoutes.favorite , page: ()=>const Favorite(),),
  GetPage(name:AppRoutes.profile , page: ()=>const Profile()),
  GetPage(name:AppRoutes.bottomAppbar , page: ()=>const CustomBottomAppBar(),),
  GetPage(name:AppRoutes.contents , page: ()=>const Contents()),
  GetPage(name:AppRoutes.settings , page: ()=>const Settings()),
  GetPage(name:AppRoutes.details , page: ()=> ProductDetails()),
  GetPage(name:AppRoutes.stores , page: ()=>const StoresProduct()),
  GetPage(name:AppRoutes.resetPassword , page: ()=>const ResetPassword()),
  GetPage(name:AppRoutes.verifyCode , page: ()=>const VerifyCode()),
  GetPage(name:AppRoutes.check , page: ()=>const CheckEmail()),
];