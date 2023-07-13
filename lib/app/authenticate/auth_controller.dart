import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wear_agains/app/authenticate/login.dart';
import 'package:wear_agains/app/authenticate/user_class.dart';

import '../../const/firebase_const.dart';
import '../viewer/navigator.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> firebaseUser;
  final _auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  late Rx<GoogleSignInAccount?> googleSignInAccount;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void onReady() {
    super.onReady();

    firebaseUser = Rx<User?>(auth.currentUser);
    googleSignInAccount = Rx<GoogleSignInAccount?>(googleSign.currentUser);

    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);

    googleSignInAccount.bindStream(googleSign.onCurrentUserChanged);
    ever(googleSignInAccount, _setInitialScreenGoogle);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const LoginScreen());
    } else {
      Get.offAll(() => const BottomNavScreen());
    }
  }

  _setInitialScreenGoogle(GoogleSignInAccount? googleSignInAccount) {
    if (googleSignInAccount == null) {
      Get.offAll(() => const LoginScreen());
    } else {
      Get.offAll(() => const BottomNavScreen());
    }
  }

  void signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSign.signIn();

      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        await auth
            .signInWithCredential(credential)
            // ignore: avoid_print, invalid_return_type_for_catch_error
            .catchError((onErr) => print(onErr));
      }
    } catch (e) {
      Get.snackbar(
        "Message:",
        e.toString(),
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  void register(String email, String password) async {
    if (formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFireBase()})
          // ignore: body_might_complete_normally_catch_error
          .catchError((e) {
        Get.snackbar(
          "About Login",
          "Login Message",
          snackPosition: SnackPosition.TOP,
          titleText: const Text(
            "Login failed",
            style: TextStyle(fontSize: 15),
          ),
        );
      });
    }
  }

  postDetailsToFireBase() async {
    //calling the cloud firestore
    // sending the date from server
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserClass userClass = UserClass();

    //writing the value to send in server
    userClass.email = user!.email;
    userClass.uid = user.uid;
    userClass.firstName = authController.firstNameController.text.toString();
    userClass.lastName = authController.lastNameController.text.toString();

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

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      // ignore: empty_catches
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "About Login",
        "Login Message",
        snackPosition: SnackPosition.TOP,
        titleText: const Text(
          "Login failed",
          style: TextStyle(fontSize: 15),
        ),
        messageText: Text(
          e.message.toString(),
          style: const TextStyle(fontSize: 15),
        ),
      );
    }
  }

  void signOut() async {
    await auth.signOut();
  }
}
