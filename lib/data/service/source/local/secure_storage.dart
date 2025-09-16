import 'package:shared_preferences/shared_preferences.dart';

class SecureStorage {
  static late final SharedPreferences _instance;

  static Future<void> initSharedPref() async {
    _instance = await SharedPreferences.getInstance();
  }

  Future<void> setAccess(String access) async => await _instance.setString('access', access);

  String? getAccess() => _instance.getString('access');
}