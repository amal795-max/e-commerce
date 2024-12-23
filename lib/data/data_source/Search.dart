import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/cubit/AllStoresCubit.dart';
import '../../controller/cubit/UserState.dart';
import '../../controller/cubit/api/endPoints.dart';
import '../../view/widget/CustomStores.dart';

class search extends SearchDelegate{
  List stores=[];
  List filterList=[];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return[
      CloseButton(onPressed: (){},)] ; }

  @override
  Widget? buildLeading(BuildContext context) {
    return const BackButton();}

  @override
  Widget buildResults(BuildContext context) {
    return const Text("data");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return
      BlocConsumer<AllStoresCubit, UserState>(
          listener: (context, state){
            if(state is GetAllStoresSuccess){
              stores= List.generate(state.stores.length, (index)  {
                final store = state.stores[index];
                return {
                  ApiKeys.name: store.storeName,
                  ApiKeys.store_image: store.store_image,
                  ApiKeys.description: store.description,
                };
              });
            }
          },
          builder: (context, state) {
            filterList = stores.where((element) => (element[ApiKeys.name] as String).toLowerCase().contains(query.toLowerCase())).toList();
            if(filterList.isEmpty) {
              return const Center(child: Text("store not found !"));
            }else {   return Padding(
                padding: const EdgeInsets.all(10),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: filterList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CustomStores(
                        imageData: "http://192.168.1.112:8000/StoreImages/"+filterList[index][ApiKeys.store_image],
                        storeName: filterList[index][ApiKeys.name],
                        description: filterList[index][ApiKeys.description]);
                  },
                )
            );


            }});  }
}
