import 'package:e_commerce/controller/cubit/UserState.dart';
import 'package:e_commerce/controller/cubit/api/api_consumer.dart';
import 'package:e_commerce/controller/cubit/api/endPoints.dart';
import 'package:e_commerce/controller/cubit/errors/ServerException.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/model/signin_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SignInCubit extends Cubit<UserState>{
  SignInCubit(this.api) : super(UserInitial());
  final ApiConsumer api;
  MyServices myServices =Get.find();
  GlobalKey<FormState> signInKey = GlobalKey();
  TextEditingController phoneNumber=TextEditingController();
  TextEditingController password=TextEditingController();

  signIn()async {
    if (signInKey.currentState!.validate()) {
      try {
        emit(SignInLoading());
        final response = await api.post(EndPoint.login, data: {
          ApiKeys.phone_number: phoneNumber.text,
          ApiKeys.password: password.text
        });
        SignInModel signInModel = SignInModel.fromJson(response);
        myServices.saveData(key: ApiKeys.token, value:signInModel.token);
        emit(SignInSuccess(message: signInModel.message));
      }
      on ServerException catch (e) {
        emit(SignInFailure(message: e.errModel.message,errors: e.errModel.getErrorMessages()));
      }
    }
    else {
      return null;
    }
  }}