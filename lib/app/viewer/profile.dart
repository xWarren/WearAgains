import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wear_agains/const/firebase_const.dart';
import 'package:wear_agains/const/screens.dart';

import '../../const/buttons.dart';
import '../authenticate/user_class.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserClass loggedInUser = UserClass();
  final currentUser = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserClass.fromMap(value.data());
      setState(() {});
    });
    super.initState();
  }

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
            Text(loggedInUser.firstName.toString(),
                style: TextStyleData.profileNameTextStyle),
            SizedBoxWidth.fiveSizedBox,
            Text(loggedInUser.lastName.toString(),
                style: TextStyleData.profileNameTextStyle),
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
                    authController.signOut();
                    // Get.toNamed(Routes.editProfile);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorPalette.elevatedButtonColor,
                      shape: ButtonWidget.nextButton),
                  child: Text("LOGOUT",
                      style: TextStyleData.editProfileTextStyle)),
            ),
          ],
        ),
      ]),
    );
  }
}
