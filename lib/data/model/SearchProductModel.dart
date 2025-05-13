class SearchProductModelList{
  final List data;
  SearchProductModelList({required this.data});

  factory SearchProductModelList.fromJson(Map<String,dynamic>jsonData){
    return SearchProductModelList(
     data: List<SearchProductModel>.from(jsonData['data'].map((e) => SearchProductModel.fromJson(e))));

  }
}


class SearchProductModel{
  final  int id;
  final  String name;
  final  String price;
  final  List image_urls;

  SearchProductModel({required this.id, required this.name, required this.price, required this.image_urls});
  factory SearchProductModel.fromJson(Map<String,dynamic>jsonData){
    return SearchProductModel(
        id: jsonData['id'],
        name: jsonData['name'],
        price: jsonData['price'],
        image_urls: List.from(jsonData['image_urls']));
  }
}