import 'package:e_commerce/controller/cubit/UserState.dart';
import 'package:e_commerce/controller/cubit/api/endPoints.dart';
import 'package:e_commerce/controller/cubit/errors/ServerException.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../core/services/services.dart';
import '../../data/model/ShowUserById_model.dart';
import '../../data/model/showuser_model.dart';
import 'api/api_consumer.dart';

class ShowUserCubit extends Cubit<UserState>{
  MyServices myServices =Get.find();
  ShowUserCubit(this.api) : super(UserInitial());
  final ApiConsumer api;


  fetchUserProfile()async{
    try{
      emit(ShowUserLoading());
    final response=await api.post(EndPoint.profile);
      ShowUserModel showUser = ShowUserModel.fromJson(response);
      myServices.saveData(key: ApiKeys.first_name, value: showUser.firstName);
      myServices.saveData(key: ApiKeys.last_name, value: showUser.lastName);
      myServices.saveData(key: ApiKeys.location, value: showUser.location);
      myServices.saveData(key: ApiKeys.image, value: showUser.image);
    emit(ShowUserSuccess());
      }on ServerException catch(e){
      emit(ShowUserFailure());
    }}


  fetchUserByIdProfile(int id)async{
    try{
      emit(ShowUserBuIdLoading());
      final response=await api.get(EndPoint.showUserById(id));
      ShowUserByIdModel showUserByIdModel = ShowUserByIdModel.fromJson(response);
      emit(ShowUserByIdSuccess(
          first_name: showUserByIdModel.first_name,
        last_name: showUserByIdModel.last_name,
        location: showUserByIdModel.location,
        image: showUserByIdModel.image,
        phone_number: showUserByIdModel.phone_number,
      ));
    }on ServerException catch(e){
      emit(ShowUserByIdFailure());
    }}

}