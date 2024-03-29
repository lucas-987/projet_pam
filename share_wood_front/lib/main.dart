import 'package:flutter/material.dart';
import 'package:share_wood_front/component/app_color.dart';
import 'package:share_wood_front/front_pages/create_event.dart';

import 'package:share_wood_front/front_pages/register.dart';

import 'component/color_picker.dart';
import 'front_pages/app_bar.dart';
import 'front_pages/connexion.dart';

void main() {
  runApp(const MyApp());
  AppColors.loadColors();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LocEvent',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => Connexion(),
        '/register':(context)=>Register(),
        '/showEvents': (context)=>MyAppBar(),
        '/addEvent':(context)=>CreateEvent(),
        '/color_picker':(context)=>ColorPickerPage(),

      },
    );
  }
}
