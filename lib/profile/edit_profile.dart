import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wear_agains/const/appbar.dart';
import 'package:wear_agains/const/screens.dart';

import '../const/buttons.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController firstNameController =
      TextEditingController(text: "Warren");
  final TextEditingController lastNameController =
      TextEditingController(text: "Virgines");
  final TextEditingController addressController = TextEditingController(
      text:
          "Blk CA Lot S-A Phase 1 Santa Lucia Resettlement Magalang, Pampanga");
  final TextEditingController contactNumberController =
      TextEditingController(text: "09307971545");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget.editProfile,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBoxHeight.twentySizedBox,
            Stack(
              alignment: Alignment.center,
              fit: StackFit.loose,
              children: [
                Center(child: Image.asset(Assets.profileIcon)),
                Positioned(
                    top: 90,
                    left: 120,
                    right: 0,
                    bottom: 0,
                    child: GestureDetector(
                        onTap: () {}, child: Image.asset(Assets.editProfile)))
              ],
            ),
            SizedBoxHeight.twentySizedBox,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "First Name",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBoxHeight.fiveSizedBox,
            _buildFirstName(),
            SizedBoxHeight.twentySizedBox,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Last Name",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBoxHeight.fiveSizedBox,
            _buildLastName(),
            SizedBoxHeight.twentySizedBox,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Address",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBoxHeight.fiveSizedBox,
            _buildAddress(),
            SizedBoxHeight.twentySizedBox,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Contact Number",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBoxHeight.fiveSizedBox,
            _buildContactNumber(),
            SizedBoxHeight.thirtySizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    width: Get.width / 1.3,
                    height: Get.height / 15,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(Routes.editProfile);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorPalette.elevatedButtonColor,
                          shape: ButtonWidget.nextButton),
                      child: TextData.updateText,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildFirstName() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Material(
        elevation: 5.0,
        shadowColor: Colors.black54,
        child: TextFormField(
            controller: firstNameController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.withOpacity(0.2),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.5))),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.5))),
            )),
      ),
    );
  }

  Padding _buildLastName() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Material(
        elevation: 5.0,
        shadowColor: Colors.black54,
        child: TextFormField(
            controller: lastNameController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.withOpacity(0.2),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.5))),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.5))),
            )),
      ),
    );
  }

  Padding _buildAddress() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Material(
        elevation: 5.0,
        shadowColor: Colors.black54,
        child: TextFormField(
            controller: addressController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.withOpacity(0.2),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.5))),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.5))),
            )),
      ),
    );
  }

  Padding _buildContactNumber() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Material(
        elevation: 5.0,
        shadowColor: Colors.black54,
        child: TextFormField(
            controller: contactNumberController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.withOpacity(0.2),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.5))),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.5))),
            )),
      ),
    );
  }
}
