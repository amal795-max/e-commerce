class GetProductByIdModel{
  final int id;
  final String name;
  final int available_quantity;
  final String description;
  final String price;
  final String type_text;
  final int quantity;
  final List<String> image_urls;
  final Map<String,String> colors_array;
  final Map<String,String> sizes_array;

  GetProductByIdModel( {required this.id,required this.available_quantity, required this.name, required this.description, required this.price, required this.type_text, required this.quantity, required this.image_urls, required this.colors_array, required this.sizes_array});

  factory GetProductByIdModel.fromJson(Map <String,dynamic>jsonData){
    return GetProductByIdModel(
        id: jsonData['product']['id']??0,
        name: jsonData['product']['name']??'',
        description:jsonData['product']['description']??'',
        price: jsonData['product']['price']??'',
        type_text: jsonData['product']['type_text']??'',
        quantity: jsonData['product']['quantity']??'',
        image_urls: List.from(jsonData['product']['image_urls']??''),
        colors_array: Map<String,String>.from(jsonData['product']['colors_array']??''),
        sizes_array: Map<String,String>.from(jsonData['product']['sizes_array']??''),

        available_quantity: jsonData['available_quantity']);
  }
}