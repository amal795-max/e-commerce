import 'package:e_commerce/controller/cubit/api/endPoints.dart';
import 'package:e_commerce/controller/cubit/searchCubit.dart';
import 'package:e_commerce/view/screens/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../controller/cubit/UserState.dart';
import '../../core/services/services.dart';
import '../../view/widget/CustomStores.dart';
import '../../view/widget/Loading.dart';
class SearchStore extends SearchDelegate {SearchStore(BuildContext context);
  MyServices myServices=Get.find();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      CloseButton(
        onPressed: () {
          query = '';
          showSuggestions(context);},),
    ];
  }
  @override
  Widget? buildLeading(BuildContext context) {
    return  const BackButton();
}

  @override
  Widget buildResults(BuildContext context) {
    if(query.isEmpty)
      return SizedBox();

    context.read<SearchCubit>().searchStore(query);
    return BlocConsumer<SearchCubit, UserState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is SearchStoreSuccess) {
          if (state.searchStores.isEmpty) {
            return  Center(child: Text("No stores found".tr, style: TextStyle(fontSize: 15)));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: state.searchStores.length,
            itemBuilder: (BuildContext context, int index) {
              return CustomStores(
                onTap: (){
                  myServices.saveData(key: ApiKeys.selectedStoreId, value: state.searchStores[index].id);
                  Get.off(()=> const TabBarPage());
                },
                imageData: state.searchStores[index].store_image,
                storeName: state.searchStores[index].name,
                description: state.searchStores[index].description,
              );
            },
          );
        } else if (state is SearchStoreLoading) {
          return const Loading();
        } else {
          return  Center(child: Text("Search to find stores".tr, style: TextStyle(fontSize: 15)));
        }
      },
    );
  }
  @override
  Widget buildSuggestions(BuildContext context) {
   if (query.isEmpty) {
      return const SizedBox();
    }
    context.read<SearchCubit>().searchStore(query);

    return BlocConsumer<SearchCubit, UserState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is SearchStoreSuccess) {
          if (state.searchStores.isEmpty) {
            return  Center(child: Text("No suggestions available".tr, style: TextStyle(fontSize: 15)));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: state.searchStores.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  query = state.searchStores[index].name;
                  showResults(context);
                  },
                title: Text(state.searchStores[index].name),
                subtitle: Text(state.searchStores[index].description),
                leading: Image.network(
                  state.searchStores[index].store_image,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              );
            },
          );
        } else if (state is SearchStoreLoading) {
          return const Loading();
        } else {
          return  Center(child: Text("Start typing to see suggestions".tr, style: TextStyle(fontSize: 18),),);
        }
      },
    );
}
}
