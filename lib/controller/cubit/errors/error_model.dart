import '../api/endPoints.dart';

class ErrorModel {
 final String message;

 ErrorModel( {required this.message,});

 factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
  return ErrorModel(
   message: jsonData[ApiKeys.message],
  // errors:
  );
 }
}
