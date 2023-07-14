import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wear_agains/app/authenticate/auth_controller.dart';
import 'package:wear_agains/const/buttons.dart';
import 'package:wear_agains/const/color.dart';

import '../../const/appbar.dart';
import '../../const/image.dart';
import '../../const/sizedbox.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  AuthController authController = Get.put(AuthController());
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget.appBarRegister,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildRegisterImage(),
            SizedBoxHeight.tenSizedBox,
            Form(
              key: authController.formKey,
              child: Row(
                children: [
                  _buildFirstNameText(),
                  _buildLastNameText(),
                ],
              ),
            ),
            Row(
              children: [
                _buildFirstNameField(),
                _buildLastNameField(),
              ],
            ),
            _buildEmailText(),
            Row(children: [
              _buildEmailField(),
            ]),
            _buildPasswordText(),
            Row(children: [
              _buildPasswordField(),
            ]),
            _buildConfirmPasswordText(),
            Row(children: [
              _buildConfirmPasswordField(),
            ]),
            SizedBoxHeight.fifteenSizedBox,
            SizedBox(
              height: Get.height / 15,
              width: Get.width / 2.0,
              child: ElevatedButton(
                  onPressed: () {
                    if (authController.formKey.currentState!.validate()) {
                      authController.register(
                          authController.emailController.text.trim(),
                          authController.passwordController.text.trim());
                      // // Get.toNamed(Routes.registerContactNumberScreen);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorPalette.elevatedButtonColor,
                      shape: ButtonWidget.nextButton),
                  child: const Text(
                    "NEXT",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  )),
            )
          ],
        ),
      ),
    );
  }

  Flexible _buildConfirmPasswordField() {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          controller: authController.confirmPasswordController,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
          obscureText: obscureText,
          decoration: InputDecoration(
            fillColor: ColorPalette.formFieldColor,
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: ColorPalette.formFieldSideColor),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: ColorPalette.formFieldSideColor),
                borderRadius: BorderRadius.circular(10)),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              child:
                  Icon(obscureText ? Icons.visibility_off : Icons.visibility),
            ),
          ),
        ),
      ),
    );
  }

  Padding _buildConfirmPasswordText() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          Text(
            "Confirm Password",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Flexible _buildPasswordField() {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          controller: authController.passwordController,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.next,
          obscureText: obscureText,
          decoration: InputDecoration(
            fillColor: ColorPalette.formFieldColor,
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: ColorPalette.formFieldSideColor),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: ColorPalette.formFieldSideColor),
                borderRadius: BorderRadius.circular(10)),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              child:
                  Icon(obscureText ? Icons.visibility_off : Icons.visibility),
            ),
          ),
        ),
      ),
    );
  }

  Padding _buildPasswordText() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          Text(
            "Password",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Flexible _buildEmailField() {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          controller: authController.emailController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            fillColor: ColorPalette.formFieldColor,
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: ColorPalette.formFieldSideColor),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: ColorPalette.formFieldSideColor),
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
    );
  }

  Padding _buildEmailText() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          Text(
            "Email",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Flexible _buildLastNameField() {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          controller: authController.lastNameController,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            fillColor: ColorPalette.formFieldColor,
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: ColorPalette.formFieldSideColor),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: ColorPalette.formFieldSideColor),
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
    );
  }

  Flexible _buildFirstNameField() {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          controller: authController.firstNameController,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            fillColor: ColorPalette.formFieldColor,
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: ColorPalette.formFieldSideColor),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: ColorPalette.formFieldSideColor),
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
    );
  }

  Padding _buildLastNameText() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 125, vertical: 10),
      child: Text(
        "Last Name",
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
      ),
    );
  }

  Padding _buildFirstNameText() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Text(
        "First Name",
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
      ),
    );
  }

  Row _buildRegisterImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          Assets.registerProfile,
          width: 250,
          height: 150,
        ),
      ],
    );
  }
}
