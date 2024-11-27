import 'package:get/get.dart';

valid(int max,int min,String type,dynamic val){
  if(GetUtils.isPhoneNumber(val)) {
    return "not valid phone number";
  }

  if(val.length>max) {
    return "can't be more than $max";
  }
  if(val.length<min) {
    return "can't be less than $min";
  }

}