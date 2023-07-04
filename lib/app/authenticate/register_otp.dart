import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:wear_agains/const/appbar.dart';
import 'package:wear_agains/const/color.dart';
import 'package:wear_agains/const/image.dart';

import '../../const/buttons.dart';
import '../../const/routes.dart';
import '../../const/sizedbox.dart';

class RegisterOTPPage extends StatefulWidget {
  const RegisterOTPPage({super.key});

  @override
  State<RegisterOTPPage> createState() => _RegisterOTPPageState();
}

class _RegisterOTPPageState extends State<RegisterOTPPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget.appBarOTP,
      body: Column(
        children: [
          SizedBoxHeight.fiftySizedBox,
          Image.asset(Assets.registerOTP),
          SizedBoxHeight.tenSizedBox,
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Code has been send to +63 921*****64",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: ColorPalette.otpColor),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Pinput(
              length: 6,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Resend Code",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: ColorPalette.textButtonColor),
                )
              ],
            ),
          )
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height / 15,
              width: Get.width / 2.0,
              child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.registerOTP);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorPalette.elevatedButtonColor,
                      shape: ButtonWidget.nextButton),
                  child: const Text(
                    "VERIFY",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
