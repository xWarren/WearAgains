import 'package:get/get.dart';
import 'package:wear_agains/app/authenticate/login.dart';
import 'package:wear_agains/app/authenticate/register.dart';
import 'package:wear_agains/app/authenticate/register_contact_number.dart';
import 'package:wear_agains/app/authenticate/register_otp.dart';
import 'package:wear_agains/app/products/shoes_view.dart';
// import 'package:wear_agains/app/products/tshirt_view.dart';
import 'package:wear_agains/app/viewer/navigator.dart';
import 'package:wear_agains/profile/edit_profile.dart';

class Routes {
  static String loginScreen = '/login';
  static String homeScreen = '/home';
  static String navScreen = '/navScreen';
  static String registerScreen = '/register';
  static String registerContactNumberScreen = '/registerContactNumber';
  static String registerOTP = '/otp';
  static String editProfile = '/editProfile';
  static String shoesScreen = '/shoes';
  static String tshirtsScreen = '/tshirts';
}

final getPages = [
  GetPage(
    name: Routes.loginScreen,
    page: () => const LoginScreen(),
  ),
  GetPage(name: Routes.navScreen, page: () => const BottomNavScreen()),
  GetPage(
    name: Routes.registerScreen,
    page: () => const RegisterPage(),
  ),
  GetPage(
    name: Routes.registerContactNumberScreen,
    page: () => const RegisterContactNumberPage(),
  ),
  GetPage(
    name: Routes.registerOTP,
    page: () => const RegisterOTPPage(),
  ),
  GetPage(
    name: Routes.editProfile,
    page: () => const EditProfileScreen(),
  ),
  GetPage(
    name: Routes.shoesScreen,
    page: () => const ShoesViewAllScreen(),
  ),
  // GetPage(
  //   name: Routes.tshirtsScreen,
  //   page: () => const TShirtViewAllScreen(),
  // ),
];
