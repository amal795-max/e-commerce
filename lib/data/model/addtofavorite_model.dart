import 'package:e_commerce/controller/cubit/api/endPoints.dart';

class AddToFavorite{

  final String message;
  final int id;

  AddToFavorite({required this.message, required this.id});
  factory AddToFavorite.fromJson(Map<String,dynamic>jsonData){
    return AddToFavorite(
        id: jsonData[ApiKeys.id],
      message: jsonData[ApiKeys.message]
        );
}}