import 'package:e_commerce/controller/cubit/api/endPoints.dart';
import 'package:e_commerce/controller/cubit/errors/ServerException.dart';
import 'package:e_commerce/data/model/cart_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../core/services/services.dart';
import 'UserState.dart';
import 'api/api_consumer.dart';

class CartCubit extends Cubit<UserState> {
  MyServices myServices =Get.find();

  CartCubit(this.api) : super(UserInitial());
  final ApiConsumer api;

  addToCart(int quantity,int product_id,String color,String size)async{
    try{
      final response= await api.post(EndPoint.cart,data: {
        ApiKeys.product_id :product_id,
        ApiKeys.quantity :quantity,
        ApiKeys.color :color,
        ApiKeys.size :size,
      });
    }
    on ServerException catch(e){}

  }

  deleteFromCart(int id)async{
    await api.delete(EndPoint.deleteProduct(id));
  }


  confirmOrder()async{
    await api.post(EndPoint.confirm);
    emit(ConfirmSuccess());
  }


  showCart()async{
    try {
      emit(ShowCartLoading());
      final response = await api.get(EndPoint.cart);
      ShowCartModel showCartModel = ShowCartModel.fromJson(response);
      emit(ShowCartSuccess(
          total_items: showCartModel.total_items,
          cart: showCartModel.cart,
          final_total: showCartModel.final_total,
          total_delivery_charge: showCartModel.total_delivery_charge,
          total_price: showCartModel.total_price));
    }
    on ServerException catch(e){
      emit(ShowCartFailure(message: e.errModel.message));
    }

  }
}