import '../../controller/cubit/api/endPoints.dart';

class ShowUserByIdModel{
  final String first_name;
  final String last_name;
  final String location;
  final String image;
  final int phone_number;

  ShowUserByIdModel({required this.first_name, required this.last_name, required this.location, required this.image, required this.phone_number});


  factory ShowUserByIdModel.fromJson(Map<String, dynamic> jsonData) {
    final userData = jsonData[ApiKeys.user];
    return ShowUserByIdModel(
      first_name: userData[ApiKeys.first_name] ?? '',
      last_name: userData[ApiKeys.last_name] ?? '',
      location: userData[ApiKeys.location] ?? '',
      image: userData[ApiKeys.image] ?? '',
      phone_number:  jsonData[ApiKeys.phone_number] ,
    );
  }

}