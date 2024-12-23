import 'dart:ui';
import 'package:e_commerce/core/services/services.dart';
import 'package:get/get.dart';

class Localization extends GetxController{
  String selectedLanguage = 'Option 2';
  MyServices myServices =Get.find();
  Locale ? language;
  changeLanguage(String lang){
    Locale locale =Locale(lang);
    myServices.saveData(key: "language", value: lang);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String?savedLanguage=myServices.getData(key: "language");
    if(savedLanguage=="ar") {
      language=const Locale('ar');
    }

    else if(savedLanguage=='en') {
      language = const Locale('en');
    }
    else{
      language =Locale(Get.deviceLocale!.languageCode);}
    super.onInit();

  }
}