
import 'package:e_commerce/core/constants/approutes.dart';
import 'package:e_commerce/core/functions/middleware.dart';
import 'package:e_commerce/delivery/dashboard.dart';
import 'package:e_commerce/delivery/logIn.dart';
import 'package:e_commerce/view/screens/TermsOfUse.dart';
import 'package:e_commerce/view/screens/privacyPolicy.dart';
import 'package:e_commerce/view/screens/Favorite.dart';
import 'package:e_commerce/view/screens/ProductDetails.dart';
import 'package:e_commerce/view/screens/Profile.dart';
import 'package:e_commerce/view/screens/order.dart';
import 'package:e_commerce/view/screens/settings.dart';
import 'package:e_commerce/view/screens/home.dart';
import 'package:e_commerce/view/screens/onboarding.dart';
import 'package:e_commerce/view/screens/sign_in.dart';
import 'package:e_commerce/view/screens/sign_up.dart';
import 'package:e_commerce/view/screens/splashscreen.dart';
import 'package:e_commerce/view/screens/tabbar.dart';
import 'package:e_commerce/view/test.dart';
import 'package:get/get.dart';
import '../delivery/Order.dart';
import '../delivery/maps.dart';
import '../delivery/signup.dart';
import 'screens/Cart.dart';
import 'screens/ChangePassword.dart';
import 'screens/checkemail.dart';
import 'screens/resetPassword.dart';
import 'screens/verifycode.dart';
import 'widget/CustomBottomAppBar.dart';

List<GetPage<dynamic>>? getPages=[

  GetPage(name:AppRoutes.onboarding , page: ()=>const OnBoarding(),transition: Transition.zoom,middlewares: [AuthMiddleware()] ),
  GetPage(name:AppRoutes.splash , page: ()=> SplashScreen(),transition: Transition.zoom, ),
  GetPage(name:AppRoutes.signUp , page: ()=>const SignUp(),transition: Transition.zoom,),
  GetPage(name:AppRoutes.signIn , page: ()=> SignIn(),transition: Transition.zoom),
  GetPage(name:AppRoutes.home , page: ()=>const Home(),transition: Transition.zoom),
  GetPage(name:AppRoutes.cart , page: ()=>const Cart(),transition: Transition.zoom),
  GetPage(name:AppRoutes.favorite , page: ()=>const Favorite(),transition: Transition.zoom),
  GetPage(name:AppRoutes.profile , page: ()=>const Profile(),transition: Transition.zoom),
  GetPage(name:AppRoutes.bottomAppbar , page: ()=>const CustomBottomAppBar(),transition: Transition.zoom),
  GetPage(name:AppRoutes.privacy , page: ()=>const PrivacyPolicy(),transition: Transition.zoom),
  GetPage(name:AppRoutes.terms , page: ()=>const TermsOfUse(),transition: Transition.zoom),
  GetPage(name:AppRoutes.settings , page: ()=>const Settings(),transition: Transition.zoom),
 GetPage(name:AppRoutes.productDetails , page: ()=> const ProductDetails(),transition: Transition.zoom),
  GetPage(name:AppRoutes.resetPassword , page: ()=>const ResetPassword(),transition: Transition.zoom),
  GetPage(name:AppRoutes.verifyCode , page: ()=>const VerifyCode(),transition: Transition.zoom),
  GetPage(name:AppRoutes.check , page: ()=>const CheckEmail(),transition: Transition.zoom),
  GetPage(name:AppRoutes.order , page: ()=>const Order(),transition: Transition.zoom),
  GetPage(name:AppRoutes.changePassword , page: ()=>const ChangePassword(),transition: Transition.zoom),
  GetPage(name:AppRoutes.tabBar , page: ()=>const TabBarPage(),transition: Transition.zoom),
  GetPage(name:AppRoutes.testInternet , page: ()=> TestInternet(),transition: Transition.zoom,),
  GetPage(name:AppRoutes.customBottom , page: ()=> const CustomBottomAppBar(),transition: Transition.zoom),

  //  delivery app
  GetPage(name:AppRoutes.signinDev , page: ()=>const SignInDelivery(),transition: Transition.leftToRightWithFade),
  GetPage(name:AppRoutes.signupDev , page: ()=>const SignUpDelivery(),transition: Transition.leftToRightWithFade),
  GetPage(name:AppRoutes.allOrders , page: ()=>const allOrders(),transition: Transition.leftToRightWithFade),
 GetPage(name:AppRoutes.delivery , page: ()=>const DeliverOrderScreen(),transition: Transition.leftToRightWithFade),
 GetPage(name:AppRoutes.dashboard , page: ()=>const dashboard(),transition: Transition.leftToRightWithFade),


];