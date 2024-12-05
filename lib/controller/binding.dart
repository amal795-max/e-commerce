
import 'package:get/get.dart';
import 'detailscontroller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsController>(() => DetailsController());
  }
}

