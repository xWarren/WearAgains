import 'package:flutter/material.dart';
import '../../const/screens.dart';

class TextStyleData {
  //App Bar
  static const TextStyle appBarTitle =
      TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black);

  //Login
  static const TextStyle haveAccountStyle =
      TextStyle(fontSize: 12, fontWeight: FontWeight.w600);
  static const TextStyle registerStyle = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: ColorPalette.textButtonColor);
  static const TextStyle loginStyle =
      TextStyle(fontSize: 25, fontWeight: FontWeight.w600);
  static const TextStyle forgotStyle = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: ColorPalette.textButtonColor);
  static const TextStyle welcomeStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  // Profile
  static const TextStyle profileTextStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const TextStyle profileNameTextStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w600);
  static const TextStyle editProfileTextStyle =
      TextStyle(fontSize: 15, fontWeight: FontWeight.w700);
}
