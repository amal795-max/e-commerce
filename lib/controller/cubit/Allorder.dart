
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../core/services/services.dart';
import '../../data/model/Order_model.dart';
import 'UserState.dart';
import 'api/api_consumer.dart';
import 'api/endPoints.dart';

class AllOrderCubit extends Cubit<UserState> {
  MyServices myServices =Get.find();

  AllOrderCubit(this.api) : super(UserInitial());
  final ApiConsumer api;

  order()async{
    emit(OrderLoading());
    final response = await  api.get(EndPoint.orders);
    O o=O.fromJson(response);
    // OrderModel orderModel =OrderModel.fromJson(response);
    emit(OrderSuccess(products: o.orders.expand((order) => order.product).toList(),orders: o.orders));
  }
orderState(int id,String status)async{
   await api.patch(EndPoint.orderState(id), data: {
    "status":status
  });
print("done change status");
}}