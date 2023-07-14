import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wear_agains/const/color.dart';
import 'package:wear_agains/const/text_style.dart';

import '../app/authenticate/auth_controller.dart';

class AppBarWidget {
  AuthController authController = Get.put(AuthController());
  static AppBar appBarRegister = AppBar(
    elevation: 0,
    backgroundColor: ColorPalette.backgroundColor,
    title: const Text("Register", style: TextStyleData.appBarTitle),
    iconTheme: const IconThemeData(color: Colors.black),
  );
  static AppBar appBarOTP = AppBar(
    elevation: 0,
    backgroundColor: ColorPalette.backgroundColor,
    title: const Text("OTP", style: TextStyleData.appBarTitle),
    iconTheme: const IconThemeData(color: Colors.black),
  );
  static AppBar editProfile = AppBar(
    elevation: 0,
    backgroundColor: ColorPalette.backgroundColor,
    title: const Text("Edit Profile", style: TextStyleData.appBarTitle),
    iconTheme: const IconThemeData(color: Colors.black),
  );
  static AppBar shoes = AppBar(
    elevation: 0,
    backgroundColor: ColorPalette.backgroundColor,
    title: const Text("Shoes", style: TextStyleData.appBarTitle),
    iconTheme: const IconThemeData(color: Colors.black),
  );
  static AppBar tshirt = AppBar(
    elevation: 0,
    backgroundColor: ColorPalette.backgroundColor,
    title: const Text("T Shirt", style: TextStyleData.appBarTitle),
    iconTheme: const IconThemeData(color: Colors.black),
  );
  static AppBar cart = AppBar(
    elevation: 0,
    backgroundColor: ColorPalette.backgroundColor,
    title: const Text("Cart", style: TextStyleData.appBarTitle),
    iconTheme: const IconThemeData(color: Colors.black),
  );
}
