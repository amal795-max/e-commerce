
import '../../controller/cubit/api/endPoints.dart';

class DeliverySignUpModel{
  final String message;
  final String token;

  DeliverySignUpModel({required this.token,required this.message});
  factory DeliverySignUpModel.fromJson(Map<String,dynamic>jsonData){
    return DeliverySignUpModel(
        token: jsonData[ApiKeys.token],
        message: jsonData[ApiKeys.message]);
  }
}