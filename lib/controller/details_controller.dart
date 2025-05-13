import 'package:get/get.dart';

class FavoriteController extends GetxController{
   bool  isFavorite = true;

  stateChange() {
    isFavorite = !isFavorite;
    update();
  }}

