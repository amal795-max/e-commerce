

import '../../controller/cubit/api/endPoints.dart';

class ResetPasswordModel{
  final String message;

  ResetPasswordModel({required this.message});
  factory ResetPasswordModel.fromJson(Map <String,dynamic>jsonData){
    return ResetPasswordModel(
        message: jsonData[ApiKeys.message]
    );}}
class SendCodeModel{
  final String message;

  SendCodeModel({required this.message});
  factory SendCodeModel.fromJson(Map <String,dynamic>jsonData){
    return SendCodeModel(
        message: jsonData[ApiKeys.message]
    );}}