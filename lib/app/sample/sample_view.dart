import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wear_agains/app/sample/cart_screen.dart';
import 'package:wear_agains/app/sample/sample_cart.dart';
import 'package:wear_agains/app/sample/sample_controller.dart';

import 'package:wear_agains/const/data_builder.dart';

import '../../const/buttons.dart';
import '../../const/screens.dart';

class SampleView extends StatefulWidget {
  final ShoesData shoes;
  const SampleView({required this.shoes, super.key});

  @override
  State<SampleView> createState() => _SampleViewState();
}

class _SampleViewState extends State<SampleView> {
  SampleController shoesController = Get.put(SampleController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            backgroundColor: ColorPalette.backgroundColor,
            title: const Text("Shoes", style: TextStyleData.appBarTitle),
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    )),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                    onTap: () {
                      Get.to(const SampleCart());
                    },
                    child: const CartViewScreen()),
              )
            ],
            expandedHeight: Get.height / 3.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                widget.shoes.viewImage,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        const Text(
                          "Size:",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        SizedBoxWidth.fiveSizedBox,
                        Text(
                          widget.shoes.sizeText,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        const Text(
                          "Condition:",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        SizedBoxWidth.fiveSizedBox,
                        Text(
                          widget.shoes.conditionText,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  SizedBoxHeight.fiftySizedBox,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Authenticity not guaranteed",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: ColorPalette.authenticityColor),
                      ),
                    ],
                  )
                ],
              );
            }, childCount: 1),
          )
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: Get.height / 15,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: Get.width / 1.0,
              child: ElevatedButton(
                  onPressed: () {
                    shoesController.addSampleShoes(widget.shoes);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorPalette.elevatedButtonColor,
                      shape: ButtonWidget.nextButton),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "ADD TO CART",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "₱${widget.shoes.priceText.toStringAsFixed(2)}",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
