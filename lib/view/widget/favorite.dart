import 'package:e_commerce/controller/cubit/UserState.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../controller/cubit/favoriteCubit.dart';
import '../../core/constants/appColor.dart';

class FavoriteWidget extends StatelessWidget {
  final int id;
  const FavoriteWidget({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
MyServices myServices=Get.find();
return BlocConsumer<FavoriteCubit,UserState>(
      listener: (BuildContext context, state) {
      if(state is AddToFavoriteSuccess){
      myServices.saveData(key: "fav", value: state.id);
      }},
        builder: (context, state) {
          final isFavorite= context.read<FavoriteCubit>().favorites.contains(id);
          return Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: AppColor.lightGrey2,
                shape: BoxShape.circle,
              ),
              child: IconButton(onPressed: () {
                if (isFavorite) {
                  context.read<FavoriteCubit>().deleteFavorites(myServices.getData(key: "fav"));
                  context.read<FavoriteCubit>().favorites.remove(id);
                } else {
                  context.read<FavoriteCubit>().addToFavorite(id);
                }
              },
                icon: Icon(isFavorite==true?Icons.favorite:Icons.favorite_border,
                color:AppColor.red,),
              ),

          );});
  }
}
