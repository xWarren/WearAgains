import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wear_agains/const/buttons.dart';

import '../../const/screens.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBoxHeight.fiftySizedBox,
          _buildLogo(),
          SizedBoxHeight.thirtySizedBox,
          TextData.welcomeText,
          SizedBoxHeight.twentySizedBox,
          _buildEmailText(),
          _builldEmailField(),
          SizedBoxHeight.twentySizedBox,
          buildPasswordText(),
          _buildPasswordField(),
          _buildForgotPasswordText(),
          SizedBoxHeight.fiftySizedBox,
          _buildLoginButton(),
          SizedBoxHeight.twentySizedBox,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextData.haveAccountText,
                SizedBoxWidth.fiveSizedBox,
                GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.registerScreen);
                    },
                    child: TextData.registerText)
              ],
            ),
          )
        ]),
      ),
    );
  }

  SizedBox _buildLoginButton() {
    return SizedBox(
      width: Get.width / 2,
      height: Get.height / 15,
      child: ElevatedButton(
          onPressed: () {
            Get.toNamed(Routes.navScreen);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: ColorPalette.elevatedButtonColor,
              shape: ButtonWidget.nextButton),
          child: TextData.loginText),
    );
  }

  Padding _buildForgotPasswordText() {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [GestureDetector(onTap: () {}, child: TextData.forgotText)],
      ),
    );
  }

  Padding _buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: passwordController,
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.done,
        obscureText: obscureText,
        decoration: InputDecoration(
            fillColor: ColorPalette.formFieldColor,
            filled: true,
            border: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: ColorPalette.formFieldSideColor),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: ColorPalette.formFieldSideColor),
              borderRadius: BorderRadius.circular(10),
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              child:
                  Icon(obscureText ? Icons.visibility_off : Icons.visibility),
            )),
      ),
    );
  }

  Padding buildPasswordText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [TextData.passwordText],
      ),
    );
  }

  Padding _builldEmailField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          fillColor: ColorPalette.formFieldColor,
          filled: true,
          border: OutlineInputBorder(
            borderSide:
                const BorderSide(color: ColorPalette.formFieldSideColor),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: ColorPalette.formFieldSideColor),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Padding _buildEmailText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [TextData.emailText],
      ),
    );
  }

  Row _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(Assets.wearagainslogin),
      ],
    );
  }
}
