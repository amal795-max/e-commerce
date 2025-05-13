import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/functions/uploadImageToApi.dart';
import '../../core/services/services.dart';
import '../../data/model/updateProfile_model.dart';
import 'UserState.dart';
import 'api/api_consumer.dart';
import 'api/endPoints.dart';
import 'errors/ServerException.dart';

class UpdateProfileCubit extends Cubit<UserState>{
  MyServices myServices =Get.find();
  UpdateProfileCubit(this.api) : super(UserInitial());
  final ApiConsumer api;
  TextEditingController updateFirstName=TextEditingController();
  TextEditingController updateLastName=TextEditingController();
  TextEditingController updateLocation=TextEditingController();
  XFile? profile;

  uploadProfilePicture(XFile image){
    profile=image;
    emit(UploadProfilePic());
  }

  updateProfile() async {
    try {
      emit(UpdateProfileLoading());

      final Map<String, dynamic> data = {};

      if (updateFirstName.text.isNotEmpty) {
        data[ApiKeys.first_name] = updateFirstName.text;
      }
      if (updateLastName.text.isNotEmpty) {
        data[ApiKeys.last_name] = updateLastName.text;
      }
      if (updateLocation.text.isNotEmpty) {
        data[ApiKeys.location] = updateLocation.text;
      }
      if (profile != null) {
        data[ApiKeys.image] = await uploadImageToApi(profile!);
      }

      final response = await api.post(
        isFromData: true, EndPoint.update, data: data,
      );
      UpdateProfileModel updateProfileModel=UpdateProfileModel.fromJson(response);
      myServices.saveData(key: ApiKeys.first_name, value: updateProfileModel.firstName);
      myServices.saveData(key: ApiKeys.last_name, value: updateProfileModel.lastName);
      myServices.saveData(key: ApiKeys.location, value: updateProfileModel.location);
      myServices.saveData(key: ApiKeys.image, value: updateProfileModel.image);

      emit(UpdateProfileSuccess());
    } on ServerException{
      emit(UpdateProfileFailure());
    }}}