
import 'package:e_commerce/controller/cubit/api/endPoints.dart';
import 'package:e_commerce/controller/cubit/errors/ServerException.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../core/services/services.dart';
import '../../data/model/sendCode_model.dart';
import 'UserState.dart';
import 'api/api_consumer.dart';

class ResetPasswordCubit extends Cubit<UserState>{
  final ApiConsumer api;
  ResetPasswordCubit(this.api) : super(UserInitial());

  MyServices myServices =Get.find();
  GlobalKey<FormState> verifyKey = GlobalKey();
  GlobalKey<FormState> sendKey = GlobalKey();
  GlobalKey<FormState> resetKey = GlobalKey();
  TextEditingController email=TextEditingController();
  TextEditingController code=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController password_confirmation=TextEditingController();

  sendCode()async{
    if (sendKey.currentState!.validate()) {
      try{
      emit(SendCodeLoading());
    final response= await api.post(EndPoint.sendCode,data: {
      ApiKeys.email:email.text
    });
      SendCodeModel sendCodeModel=SendCodeModel.fromJson(response);
    emit(SendCodeSuccess(message: sendCodeModel.message));
      }
        on ServerException catch(e){
        emit(SendCodeFailure(message: e.errModel.message, errors: 'kgkjhk'));
        }}
    return null;
  }

     verifyCode()async{
    try{
      emit(VerifyCodeLoading());
      final response =await api.post(EndPoint.verify,data: {
      ApiKeys.email:email.text,
      ApiKeys.code:code.text,
    });
      emit(VerifyCodeSuccess());
    }
  on ServerException catch(e){
    emit(VerifyCodeFailure(message: e.errModel.message, errors: e.errModel.getErrorMessages()));

  }}
      resetPassword()async{
    if(resetKey.currentState!.validate()){
    try{
      emit(ResetPasswordLoading());
      final  response =await api.post(EndPoint.resetPassword,data: {
      ApiKeys.email:email.text,
      ApiKeys.password:password.text,
      ApiKeys.password_confirmation:password_confirmation.text,
    });
    ResetPasswordModel resetPasswordModel=ResetPasswordModel.fromJson(response);
      emit(ResetPasswordSuccess(message: resetPasswordModel.message));
    }
        on ServerException catch(e){
      emit(ResetPasswordFailure(message: e.errModel.message));

        }}
    else {
      return null;
    }

 }
}