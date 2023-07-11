import 'package:flutter/material.dart';

import 'package:wear_agains/const/appbar.dart';
import 'package:wear_agains/const/data_builder.dart';
import 'package:get/get.dart';

import '../controller/cart_controller.dart';

class ViewCartScreen extends StatefulWidget {
  const ViewCartScreen({super.key});

  @override
  State<ViewCartScreen> createState() => _ViewCartScreenState();
}

class _ViewCartScreenState extends State<ViewCartScreen> {
  final ShoesController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBarWidget.appBarOTP,
        body: controller.shoes.length == 0
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SizedBox(
                height: 600,
                child: ListView.builder(
                  itemCount: controller.shoes.length,
                  itemBuilder: (context, index) {
                    return CartProduct(
                        cartController: controller,
                        shoes: controller.shoes.keys.toList()[index],
                        quantity: controller.shoes.values.toList()[index],
                        index: index);
                  },
                ),
              ),
      ),
    );
  }
}

class CartProduct extends StatelessWidget {
  final ShoesController cartController;
  final ShoesData shoes;
  final int quantity;
  final int index;
  const CartProduct(
      {required this.cartController,
      required this.shoes,
      required this.quantity,
      required this.index,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Column(
        children: [const Text("HELLO"), Image.asset(shoes.shoesImage)],
      ),
    );
  }
}
