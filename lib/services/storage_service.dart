import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  Future<void> clearStorage() async {
    try{
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      print('[clearStorage] Succes clear');
    } catch (e) {
      print('[clearStirage] Error Occured');
    }
  }

  Future<void> setString(String key, String value) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(key, value);
      print('[setString] Succes SetString');
    } catch (e) {
      print('[setString] Error Occured $e');
    }
  }

  Future<void> setInt(String key, int value) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt(key, value);
      print('[setInt] Succes SetString');
    } catch (e) {
      print('[setInt] Error Occured $e');
    }
  }

  Future<void> setDouble(String key, double value) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setDouble(key, value);
      print('[setDouble] Succes SetString');
    } catch (e) {
      print('[setDouble] Error Occured $e');
    }
  }

  Future<void> setBool(String key, bool value) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(key, value);
      print('[setBool] Succes SetString');
    } catch (e) {
      print('[setBool] Error Occured $e');
    }
  }

  Future<String?> getString(String key) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final data = prefs.getString(key);

      return data;
    } catch (e) {
      print('[getString] Error Occured $e');
    }
  }

  Future<int?> getInt(String key) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final data = prefs.getInt(key);

      return data;
    } catch (e) {
      print('[getInt] Error Occured $e');
      return null;
    }
  }

  Future<double?> getDouble(String key) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final data = prefs.getDouble(key);

      return data;
    } catch (e) {
      print('[getDouble] Error Occured $e');
      return null;
    }
  }

  Future<bool?> getBool(String key) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final data = prefs.getBool(key);

      return data;
    } catch (e) {
      print('[getDouble] Error Occured $e');
      return null;
    }
  }
}