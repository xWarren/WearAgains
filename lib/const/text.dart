import 'package:flutter/material.dart';

import '../../const/screens.dart';

class TextData {
  static const Text haveAccountText =
      Text("Don’t have an account?", style: TextStyleData.haveAccountStyle);
  static const Text registerText =
      Text("Register", style: TextStyleData.registerStyle);
  static const Text loginText = Text("Login", style: TextStyleData.loginStyle);
  static const Text forgotText =
      Text("Forgot Password?", style: TextStyleData.forgotStyle);
  static const Text passwordText = Text("Password");
  static const Text emailText = Text("Email");
  static const Text welcomeText =
      Text("Welcome", style: TextStyleData.welcomeStyle);
  static const Text profileText =
      Text("Profile", style: TextStyleData.profileTextStyle);
  static const Text profileFirstNameText =
      Text("Warren", style: TextStyleData.profileNameTextStyle);
  static const Text profileLastNameText =
      Text("Virgines", style: TextStyleData.profileNameTextStyle);
  static const Text editProfileText =
      Text("EDIT PROFILE", style: TextStyleData.editProfileTextStyle);
  static const Text updateText =
      Text("UPDATE", style: TextStyleData.editProfileTextStyle);

  //Cart
  static const Text totalText = Text(
    "Total:",
    style: TextStyleData.totalStyle,
  );
  static const Text cartButtonText = Text(
    "Change",
    style: TextStyleData.cartButtonStyle,
  );
  static const Text paymentMethodText = Text(
    "Cash on Delivery",
    style: TextStyleData.paymentMethodStyle,
  );
  static const Text paymentMethod = Text(
    "Payment Method",
    style: TextStyleData.paymentMethod,
  );
  static const Text selectVoucherText = Text(
    "Select Vouchers",
    style: TextStyleData.cartButtonStyle,
  );
  static const Text wearAgainsVoucherText = Text(
    "WEARAGAINS Vouchers",
    style: TextStyleData.wearAgainsVoucherStyle,
  );
  static const Text placeOrderText = Text(
    "PLACE ORDER",
    style: TextStyleData.buttonStyle,
  );
}
