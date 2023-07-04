import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wear_agains/const/data_builder.dart';

class CartController extends GetxController {
  final _shoes = {}.obs;

  void addProduct(ShoesData shoes) {
    if (_shoes.containsKey(shoes)) {
      _shoes[shoes] += 1;
    } else {
      _shoes[shoes] = 1;
    }
    Get.snackbar("Added in cart", "Please check your cart to proceed",
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 1));
  }

  get shoes => _shoes;
}
