import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesKeys {
  static const String cartItems = 'cart_items';
}

class SharedPreferencesService {
  static late SharedPreferences _instance;

  static SharedPreferences get instance => _instance;

  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  static Future<String?> getString(String key) async {
    await Future.delayed(const Duration(seconds: 1)); // test
    var value = _instance.getString(key);
    return value;
  }

  static Future<bool> setString(String key, String value) async {
    await Future.delayed(const Duration(seconds: 1)); // test
    var result = _instance.setString(key, value);
    return result;
  }

  static Future<bool> remove(String key) async {
    await Future.delayed(const Duration(seconds: 1)); // test
    var result = _instance.remove(key);
    return result;
  }
}
