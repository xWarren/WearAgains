import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wear_agains/app/sample/sample_controller.dart';
import 'package:wear_agains/app/sample/success.dart';
import 'package:wear_agains/const/appbar.dart';
import 'package:wear_agains/const/data_builder.dart';
import 'package:wear_agains/const/screens.dart';

import '../../const/buttons.dart';

class SampleCart extends StatefulWidget {
  const SampleCart({super.key});

  @override
  State<SampleCart> createState() => _SampleCartState();
}

class _SampleCartState extends State<SampleCart> {
  SampleController shoesController = Get.find();
  TabController? tabController;
  bool disableButton = false;
  bool mop = false;
  String cashondelivery = "Cash on Delivery";
  String gcash = "G Cash";
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DefaultTabController(
        length: shoesController.shoes.length,
        child: Scaffold(
          appBar: shoesController.shoes.length == 0
              ? AppBarWidget.cart
              : AppBar(
                  elevation: 0,
                  backgroundColor: ColorPalette.backgroundColor,
                  title: const Text("Cart", style: TextStyleData.appBarTitle),
                  iconTheme: const IconThemeData(color: Colors.black),
                  bottom: _buildTabBar(),
                ),
          body: shoesController.shoes.length == 0
              ? Center(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(Assets.emptyCart, scale: 10),
                    SizedBoxHeight.tenSizedBox,
                    const Text(
                      "No Item",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    )
                  ],
                ))
              : TabBarView(
                  children: List<Widget>.generate(shoesController.shoes.length,
                      (index) {
                  return SampleCartProduct(
                    controller: shoesController,
                    index: index,
                    quantity: shoesController.shoes.values.toList()[index],
                    shoes: shoesController.shoes.keys.toList()[index],
                    disableButton: disableButton,
                    mop: mop,
                    gcash: gcash,
                    cashondelivery: cashondelivery,
                  );
                })),
        ),
      ),
    );
  }

  PreferredSize _buildTabBar() {
    return PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
                labelColor: Colors.black87,
                unselectedLabelColor: Colors.grey,
                controller: tabController,
                indicatorWeight: 5,
                isScrollable: true,
                physics: const NeverScrollableScrollPhysics(),
                indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(
                        color: ColorPalette.elevatedButtonColor, width: 5.0),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5))),
                indicatorSize: TabBarIndicatorSize.label,
                tabs: List<Widget>.generate(shoesController.shoes.length,
                    (index) {
                  return CartTab(
                    controller: shoesController,
                    shoes: shoesController.shoes.value?.keys.toList()[index],
                  );
                }))));
  }
}

// ignore: must_be_immutable
class SampleCartProduct extends StatefulWidget {
  final SampleController controller;
  final ShoesData shoes;
  final int quantity;
  final int index;
  late bool mop;
  late bool disableButton;
  final String gcash;
  final String cashondelivery;
  SampleCartProduct(
      {required this.controller,
      required this.shoes,
      required this.quantity,
      required this.index,
      required this.disableButton,
      required this.mop,
      required this.gcash,
      required this.cashondelivery,
      super.key});

  @override
  State<SampleCartProduct> createState() => _SampleCartProductState();
}

