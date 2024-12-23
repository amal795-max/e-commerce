class GetAllProduct {
  final List<ProductModel> products;
  final String storeName;

  GetAllProduct({required this.products, required this.storeName, });

  factory GetAllProduct.fromJson(Map<String, dynamic> jsonData) {
    return GetAllProduct(
  products: List<ProductModel>.from((jsonData['store']['products'] as List).map((product) => ProductModel.fromJson(product))),
      storeName: jsonData['store']['name']??"",
    );
  }
}

class ProductModel {
  final int id;
  final String name;
  final String description;
  final String price;
  final String typeText;
  final int quantity;
  final int storeId;
  final List<String> imageUrls;
  final Map<String, String> colors;
  final Map<String, String> sizes;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.typeText,
    required this.quantity,
    required this.storeId,
    required this.imageUrls,
    required this.colors,
    required this.sizes,
  });

  factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductModel(
      id: jsonData['id'] ?? 0,
      name: jsonData['name'] ?? '',
      description: jsonData['description'] ?? '',
      price: jsonData['price'] ?? '',
      typeText: jsonData['type_text'] ?? '',
      quantity: jsonData['quantity'] ?? 0,
      storeId: jsonData['store_id'] ?? 0,
      imageUrls: List<String>.from(jsonData['image_urls'] ?? []),
      colors: Map<String, String>.from(jsonData['colors_array'] ?? []),
      sizes: Map<String, String>.from(jsonData['sizes_array'] ?? []),
    );
  }
}
