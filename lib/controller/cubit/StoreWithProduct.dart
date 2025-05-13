import 'package:e_commerce/controller/cubit/api/endPoints.dart';
import 'package:e_commerce/controller/cubit/errors/ServerException.dart';
import 'package:e_commerce/data/model/products_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../core/services/services.dart';
import 'UserState.dart';
import 'api/api_consumer.dart';

class StoreWithProductCubit extends Cubit<UserState> {
  MyServices myServices = Get.find();

  StoreWithProductCubit(this.api) : super(UserInitial());
  final ApiConsumer api;

  product() async {
    try {
      emit(GetProductLoading());

      final int? storeId = myServices.getData(key: ApiKeys.selectedStoreId);

      final response = await api.get(EndPoint.product(storeId));
      GetAllProduct getAllProduct = GetAllProduct.fromJson(response);

      emit(GetProductSuccess(products: getAllProduct.products,
          storeName: getAllProduct.storeName));
    } on ServerException catch (e) {
      emit(GetProductFailure());
    }
  }
}