import 'package:e_commerce/controller/cubit/api/endPoints.dart';
class SignInModel{
  final String message;
  final String token;

  SignInModel({required this.message, required this.token});

  factory SignInModel.fromJson(Map<String,dynamic>jsonData){
    return SignInModel(
        message: jsonData[ApiKeys.message],
        token: jsonData[ApiKeys.token]);
  }
}