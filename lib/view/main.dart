// ignore_for_file: unused_import

import 'package:dio/dio.dart';
import 'package:e_commerce/controller/cubit/AllStoresCubit.dart';
import 'package:e_commerce/controller/cubit/Allorder.dart';
import 'package:e_commerce/controller/cubit/OrderCubit.dart';
import 'package:e_commerce/core/functions/checkInternet.dart';
import 'package:e_commerce/delivery/SignInDeliveryCubit.dart';
import 'package:e_commerce/delivery/SignUpDeliveryCubit.dart';
import 'package:e_commerce/controller/cubit/changePasswordCubit.dart';
import 'package:e_commerce/controller/cubit/favoriteCubit.dart';
import 'package:e_commerce/controller/cubit/getProductByIdCubit.dart';
import 'package:e_commerce/controller/cubit/logoutcubit.dart';
import 'package:e_commerce/controller/cubit/StoreWithProduct.dart';
import 'package:e_commerce/controller/cubit/resetPasswordCubit.dart';
import 'package:e_commerce/controller/cubit/searchCubit.dart';
import 'package:e_commerce/controller/cubit/showuser_cubit.dart';
import 'package:e_commerce/controller/cubit/updateProfile_cubit.dart';
import 'package:e_commerce/delivery/Order.dart';
import 'package:e_commerce/delivery/Splash.dart';
import 'package:e_commerce/delivery/dashboard.dart';
import 'package:e_commerce/delivery/logIn.dart';
import 'package:e_commerce/delivery/signup.dart';
import 'package:e_commerce/view/routes.dart';
import 'package:e_commerce/view/screens/ChangePassword.dart';
import 'package:e_commerce/view/screens/d.dart';
import 'package:e_commerce/view/screens/home.dart';
import 'package:e_commerce/view/screens/onboarding.dart';
import 'package:e_commerce/view/screens/order.dart';
import 'package:e_commerce/view/screens/resetPassword.dart';
import 'package:e_commerce/view/screens/sign_in.dart';
import 'package:e_commerce/view/screens/sign_up.dart';
import 'package:e_commerce/view/screens/splashscreen.dart';
import 'package:e_commerce/view/screens/verifycode.dart';
import 'package:e_commerce/view/test.dart';
import 'package:e_commerce/view/widget/CustomBottomAppBar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../controller/binding.dart';
import '../controller/cubit/api/dio_consumer.dart';
import '../controller/cubit/cart.dart';
import '../controller/cubit/cartCubit.dart';
import '../controller/cubit/signin_cubit.dart';
import '../controller/cubit/signup_cubit.dart';
import '../core/localization/local.dart';
import '../core/localization/translation.dart';
import '../core/services/PushNotificationService.dart';
import '../core/services/services.dart';
import '../delivery/maps.dart';
import '../firebase_options.dart';
import 'screens/checkemail.dart';
import 'screens/tabbar.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeServices();

  NotificationsHelper notificationsHelper = NotificationsHelper();

  await notificationsHelper.initNotifications();
  notificationsHelper.handleBackgroundNotifications();


  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context)=>SignUpCubit(DioConsumer(dio: Dio()))) ,
        BlocProvider(
            create: (context)=>SignInCubit(DioConsumer(dio: Dio()))) ,
        BlocProvider(
            create: (context)=>LogoutCubit(DioConsumer(dio: Dio()))) ,
        BlocProvider(
            create: (context)=>ShowUserCubit(DioConsumer(dio: Dio()))),
        BlocProvider(
            create: (context)=>UpdateProfileCubit(DioConsumer(dio: Dio()))),
        BlocProvider(
            create: (context)=>AllStoresCubit(DioConsumer(dio: Dio()))),
        BlocProvider(
            create: (context)=>StoreWithProductCubit(DioConsumer(dio: Dio()))),
        BlocProvider(
            create: (context)=>FavoriteCubit(DioConsumer(dio: Dio()))),
        BlocProvider(
            create: (context)=>ResetPasswordCubit(DioConsumer(dio: Dio()))),
        BlocProvider(
            create: (context)=>GetProductByIdCubit(DioConsumer(dio: Dio()))),
        BlocProvider(
            create: (context)=>ChangePasswordCubit(DioConsumer(dio: Dio()))),
        BlocProvider(
            create: (context)=>CartCubit(DioConsumer(dio: Dio()))),
        BlocProvider(
            create: (context)=>SearchCubit(DioConsumer(dio: Dio()))),
        BlocProvider(
            create: (context)=>OrderCubit(DioConsumer(dio: Dio()))),
        BlocProvider(
            create: (context)=>DeliverySignUpCubit(DioConsumer(dio: Dio()))),
        BlocProvider(
            create: (context)=>DeliverySignInCubit(DioConsumer(dio: Dio()))),
        BlocProvider(
            create: (context)=>AllOrderCubit(DioConsumer(dio: Dio()))),

        BlocProvider(create: (context) => CartCounter(),
        ),

      ],
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Localization Local = Get.put(Localization());
    return  GetMaterialApp(
      locale:Local.language,
      translations: AppTranslation(),
      initialBinding: Binding(),
      theme: ThemeData(fontFamily: 'RobotoSlab'),

      debugShowCheckedModeBanner: false,
      getPages:getPages,
      transitionDuration: const Duration(milliseconds: 500),
      home:  dashboard(),
    );
  }}
