import '../../controller/cubit/api/endPoints.dart';

class ShowUserModel {
  final String firstName;
  final String lastName;
  final String location;
  final String image;

  ShowUserModel({
    required this.firstName,
    required this.lastName,
    required this.location,
    required this.image,
  });

  factory ShowUserModel.fromJson(Map<String, dynamic> jsonData) {
    final userData = jsonData[ApiKeys.user];
    return ShowUserModel(
      firstName: userData[ApiKeys.first_name] ?? '',
      lastName: userData[ApiKeys.last_name] ?? '',
      location: userData[ApiKeys.location] ?? '',
      image: userData[ApiKeys.image] ?? '',
    );
  }

  }

