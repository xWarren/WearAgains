import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wear_agains/const/appbar.dart';
import 'package:wear_agains/const/screens.dart';
import 'package:wear_agains/profile/utils.dart';

import '../app/authenticate/user_class.dart';
import '../app/viewer/navigator.dart';
import '../const/buttons.dart';
import '../const/firebase_const.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  UserClass loggedInUser = UserClass();
  final currentUser = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;
  File? imageFile;
  final CollectionReference profileURL =
      FirebaseFirestore.instance.collection('profileUrl');

  TextEditingController? firstNameController;
  TextEditingController? lastNameController;
  TextEditingController? addressController;
  TextEditingController? contactNumberController;

  String imageName = '';
  Uint8List? image;

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      image = img;
    });
  }

  void saveProfile() async {}

  @override
  void initState() {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserClass.fromMap(value.data());
      firstNameController = TextEditingController(text: loggedInUser.firstName);
      lastNameController = TextEditingController(text: loggedInUser.lastName);
      addressController = TextEditingController(text: loggedInUser.address);
      contactNumberController =
          TextEditingController(text: loggedInUser.phoneNumber);
      setState(() {});
    });

    super.initState();
  }

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
                image != null
                    ? Center(
                        child: CircleAvatar(
                            radius: 64,
                            backgroundColor: ColorPalette.backgroundColor,
                            backgroundImage: MemoryImage(image!)),
                      )
                    : Center(
                        child: CircleAvatar(
                            radius: 64,
                            backgroundColor: ColorPalette.backgroundColor,
                            backgroundImage: AssetImage(Assets.profileIcon)),
                      ),
                Positioned(
                    top: 90,
                    left: 120,
                    right: 0,
                    bottom: 0,
                    child: GestureDetector(
                        onTap: () {
                          _buildModalBottomSheet(context);
                        },
                        child: Image.asset(Assets.editProfile)))
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
                "Phone Number",
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
                        saveProfile();
                        // Get.toNamed(Routes.editProfile);
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
              hintText: "Input your first name",
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
              hintText: "Input your last name",
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
              hintText: "Input your address",
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
              hintText: "Input your phone number",
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.5))),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.5))),
            )),
      ),
    );
  }

  Future<dynamic> _buildModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (BuildContext context) {
          return _buildModal(context);
        });
  }

  Column _buildModal(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 10,
              width: 70,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(20)),
            )
          ],
        ),
        const ListTile(title: Text("Update Profile Photo")),
        ListTile(
            leading:
                Image.asset(Assets.profileGalleryIcon, width: 50, height: 20),
            title: const Text("Upload a photo"),
            onTap: () async {
              selectImage();
            }),
        ListTile(
            leading:
                Image.asset(Assets.profileCameraIcon, width: 50, height: 20),
            title: const Text("Take a photo"),
            onTap: () async {
              // _getFromCamera();
            }),
        ListTile(
            leading: Image.asset(Assets.profileTrashIcon,
                color: ColorPalette.authenticityColor, width: 50, height: 20),
            title: const Text("Remove Photo")),
      ],
    );
  }

  postDetailsToFireBase() async {
    //calling the cloud firestore
    // sending the date from server
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = currentUser.currentUser;
    UserClass userClass = UserClass();

    //writing the value to send in server
    userClass.email = user!.email;
    userClass.uid = user.uid;
    userClass.firstName = authController.firstNameController.text.toString();
    userClass.lastName = authController.lastNameController.text.toString();
    userClass.address = addressController?.text;
    userClass.phoneNumber = contactNumberController?.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userClass.toMap());
    Get.snackbar(
      "About Login",
      "Login Message",
      snackPosition: SnackPosition.TOP,
      titleText: const Text(
        "Login failed",
        style: TextStyle(fontSize: 15),
      ),
    );
    Get.to(const BottomNavScreen());
  }
}
