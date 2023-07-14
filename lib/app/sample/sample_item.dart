import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wear_agains/app/sample/cart_screen.dart';

import 'package:wear_agains/app/sample/sample_controller.dart';
import 'package:wear_agains/app/sample/sample_view.dart';

import '../../const/data_builder.dart';
import '../../const/screens.dart';
import '../viewer/carousel.dart';

class SampleItemScreen extends StatefulWidget {
  final ScrollController scrollController;
  const SampleItemScreen({required this.scrollController, super.key});

  @override
  State<SampleItemScreen> createState() => _SampleItemScreenState();
}

class _SampleItemScreenState extends State<SampleItemScreen> {
  final SampleController sampleController = Get.put(SampleController());
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
            controller: widget.scrollController,
            child: Column(children: [
              _buildCarousel(),
              SizedBoxHeight.tenSizedBox,
              _buildShoesText(),
              SizedBoxHeight.tenSizedBox,
              _buildShoesData(),
              SizedBoxHeight.tenSizedBox,
              _buildTShirtText(),
              SizedBoxHeight.tenSizedBox,
              _buildTShirtsData(),
              SizedBoxHeight.tenSizedBox,
              _buildShoesText(),
              SizedBoxHeight.tenSizedBox,
              _buildShoesData(),
            ])));
  }

  SizedBox _buildTShirtsData() {
    return SizedBox(
      height: Get.height / 5,
      child: ListView.builder(
          itemCount: shoes.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            if (shoes[index].category == "T-Shirts") {
              return GestureDetector(
                onTap: () {
                  Get.to(SampleView(shoes: shoes[index]),
                      transition: Transition.fadeIn);
                },
                child: Container(
                  width: Get.width / 3,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin: const EdgeInsets.only(left: 15),
                  decoration: ShapeDecoration(
                      image: DecorationImage(
                          image: AssetImage(tshirts[index].tshirtsImage)),
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(15))),
                ),
              );
            }
            return const SizedBox.shrink();
          }),
    );
  }

  Padding _buildTShirtText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "T-Shirt",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.shoesScreen);
                  },
                  child: const Text(
                    "SEE ALL ",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: ColorPalette.textButtonColor),
                  ),
                ),
                Image.asset(Assets.caretRight)
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _buildCarousel() {
    return Container(
        alignment: Alignment.center,
        height: Get.height / 3.5,
        child: const CarouselScreen());
  }

  Padding _buildShoesText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Shoes",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.shoesScreen);
                  },
                  child: const Text(
                    "SEE ALL ",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: ColorPalette.textButtonColor),
                  ),
                ),
                Image.asset(Assets.caretRight)
              ],
            ),
          )
        ],
      ),
    );
  }

  SizedBox _buildShoesData() {
    return SizedBox(
        height: Get.height / 5,
        child: ListView.builder(
            itemCount: shoes.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              if (shoes[index].category == "Shoes") {
                return GestureDetector(
                  onTap: () {
                    Get.to(SampleView(shoes: shoes[index]),
                        transition: Transition.fadeIn);
                  },
                  child: Container(
                    width: Get.width / 3,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin: const EdgeInsets.only(left: 15),
                    decoration: ShapeDecoration(
                        image: DecorationImage(
                            image: AssetImage(shoes[index].shoesImage)),
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(15))),
                  ),
                );
              }
              return const SizedBox.shrink();
            }));
  }

  AppBar _buildAppBar() {
    return AppBar(
        backgroundColor: ColorPalette.elevatedButtonColor,
        automaticallyImplyLeading: false,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        bottom: _buildAppBarBottom());
  }

  PreferredSize _buildAppBarBottom() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(150),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 80),
            Image.asset(Assets.wearagainshomelogo),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Stack(
                children: [
                  Row(
                    children: [
                      Image.asset(Assets.wearagainsnotification,
                          color: Colors.black),
                      SizedBoxWidth.twentySizedBox,
                      const CartScreen()
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBoxHeight.twentySizedBox,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: _buildSearch(),
        ),
        SizedBoxHeight.twentySizedBox,
      ]),
    );
  }

  TextFormField _buildSearch() {
    return TextFormField(
      controller: searchController,
      decoration: InputDecoration(
        fillColor: ColorPalette.formFieldColor,
        filled: true,
        hintText: "What are you looking for?",
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorPalette.formFieldSideColor),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorPalette.formFieldSideColor),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
