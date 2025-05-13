import 'package:e_commerce/core/constants/appcolor.dart';
import 'package:e_commerce/view/widget/Loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../controller/cubit/UserState.dart';
import '../../controller/cubit/favoriteCubit.dart';
import '../../controller/cubit/getProductByIdCubit.dart';
import '../../core/constants/approutes.dart';
class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<FavoriteCubit>().getFavorites();

    return BlocConsumer<FavoriteCubit, UserState>(
      listener: (context, state) {},
      builder: (context, state) {
        return state is AllFavoriteSuccess
            ? Scaffold(appBar: AppBar(
            title: Text("my favorite".tr,),
          ),
          body: ListView.separated(
            itemCount: state.favorites.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.productDetails);
                  context.read<GetProductByIdCubit>().getProduct(state.favorites[index].product_id);                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 5),
                  child: ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.lightGrey,
                      ),
                      child: Image.network(
                          state.favorites[index].image_urls[0]),
                    ),
                    title: Text(
                      state.favorites[index].name,
                      style: const TextStyle(fontSize: 14),
                    ),
                    subtitle: Text("${state.favorites[index].price} \$"),
                    trailing: IconButton(
                      onPressed: () {
                        context.read<FavoriteCubit>().deleteFavorites(state.favorites[index].id);
                        context.read<FavoriteCubit>().getFavorites();


                      },
                      icon: Icon(Icons.favorite, color: AppColor.orange,size: 30),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                color: AppColor.lightGrey,
                thickness: 2,
                indent: 20,
                endIndent: 20,
              );
            },
          ),
        )

            :state is AllFavoriteFailure?Center(child: Text(state.message)): const Loading();
      },
    );
  }
}