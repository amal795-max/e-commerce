import 'package:dio/dio.dart';
import 'package:e_commerce/controller/cubit/logoutcubit.dart';
import 'package:e_commerce/view/routes.dart';
import 'package:e_commerce/view/screens/ProductDetails.dart';
import 'package:e_commerce/view/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../controller/binding.dart';
import '../controller/cubit/api/dio_consumer.dart';
import '../controller/cubit/signin_cubit.dart';
import '../controller/cubit/signup_cubit.dart';
import '../controller/detailscontroller.dart';
import '../core/services/services.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeServices();
  runApp(

      MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context)=>SignUpCubit(DioConsumer(dio: Dio()))) ,

        BlocProvider(
            create: (context)=>SignInCubit(DioConsumer(dio: Dio()))) ,
        BlocProvider(
            create: (context)=>LogoutCubit(DioConsumer(dio: Dio())))
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return  GetMaterialApp(
      initialBinding: Binding(), // Ensures dependencies are loaded
      theme: ThemeData(

        fontFamily: 'RobotoSlab',
      ),
      debugShowCheckedModeBanner: false,
      getPages:getPages,transitionDuration: const Duration(milliseconds: 700),
      home: SplashScreen (),
    );
  }}
