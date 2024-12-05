import 'package:bloc/bloc.dart';
import 'package:e_commerce/controller/cubit/api/api_consumer.dart';
import 'package:e_commerce/controller/cubit/api/endPoints.dart';
import 'package:e_commerce/controller/cubit/errors/ServerException.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/model/signup_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/functions/uploadImageToApi.dart';
import 'UserState.dart';

class SignUpCubit extends Cubit<UserState>{
  SignUpCubit(this.api) : super(UserInitial());
  final ApiConsumer api;
  MyServices services =Get.find();
  GlobalKey<FormState> signUpKey = GlobalKey();
  TextEditingController firstName=TextEditingController();
  TextEditingController lastName=TextEditingController();
  TextEditingController phoneNumber=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController confirmPassword=TextEditingController();
  TextEditingController location=TextEditingController();
  XFile? profile;

  uploadProfilePicture(XFile image){
    profile=image;
    emit(UploadProfilePic());
  }

  signup()async {
    if (signUpKey.currentState!.validate()) {
      try {
        emit(SignUpLoading());
        final response = await api.post( isFromData: true, EndPoint.register, data: {
          ApiKeys.first_name: firstName.text,
          ApiKeys.last_name: lastName.text,
          ApiKeys.phone_number: phoneNumber.text,
          ApiKeys.password: password.text,
          ApiKeys.password_confirmation: confirmPassword.text,
          ApiKeys.location: location.text,
          ApiKeys.profile: await uploadImageToApi(profile!),
        });
        SignUpModel signUpModel = SignUpModel.fromJson(response);
        print(profile?.path);

        emit(SignUpSuccess(message: signUpModel.message));
      } on ServerException catch (e) {
        emit(SignUpFailure(
            message: e.errModel.message, error: e.errModel.errors!));
      }
    }else {
      return null;
    }
  }}