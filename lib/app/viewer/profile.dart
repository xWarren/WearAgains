import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wear_agains/const/screens.dart';

import '../../const/buttons.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: 100),
        Center(child: Image.asset(Assets.profileIcon)),
        SizedBoxHeight.fiftySizedBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextData.profileFirstNameText,
            SizedBoxWidth.fiveSizedBox,
            TextData.profileLastNameText
          ],
        ),
        const SizedBox(height: 250),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: Get.width / 2,
              height: Get.height / 15,
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.editProfile);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorPalette.elevatedButtonColor,
                    shape: ButtonWidget.nextButton),
                child: TextData.editProfileText,
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
