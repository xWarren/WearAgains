import 'package:flutter/material.dart';
import 'package:wear_agains/const/color.dart';
import 'package:wear_agains/const/text_style.dart';

class AppBarWidget {
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
}
