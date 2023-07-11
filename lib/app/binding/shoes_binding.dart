import 'package:get/get.dart';
import 'package:wear_agains/app/controller/cart_controller.dart';
import 'package:wear_agains/app/controller/tshirts_controller.dart';

class ShoesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShoesController>(() => ShoesController());
    Get.lazyPut<CartController>(() => CartController());
  }
}
