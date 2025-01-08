import 'package:authapp/product/core/base/helper/shared_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefService {
  final prefs = SharedPreferences.getInstance();
  Future<void> saveString(SharedKeys key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key.value, value);
  }

  Future<String?> getString(SharedKeys key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key.value);
  }

  Future<void> remove(SharedKeys key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key.value);
  }

  Future<bool?> getBool(SharedKeys key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key.value);
  }

  Future<void> setBool(SharedKeys key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key.value, value);
  }

  Future<int?> getInt(SharedKeys key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key.value);
  }

  Future<void> setInt(SharedKeys key, int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key.value, value);
  }
}
