import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wear_agains/const/appbar.dart';
import 'package:wear_agains/const/data_builder.dart';

import '../sample/sample_controller.dart';

class ViewCartScreen extends StatefulWidget {
  const ViewCartScreen({super.key});

  @override
  State<ViewCartScreen> createState() => _ViewCartScreenState();
}

class _ViewCartScreenState extends State<ViewCartScreen> {
  SampleController shoesController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBarWidget.cart,
        body: ListView.builder(
          itemCount: shoesController.shoes.length,
          itemBuilder: (context, index) {
            return SampleCartProduct(
              controller: shoesController,
              index: index,
              quantity: shoesController.shoes.values.toList()[index],
              shoes: shoesController.shoes.keys.toList()[index],
            );
          },
        ),
      ),
    );
  }
}

class SampleCartProduct extends StatefulWidget {
  final SampleController controller;
  final ShoesData shoes;
  final int quantity;
  final int index;
  const SampleCartProduct(
      {required this.controller,
      required this.shoes,
      required this.quantity,
      required this.index,
      super.key});

  @override
  State<SampleCartProduct> createState() => _SampleCartProductState();
}

class _SampleCartProductState extends State<SampleCartProduct> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Image.asset(widget.shoes.shoesImage)],
    );
  }
}
