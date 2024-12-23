import 'package:e_commerce/controller/cubit/api/endPoints.dart';

class GetAllStoresModel {
  final List<Store> stores;

  GetAllStoresModel({required this.stores});

  factory GetAllStoresModel.fromJson(Map<String, dynamic> jsonData) {
    return GetAllStoresModel(
      stores: List<Store>.from(jsonData['stores'].map((store) => Store.fromJson(store)),
      ),
    );
  }
}

class Store {
  final String name;
  final int id;
  final String store_image;
  final String description;
  final String created_at;
  final String updated_at;

  Store( {
    required this.name,
    required this.store_image,
    required this.description,
    required this.created_at,
    required this.updated_at,
    required this.id,
  });

  factory Store.fromJson(Map<String, dynamic> jsonData) {
    return Store(
      id: jsonData['id'] ?? 0,
      name: jsonData[ApiKeys.name] ?? '',
      store_image: jsonData[ApiKeys.store_image] ?? '',
      description: jsonData[ApiKeys.description] ?? '',
      created_at: jsonData[ApiKeys.created_at] ?? '',
      updated_at: jsonData[ApiKeys.updated_at] ?? '',
    );
  }
}
