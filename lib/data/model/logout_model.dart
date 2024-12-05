import 'package:e_commerce/controller/cubit/api/endPoints.dart';

class LogoutModel{
  final String message;

  LogoutModel({required this.message});

  factory LogoutModel.fromJson(Map<String,dynamic>jsonData){
    return LogoutModel(
        message: jsonData[ApiKeys.message]);
  }
}