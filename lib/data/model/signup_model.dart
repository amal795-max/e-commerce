import 'package:e_commerce/controller/cubit/api/endPoints.dart';

class SignUpModel{
  final String message;
  SignUpModel({required this.message});

  factory SignUpModel.fromJson(Map<String,dynamic>jsonData){
    return SignUpModel(
      message :jsonData[ApiKeys.message]
    );
  }

}
