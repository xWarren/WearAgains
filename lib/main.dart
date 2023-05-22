import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wear_agains/app/authenticate/login.dart';

import 'package:wear_agains/const/image.dart';
import 'package:wear_agains/const/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: getPages,
      home: AnimatedSplashScreen(
          splash: Image.asset(
            Assets.wearagainslogo,
            height: 450,
          ),
          duration: 3000,
          nextScreen: const LoginScreen()),
    );
  }
}
