import 'package:get/get.dart';

class Dark extends GetxController{
  bool value=false;
  on(){
    value=!value;
    update();
  }

}