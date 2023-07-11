import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/data_builder.dart';

class CartController extends GetxController {
  final _products = {}.obs;
  void addProduct(ShoesData shoes) {
    if (_products.containsKey(shoes)) {
      _products[shoes] += 1;
    } else {
      _products[shoes] = 1;
    }
    Get.snackbar("Added in cart", "Please check your cart to proceed",
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 1));
  }

  void delete(ShoesData shoes) {
    if (_products.containsKey(shoes) && _products[shoes] == 1) {
      _products.removeWhere((key, value) => key == shoes);

      _products.remove(shoes);
      Get.back();
    } else {
      Get.back();
    }
  }

  get shoes => _products;
}
