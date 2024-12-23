import 'package:e_commerce/controller/cubit/UserState.dart';
import 'package:e_commerce/controller/cubit/api/api_consumer.dart';
import 'package:e_commerce/controller/cubit/api/endPoints.dart';
import 'package:e_commerce/controller/cubit/errors/ServerException.dart';
import 'package:e_commerce/data/model/getallstores_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../core/services/services.dart';

class AllStoresCubit extends Cubit<UserState>{
  MyServices services =Get.find();
  final ApiConsumer api;
  AllStoresCubit(this.api) : super(UserInitial());

  getAllStores()async{
    try{
      emit(GetAllStoresLoading());
      final response =await api.get(EndPoint.stores);
      GetAllStoresModel getAllStoresModel=GetAllStoresModel.fromJson(response);

      emit(GetAllStoresSuccess(stores: getAllStoresModel.stores));

    }on ServerException catch(e){
      emit(GetAllStoresFailure());
    }
  }
}