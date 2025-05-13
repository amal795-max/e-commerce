class O{
  final List orders;
  O({required this.orders});

  factory O.fromJson(Map<String, dynamic> jsonData) {
    return O(
        orders:List<OrderModel>.from(jsonData['orders'].map((orders)=>OrderModel.fromJson(orders))));}
}


class OrderModel{
  final int order_id;
  final int user_id;
  final int quantity;
   var total_price_with_delivery;
   var delivery_price;
   var total_price;
  final String status;
  final String created_at;
  final List product;

  OrderModel({ required this.order_id, required this.quantity,
    required this.total_price_with_delivery, required this.status,
    required this.created_at, required this.product,required this.delivery_price,required this.total_price,required this.user_id,});

  factory OrderModel.fromJson(Map<String, dynamic> jsonData) {
    return OrderModel(
        order_id: jsonData['order_id']??0,
        quantity: jsonData['quantity']??0,
        total_price_with_delivery: jsonData['total_price_with_delivery'],
        status: jsonData['status']??"",
        created_at: jsonData['created_at']??"",
        product: List<OrderProductModel>.from(jsonData['product'].map((order) => OrderProductModel.fromJson(order))),
        delivery_price: jsonData['delivery_price'],
        total_price:  jsonData['total_price'],
          user_id: jsonData['user_id'],
    );
  }
}



class OrderProductModel{
  final String price;
  final int quantity;
  final String name;
  final String store_name;
  final String selected_color;
  final String selected_size;

  OrderProductModel({required this.price, required this.quantity,
    required this.name, required this.store_name,required this.selected_color,required this.selected_size});

  factory OrderProductModel.fromJson(Map<String, dynamic> jsonData) {
    return OrderProductModel(
      price: jsonData['price'] ?? 0,
      name: jsonData['name'] ?? '',
      quantity: jsonData['quantity'] ?? 0,
      store_name: jsonData['store_name'] ?? '',
      selected_size:  jsonData['selected_size'] ,
      selected_color:  jsonData['selected_color'] ,
    );
  }
}