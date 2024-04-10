// @dart=2.9
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:tutoriales2/rutas/app_page.dart';

import 'rutas/app_page.dart';

void main() => {
      runApp(new MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFFFFFFF)),
        home: new MyApp(),
      ))
    };

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 5,
      navigateAfterSeconds: new App(0),
      image: new Image.asset('assets/images/pomelo.png'),
      title: Text(
        "Pomelo´s",
        style: TextStyle(fontSize: 20),
      ),
      backgroundColor: Colors.white,
      loaderColor: Colors.transparent,
      photoSize: 100,
    );
  }
}
