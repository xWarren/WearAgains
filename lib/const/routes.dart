import 'package:get/get.dart';
import 'package:wear_agains/app/authenticate/login.dart';
import 'package:wear_agains/app/viewer/home.dart';

class Routes {
  static String loginScreen = '/login';
  static String homeScreen = '/home';
}

final getPages = [
  GetPage(
    name: Routes.loginScreen,
    page: () => const LoginScreen(),
  ),
  GetPage(
    name: Routes.homeScreen,
    page: () => const HomeScreen(),
  ),
];
