import 'package:get/get.dart';

class visibility extends GetxController{
  bool obs = true;
  obscureText(){
    obs=!obs;
    update();


  }
}