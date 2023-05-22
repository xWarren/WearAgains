import 'package:flutter/material.dart';

import '../../const/screens.dart';

class TextData {
  static Text haveAccountText = Text(
    "Don’t have an account?",
    style: TextStyleData.haveAccountStyle,
  );
  static Text registerText =
      Text("Register", style: TextStyleData.registerStyle);
  static Text loginText = Text("Login", style: TextStyleData.loginStyle);
  static Text forgotText =
      Text("Forgot Password?", style: TextStyleData.forgotStyle);
  static Text passwordText = const Text("Password");
  static Text emailText = const Text("Email");
  static Text welcomeText = Text(
    "Welcome",
    style: TextStyleData.welcomeStyle,
  );
}
