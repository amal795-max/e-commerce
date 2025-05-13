import 'package:e_commerce/controller/cubit/api/endPoints.dart';
import 'package:e_commerce/controller/cubit/errors/ServerException.dart';
import 'package:e_commerce/data/model/GetProductById_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../core/services/services.dart';
import 'UserState.dart';
import 'api/api_consumer.dart';

class GetProductByIdCubit extends Cubit<UserState> {
  MyServices myServices = Get.find();

  GetProductByIdCubit(this.api) : super(UserInitial());
  final ApiConsumer api;


   getProduct(int product_id)async{
     try{
       emit(GetProductByIdLoading());
     final response =await api.get(EndPoint.productById(product_id));
    GetProductByIdModel getProductByIdModel =GetProductByIdModel.fromJson(response);
       emit(GetProductByIdSuccess(
           getProductByIdModel.name,
           getProductByIdModel.description,
           getProductByIdModel.price,
           getProductByIdModel.image_urls,
           getProductByIdModel.colors_array,
           getProductByIdModel.sizes_array,
       getProductByIdModel.id,
       getProductByIdModel.available_quantity
       ));

     }on ServerException catch(e){}}
}
