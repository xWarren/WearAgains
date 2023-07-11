import 'package:get/get.dart';
import 'package:wear_agains/app/controller/cart_controller.dart';

class ShoesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShoesController>(() => ShoesController());
  }
}
