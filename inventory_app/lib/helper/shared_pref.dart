import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
class SharedPref {
  Future<void> save(String key, bool value) async {
    final prefs =  await SharedPreferences.getInstance();
    prefs.setString(key, jsonEncode(value));
  }
  Future<bool> read(String key) async {
    final prefs =  await SharedPreferences.getInstance();
    String? prefString = prefs.getString(key);
    if(prefString == null) {
      return jsonDecode('false');
    } else {
      return jsonDecode(prefString);
    }
  }
  Future<void> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

}