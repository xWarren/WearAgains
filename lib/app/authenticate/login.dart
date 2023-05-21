import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wear_agains/const/color.dart';
import 'package:wear_agains/const/image.dart';
import 'package:wear_agains/const/routes.dart';

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
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Assets.wearagainslogin),
            ],
          ),
          const SizedBox(height: 30),
          const Text(
            "Welcome",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: const [Text("Email")],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextFormField(
              controller: emailController,
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
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [Text("Password")],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextFormField(
              controller: passwordController,
              obscureText: obscureText,
              decoration: InputDecoration(
                  fillColor: ColorPalette.formFieldColor,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: ColorPalette.formFieldSideColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: ColorPalette.formFieldSideColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    child: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: ColorPalette.textButtonColor),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 50),
          SizedBox(
            width: Get.width / 2,
            height: Get.height / 15,
            child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.homeScreen);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorPalette.elevatedButtonColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                )),
          ),
        ]),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Don’t have an account?",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
            SizedBox(width: 5),
            Text(
              "Register",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: ColorPalette.textButtonColor),
            )
          ],
        ),
      ),
    );
  }
}
