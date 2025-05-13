class ShowCartModel {
  final List cart;
  var total_delivery_charge;
  var final_total;
  final int total_items;
  var total_price;

  ShowCartModel({
    required this.cart,
    required this.total_delivery_charge,
    required this.total_items,
    required this.total_price,
    required this.final_total,
  });

  factory ShowCartModel.fromJson(Map<String, dynamic> jsonData) {
    return ShowCartModel(
      cart: List<CartModel>.from(jsonData['products'].map((cart) => CartModel.fromJson(cart))),
      total_delivery_charge: jsonData['total_delivery_charge'] ,
      final_total: jsonData['final_total'] ,
      total_items: jsonData['total_items'],
      total_price: jsonData['total_price'],
    );
  }
}
class CartModel{
  final int id;
  final int product_id;
  final int quantity;
  final String name;
  final String price;
  final String selected_color;
  final String  selected_size;
  final List  image_urls;

  CartModel( {required this.id, required this.product_id, required this.quantity, required this.name,required this.price, required this.selected_color, required this.selected_size, required this.image_urls});
  factory CartModel.fromJson(Map<String, dynamic> jsonData) {
    return CartModel(
        id: jsonData['id'],
        product_id: jsonData['product_id'],
        quantity: jsonData['quantity'],
        name: jsonData['name'],
        selected_color: jsonData['selected_color'],
        selected_size: jsonData['selected_size'],
        price: jsonData['price'],
        image_urls:List.from(jsonData['image_urls']));}}

