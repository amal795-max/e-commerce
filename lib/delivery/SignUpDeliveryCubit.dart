
import 'package:e_commerce/controller/cubit/UserState.dart';
import 'package:e_commerce/controller/cubit/api/api_consumer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../core/services/services.dart';
import '../data/model/signupDelivery_model.dart';
import '../controller/cubit/api/endPoints.dart';
import '../controller/cubit/errors/ServerException.dart';

class DeliverySignUpCubit extends Cubit<UserState>{
  DeliverySignUpCubit(this.api) : super(UserInitial());
  final ApiConsumer api;
  MyServices myServices = Get.find();
  GlobalKey<FormState> signupKey=GlobalKey();
  TextEditingController name =TextEditingController();
  TextEditingController phone =TextEditingController();
  TextEditingController password =TextEditingController();
  TextEditingController confirmPassword =TextEditingController();

  signUp()async{
    if(signupKey.currentState!.validate()){
      try{
        emit(DeliverySignUpLoading());
        final response= await api.post(EndPoint.registerDelivery,data: {
          ApiKeys.name :name.text,
          ApiKeys.phone :phone.text,
          ApiKeys.password_confirmation :confirmPassword.text,
          ApiKeys.password :password.text,
        });
        DeliverySignUpModel signUpModel =DeliverySignUpModel.fromJson(response);
        myServices.saveData(key: ApiKeys.token, value: signUpModel.token);

        emit(DeliverySignUpSuccess(message: signUpModel.message));

      }
      on ServerException catch(e){
        emit(DeliverySignUpFailure( errors: e.errModel.getErrorMessages(), message: e.errModel.message, ));

      }}
    else return null;
  }}

