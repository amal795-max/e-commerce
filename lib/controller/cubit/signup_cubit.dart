import 'package:bloc/bloc.dart';
import 'package:e_commerce/controller/cubit/api/api_consumer.dart';
import 'package:e_commerce/controller/cubit/api/endPoints.dart';
import 'package:e_commerce/controller/cubit/errors/ServerException.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/functions/uploadImageToApi.dart';
import 'UserState.dart';

class SignUpCubit extends Cubit<UserState>{
  SignUpCubit(this.api) : super(UserInitial());
  final ApiConsumer api;

  TextEditingController firstName=TextEditingController();
  TextEditingController lastName=TextEditingController();
  TextEditingController phoneNumber=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController confirmPassword=TextEditingController();
  TextEditingController location=TextEditingController();
  XFile? profile;


  signup()async{
    try{
      emit(SignUpLoading());
    final response = await api.post(EndPoint.register,data: {
      ApiKeys.first_name:firstName.text,
      ApiKeys.last_name:lastName.text,
      ApiKeys.phone_number:phoneNumber.text,
      ApiKeys.password:password.text,
      ApiKeys.password_confirmation:confirmPassword.text,
      ApiKeys.location:location.text,
      ApiKeys.profile:await uploadImageToApi(profile!),
    });
    emit(SignUpSuccess());
  } on ServerException catch(e){
      emit(SignUpFailure());

    }
    }
}