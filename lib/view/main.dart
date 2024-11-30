import 'package:dio/dio.dart';
import 'package:e_commerce/view/routes.dart';
import 'package:e_commerce/view/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../controller/cubit/api/dio_consumer.dart';
import '../controller/cubit/signup_cubit.dart';
import 'screens/onboarding.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context)=>SignUpCubit(DioConsumer(dio: Dio()))) ,
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
      theme: ThemeData(

        fontFamily: 'RobotoSlab',
      ),
      debugShowCheckedModeBanner: false,
      getPages:getPages,transitionDuration: const Duration(milliseconds: 700),
      home: const OnBoarding(),
    );
  }
}
