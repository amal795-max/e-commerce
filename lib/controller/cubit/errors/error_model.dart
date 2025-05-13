import '../api/endPoints.dart';

class ErrorModel {
 final String message;
 final String error;
 final Map<String,String> errors;

 ErrorModel({required this.message, required this.errors,required this.error});

 String getErrorMessages() {
  return errors.entries.map((entry) => '- ${entry.value}').join('\n');
 }

 factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
  return ErrorModel(

   message: jsonData[ApiKeys.message]??'',
   errors:Map<String,String>.from(jsonData[ApiKeys.errors]??{}),
   error:jsonData[ApiKeys.error]??'',
   // errors:
  );
 }
}
