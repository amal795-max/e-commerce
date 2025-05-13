class AllFavorite{
  final List favorites;

  AllFavorite({required this.favorites});
  factory AllFavorite.fromJson(Map <String ,dynamic>jsonData){
    return AllFavorite(
      favorites:List<Favorite>.from(jsonData['favorites'].map((favorite)=>Favorite.fromJson(favorite)))
    );
  }

}


class Favorite{
  final String store_name;
  final String name;
  final int product_id;
  final int id;
  final String price;
  final List image_urls;

  Favorite({required this.store_name, required this.name, required this.price, required this.id,
    required this.image_urls, required this.product_id});
  factory Favorite.fromJson(Map<String ,dynamic>jsonData){
    return Favorite(
        store_name: jsonData["store_name"],
        name: jsonData["name"],
        product_id:jsonData['product_id'],
        price: jsonData["price"],
        image_urls: List.from(jsonData["image_urls"]),
        id: jsonData['id']);
  }
}