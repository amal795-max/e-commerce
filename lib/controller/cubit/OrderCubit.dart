import 'package:e_commerce/controller/cubit/api/endPoints.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../core/services/services.dart';
import '../../data/model/Order_model.dart';
import 'UserState.dart';
import 'api/api_consumer.dart';

class OrderCubit extends Cubit<UserState> {
  MyServices myServices =Get.find();

  OrderCubit(this.api) : super(UserInitial());
  final ApiConsumer api;

  order()async{
    emit(OrderLoading());
     final response = await  api.get(EndPoint.order);
     O o=O.fromJson(response);
   // OrderModel orderModel =OrderModel.fromJson(response);
    emit(OrderSuccess(products: o.orders.expand((order) => order.product).toList(),orders: o.orders));
  }

  deleteOrder(int id)async{
    emit(OrderLoading());
     await  api.get(EndPoint.deleteOrder(id));
  }}
