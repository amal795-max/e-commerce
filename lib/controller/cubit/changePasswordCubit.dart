import 'package:e_commerce/controller/cubit/UserState.dart';
import 'package:e_commerce/controller/cubit/api/api_consumer.dart';
import 'package:e_commerce/controller/cubit/api/endPoints.dart';
import 'package:e_commerce/controller/cubit/errors/ServerException.dart';
import 'package:e_commerce/data/model/updateProfile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordCubit extends Cubit<UserState>{
  final ApiConsumer api;
  ChangePasswordCubit(this.api) : super(UserInitial());
  GlobalKey<FormState> changePasswordKey = GlobalKey();
  TextEditingController currentPassword=TextEditingController();
  TextEditingController newPassword=TextEditingController();
  TextEditingController confirmNewPassword=TextEditingController();

  changePassword()async{
    if(changePasswordKey.currentState!.validate()){
    try{
      emit(ChangePasswordLoading());
    final response =await api.post(EndPoint.changePassword,data: {
      "current_password":currentPassword.text,
      "new_password":newPassword.text,
      "new_password_confirmation":confirmNewPassword.text,
    });
    ChangePasswordModel changePasswordModel =ChangePasswordModel.fromJson(response);
    emit(ChangePasswordSuccess(message: changePasswordModel.message));
  }on ServerException catch(e){
      emit(ChangePasswordFailure(message: e.errModel.message, errors:e.errModel.getErrorMessages()));

    }}else return null;
}}