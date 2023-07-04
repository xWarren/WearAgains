import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wear_agains/const/appbar.dart';
import 'package:wear_agains/const/screens.dart';

import '../../const/buttons.dart';

class RegisterContactNumberPage extends StatefulWidget {
  const RegisterContactNumberPage({super.key});

  @override
  State<RegisterContactNumberPage> createState() =>
      _RegisterContactNumberPageState();
}

class _RegisterContactNumberPageState extends State<RegisterContactNumberPage> {
  final TextEditingController contactNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget.appBarRegister,
      body: Column(
        children: [
          SizedBoxHeight.fiftySizedBox,
          Image.asset(Assets.registerContactNumber),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                Text(
                  "Contact Number",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Row(children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  controller: contactNumberController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    fillColor: ColorPalette.formFieldColor,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: ColorPalette.formFieldSideColor),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: ColorPalette.formFieldSideColor),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ),
          ]),
          SizedBoxHeight.fifteenSizedBox,
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
                    "SEND OTP",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
