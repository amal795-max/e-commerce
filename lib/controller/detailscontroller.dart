import 'package:get/get.dart';

class DetailsController extends GetxController{
  int current = 0;

  pageChanged(int index) {
    current = index;
    update();
  }}

