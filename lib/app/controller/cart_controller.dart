import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wear_agains/const/data_builder.dart';

class ShoesController extends GetxController {
  final _shoes = {}.obs;
  final _tshirts = {}.obs;
  void addShoesProduct(ShoesData shoes) {
    if (_shoes.containsKey(shoes)) {
      _shoes[shoes] += 1;
    } else {
      _shoes[shoes] = 1;
      _tshirts[tshirts] = 1;
    }
    Get.snackbar("Added in cart", "Please check your cart to proceed",
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 1));
  }

  void addTShirtsProduct(TShirtsData tshirts) {
    if (_tshirts.containsKey(tshirts)) {
      _tshirts[tshirts] += 1;
    } else {
      _tshirts[tshirts] = 1;
    }
    Get.snackbar("Added in cart", "Please check your cart to proceed",
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 1));
  }

  get shoes => _shoes;
  get tshirts => _tshirts;
}
