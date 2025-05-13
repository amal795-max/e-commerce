import 'package:e_commerce/controller/cubit/UserState.dart';
import 'package:e_commerce/controller/cubit/api/api_consumer.dart';
import 'package:e_commerce/controller/cubit/api/endPoints.dart';
import 'package:e_commerce/controller/cubit/errors/ServerException.dart';
import 'package:e_commerce/data/model/SearchProductModel.dart';
import 'package:e_commerce/data/model/SearchStoreModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../core/services/services.dart';

class SearchCubit extends Cubit<UserState>{
  SearchCubit(this.api) : super(UserInitial());
  MyServices myServices=Get.find();

  final ApiConsumer api;

  searchStore(String query)async{
    try{
      emit(SearchStoreLoading());
    final response =await api.get(EndPoint.searchStore, data:{
      ApiKeys.query:query
    });
    SearchStoreModelList searchStoreModelList= SearchStoreModelList.fromJson(response);
    emit(SearchStoreSuccess(searchStores: searchStoreModelList.data));
    }
    on ServerException catch(e){}



  }


  searchProduct(String query)async{
    try{
      emit(SearchProductLoading());
    final response = await api.get(EndPoint.searchProduct,data: {
      ApiKeys.store_id: myServices.getData(key: ApiKeys.selectedStoreId),
      ApiKeys.query :query
    });
    SearchProductModelList searchProductModelList=SearchProductModelList.fromJson(response);
      emit(SearchProductSuccess(searchProducts: searchProductModelList.data));
    }
    on ServerException catch(e){}

  }
}