import 'package:get/get.dart';

validInput(int max, int min, String type, String val) {
  if (val.isEmpty) {
    return "This field can't be empty".tr;
  }

  if (type == "phone number") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "Not a valid phone number".tr;
    }

  }

  if (val.length < min) {
    return "Can't be less than $min characters";
  }
  if (val.length > max) {
    return "Can't be more than $max characters";
  }
}

