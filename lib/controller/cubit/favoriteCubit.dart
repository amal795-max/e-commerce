import 'package:e_commerce/controller/cubit/errors/ServerException.dart';
import 'package:e_commerce/data/model/addtofavorite_model.dart';
import 'package:e_commerce/data/model/getFavorites_model.dart';
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
  List<int> favorites = [];

  addToFavorite(int product_id)async{
    try{
   final response = await api.post(EndPoint.favorites,data: {
        ApiKeys.product_id : product_id
      });
    AddToFavorite addToFavorite =AddToFavorite.fromJson(response);
    emit(AddToFavoriteSuccess(message: addToFavorite.message,id: addToFavorite.id));
   favorites.add(product_id);

    }
   on ServerException catch(e){
     emit(AddToFavoriteFailure());    }
    }

    getFavorites()async{
    try {
      emit(AllFavoriteLoading());
      final response = await api.get(EndPoint.favorites);
      AllFavorite allFavorite = AllFavorite.fromJson(response);
      emit(AllFavoriteSuccess(favorites:allFavorite.favorites));
    }
   on ServerException catch (e){
      emit(AllFavoriteFailure(message: e.errModel.message));
    }
  }

    deleteFavorites(int id)async{

      await api.delete(EndPoint.deleteFromFavorite(id));
      emit(DeleteFromFavoriteSuccess());
    }
}