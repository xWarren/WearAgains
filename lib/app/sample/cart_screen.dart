import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wear_agains/app/sample/sample_cart.dart';
import 'package:wear_agains/app/sample/sample_controller.dart';

import '../../const/screens.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  SampleController sampleController = Get.put(SampleController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          Get.to(const SampleCart());
        },
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.loose,
          clipBehavior: Clip.none,
          children: [
            Image.asset(Assets.wearagainscart, color: Colors.black),
            Positioned(
              left: 15,
              bottom: 15,
              child: Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: sampleController.shoes.length == 0
                        ? null
                        : ColorPalette.backgroundColor),
                child: Text(
                  sampleController.shoes.length == 0
                      ? ""
                      : "${sampleController.shoes.length}",
                  style: const TextStyle(
                      fontSize: 10, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartViewScreen extends StatefulWidget {
  const CartViewScreen({super.key});

  @override
  State<CartViewScreen> createState() => _CartViewScreenState();
}

class _CartViewScreenState extends State<CartViewScreen> {
  SampleController sampleController = Get.put(SampleController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          Get.to(const SampleCart());
        },
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.loose,
          clipBehavior: Clip.none,
          children: [
            Image.asset(Assets.wearagainscart,
                color: ColorPalette.elevatedButtonColor),
            Positioned(
              left: 15,
              bottom: 30,
              child: Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: sampleController.shoes.length == 0
                        ? null
                        : ColorPalette.elevatedButtonColor),
                child: Text(
                  sampleController.shoes.length == 0
                      ? ""
                      : "${sampleController.shoes.length}",
                  style: const TextStyle(
                      fontSize: 10, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
