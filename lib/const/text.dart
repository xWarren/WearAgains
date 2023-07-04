import 'package:flutter/material.dart';

import '../../const/screens.dart';

class TextData {
  static const Text haveAccountText = Text(
    "Don’t have an account?",
    style: TextStyleData.haveAccountStyle,
  );
  static const Text registerText =
      Text("Register", style: TextStyleData.registerStyle);
  static const Text loginText = Text("Login", style: TextStyleData.loginStyle);
  static const Text forgotText =
      Text("Forgot Password?", style: TextStyleData.forgotStyle);
  static const Text passwordText = Text("Password");
  static const Text emailText = Text("Email");
  static const Text welcomeText = Text(
    "Welcome",
    style: TextStyleData.welcomeStyle,
  );
}
