import 'package:e_commerce/controller/cubit/api/endPoints.dart';

class SignUpModel{
  final String message;
  final String token;
  final String image_url;
  SignUpModel({required this.message,required this.token,required this.image_url});

  factory SignUpModel.fromJson(Map<String,dynamic>jsonData){
    return SignUpModel(
      message :jsonData[ApiKeys.message],
        image_url: jsonData[ApiKeys.image_url],
        token: jsonData[ApiKeys.token]
    );
  }

}
