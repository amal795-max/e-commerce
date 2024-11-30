import '../api/endPoints.dart';

class ErrorModel{
 final String message;
 final String errors;

  ErrorModel({required this.message, required this.errors});
  factory ErrorModel.fromJson(Map<String,dynamic> jsonData){
    return ErrorModel(
        message: jsonData[ApiKeys.message],
        errors: jsonData[ApiKeys.errors]);
  }
}