class _SampleCartProductState extends State<SampleCartProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildContainer(),
          const Divider(
            thickness: 0.5,
          ),
        ],
      ),
      bottomSheet: Container(
        height: Get.height / 5,
        color: ColorPalette.backgroundColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(Assets.voucherIcon),
                      SizedBoxWidth.fiveSizedBox,
                      TextData.wearAgainsVoucherText
                    ],
                  ),
                  TextData.selectVoucherText
                ],
              ),
            ),
            SizedBoxHeight.tenSizedBox,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextData.paymentMethod,
                  Row(
                    children: [
                      Text(
                        widget.mop ? widget.gcash : widget.cashondelivery,
                        style: TextStyleData.paymentMethodStyle,
                      ),
                      SizedBoxWidth.fiveSizedBox,
                      GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20))),
                                builder: (BuildContext context) {
                                  return _buildModal(context);
                                });
                          },
                          child: TextData.cartButtonText),
                    ],
                  )
                ],
              ),
            ),
            SizedBoxHeight.tenSizedBox,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextData.totalText,
                  Text(
                    widget.disableButton
                        ? "₱${widget.controller.total}"
                        : "₱0.00",
                    style: TextStyleData.totalStyle,
                  ),
                ],
              ),
            ),
            SizedBoxHeight.tenSizedBox,
            widget.disableButton
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: Get.height / 15,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      width: Get.width / 1.0,
                      child: ElevatedButton(
                          onPressed: () {
                            Get.to(const SuccessScreen());
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: ColorPalette.elevatedButtonColor,
                              shape: ButtonWidget.nextButton),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [TextData.placeOrderText],
                            ),
                          )),
                    ),
                  )
                : const Text(""),
          ],
        ),
      ),
    );
  }

  Column _buildModal(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 10,
              width: 70,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(20)),
            )
          ],
        ),
        const ListTile(title: Text("SELECT PAYMENT METHOD:")),
        ListTile(
            title: const Text("Cash on Delivery"),
            onTap: () {
              setState(() {
                widget.mop = false;
                Get.back();
              });
            }),
        ListTile(
            title: const Text("G Cash"),
            onTap: () {
              setState(() {
                widget.mop = true;
                Get.back();
              });
            }),
      ],
    );
  }

  Padding _buildProduct() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Image.asset(
          widget.shoes.shoesImage,
          height: 100,
          width: 100,
        ));
  }

  Container _buildContainer() {
    return Container(
      color: ColorPalette.backgroundColor,
      margin: EdgeInsets.zero,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCheckBox(),
          _buildProduct(),
          const SizedBox(width: 10),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Item Name :${widget.shoes.shoesName}",
                  style: const TextStyle(
                      fontSize: 10, fontWeight: FontWeight.w700),
                ),
                Text(
                  "Quantity: ${widget.quantity}",
                  style:
                      const TextStyle(fontSize: 9, fontWeight: FontWeight.w200),
                ),
                Text(
                  "Price: ₱${widget.shoes.priceText.toStringAsFixed(2)}",
                  style:
                      const TextStyle(fontSize: 9, fontWeight: FontWeight.w200),
                )
              ],
            ),
          )),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              widget.disableButton
                  ? GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            title: const Center(
                                child: Text(
                              "Are you sure you want to delete this item?",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w700),
                            )),
                            actions: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: Get.height / 8,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          Get.back(result: false);
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                ColorPalette.backgroundColor,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            side: const BorderSide(
                                                color: ColorPalette
                                                    .elevatedButtonColor)),
                                        child: const Text(
                                          "Cancel",
                                          style: TextStyleData.dialog,
                                        )),
                                  ),
                                  const SizedBox(width: 10),
                                  SizedBox(
                                    width: Get.height / 8,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          widget.controller
                                              .delete(widget.shoes);
                                          Get.back();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              ColorPalette.backgroundColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              side: const BorderSide(
                                                  color: ColorPalette
                                                      .authenticityColor)),
                                        ),
                                        child: const Text(
                                          "Yes, Delete",
                                          style: TextStyleData.dialog,
                                        )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      child: Image.asset(Assets.trashIcon))
                  : const Text("")
            ],
          )),
        ],
      ),
    );
  }

  Padding _buildCheckBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Checkbox(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        side: const BorderSide(
            width: 2.0, color: ColorPalette.elevatedButtonColor),
        checkColor: ColorPalette.backgroundColor,
        value: widget.disableButton,
        activeColor: ColorPalette.elevatedButtonColor,
        onChanged: (value) {
          setState(() {
            widget.disableButton = !widget.disableButton;
          });
        },
      ),
    );
  }
}

class CartTab extends StatefulWidget {
  final SampleController controller;
  final ShoesData shoes;
  const CartTab({required this.controller, required this.shoes, super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Tab(text: widget.shoes.category),
    ]);
  }
}
