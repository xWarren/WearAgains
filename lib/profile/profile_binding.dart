import 'package:get/get.dart';
import 'package:wear_agains/app/authenticate/auth_controller.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
