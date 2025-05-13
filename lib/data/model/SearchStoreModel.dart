
import 'package:e_commerce/controller/cubit/api/endPoints.dart';

class SearchStoreModelList{
  final List data;

  SearchStoreModelList({required this.data});
  factory SearchStoreModelList.fromJson(Map<String, dynamic> jsonData){
    return SearchStoreModelList(
        data: List<SearchStoreModel>.from(jsonData['data'].map((store) => SearchStoreModel.fromJson(store))));

  }
}


class SearchStoreModel{
final  int id;
final  String name;
final  String store_image;
final  String description;

  SearchStoreModel({required this.id, required this.name, required this.store_image, required this.description});

  factory SearchStoreModel.fromJson(Map<String, dynamic> jsonData){
    return SearchStoreModel(
        id: jsonData[ApiKeys.id],
        name: jsonData[ApiKeys.name],
       store_image: jsonData[ApiKeys.store_image],
        description: jsonData[ApiKeys.description]);
  }


}
