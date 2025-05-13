import 'package:e_commerce/controller/cubit/UserState.dart';
import 'package:e_commerce/controller/cubit/api/api_consumer.dart';
import 'package:e_commerce/controller/cubit/api/endPoints.dart';
import 'package:e_commerce/controller/cubit/errors/ServerException.dart';
import 'package:e_commerce/data/model/logout_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoutCubit extends Cubit<UserState>{
  final ApiConsumer api;

  LogoutCubit(this.api):super(UserInitial());


  logout()async{
    try{
      emit(LogOutLoading());
    final response =await api.get(EndPoint.logout);
    
    LogoutModel logoutModel = LogoutModel.fromJson(response);
  emit(LogOutSuccess(message: logoutModel.message));
  }
  on ServerException catch(e){
      emit(LogOutFailure(message: e.errModel.message));

    }
}

  logoutDriver()async{
    try{
      emit(LogOutLoading());
    final response =await api.get(EndPoint.logout);

    LogoutModel logoutModel = LogoutModel.fromJson(response);
  emit(LogOutSuccess(message: logoutModel.message));
  }
  on ServerException catch(e){
      emit(LogOutFailure(message: e.errModel.message));

    }
}}