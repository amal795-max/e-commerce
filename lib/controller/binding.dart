
import 'package:get/get.dart';
import 'details_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoriteController>(() => FavoriteController());
  }
}

