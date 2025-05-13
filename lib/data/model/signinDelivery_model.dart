
import '../../controller/cubit/api/endPoints.dart';

class DeliverySignInModel{
  final String message;
  final String token;
  final String name;

  DeliverySignInModel( {required this.token,required this.message,required this.name});
  factory DeliverySignInModel.fromJson(Map<String,dynamic>jsonData){
    return DeliverySignInModel(
        token: jsonData[ApiKeys.token],
        message: jsonData[ApiKeys.message],
        name: jsonData['driver'][ApiKeys.name]);
  }
}