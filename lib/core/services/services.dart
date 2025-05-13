import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  static late SharedPreferences sharedPreferences;

  Future<MyServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> saveData(
      {required String key, required dynamic value}) async {
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    }
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    }
    if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else {
      return await sharedPreferences.setDouble(key, value);
    }
  }


  dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }


  Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  Future<bool> containsKey({required String key}) async {
    return sharedPreferences.containsKey(key);
  }

  Future<bool> clearData({required String key}) async {
    return sharedPreferences.clear();
  }

}
initializeServices() async {
  await Get.putAsync(()=>MyServices().init());
}
