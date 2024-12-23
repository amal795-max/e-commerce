import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../core/services/services.dart';
import 'UserState.dart';
import 'api/api_consumer.dart';
import 'api/endPoints.dart';

class FavoriteCubit extends Cubit<UserState>{
  MyServices myServices =Get.find();
  FavoriteCubit(this.api) : super(UserInitial());
  final ApiConsumer api;

  addToFavorite()async{
      final response = await api.post(EndPoint.favorites,data: {
        ApiKeys.product_id:myServices.getData(key: ApiKeys.product_id)
      });
      emit(AddToFavoriteSuccess());
    }
}