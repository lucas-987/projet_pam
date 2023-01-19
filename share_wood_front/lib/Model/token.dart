
import 'package:shared_preferences/shared_preferences.dart';

class Token {
  static String auth = "";





  static Future<void> saveToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', auth);
  }

  static Future<void> loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    auth = prefs.getString('token')! ;

  }
}