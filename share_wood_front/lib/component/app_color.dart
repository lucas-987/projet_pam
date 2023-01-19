import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AppColors {
   static  Color primaryColor = Color(0xFFFF0000);
   static  Color secondaryColor = Color(0xFF000000);
   static  Color accentColor = Color(0xFFEEE011);


   static Future<void> saveColors() async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('primaryColor', primaryColor.value);
      await prefs.setInt('secondaryColor', secondaryColor.value);
      await prefs.setInt('accentColor', accentColor.value);
   }

   static Future<void> loadColors() async {
      final prefs = await SharedPreferences.getInstance();
      primaryColor = Color(prefs.getInt('primaryColor') ?? primaryColor.value);
      secondaryColor = Color(prefs.getInt('secondaryColor') ?? secondaryColor.value);
      accentColor = Color(prefs.getInt('accentColor') ?? accentColor.value);
   }
}