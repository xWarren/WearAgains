import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wear_agains/app/cart/view_cart.dart';
import 'package:wear_agains/app/items/shoes_description.dart';
import '../../const/data_builder.dart';
import '../../const/screens.dart';
import 'carousel.dart';

class HomeScreen extends StatefulWidget {
  final ScrollController scrollController;
  const HomeScreen({required this.scrollController, super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        controller: widget.scrollController,
        child: Column(children: [
          Container(
              alignment: Alignment.center,
              height: Get.height / 2.5,
              child: const CarouselScreen()),
          SizedBoxHeight.tenSizedBox,
          Padding(
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
                      const Text(
                        "SEE ALL",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: ColorPalette.textButtonColor),
                      ),
                      Image.asset(Assets.caretRight)
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBoxHeight.tenSizedBox,
          SizedBox(
            height: Get.height / 5,
            child: ListView.builder(
              itemCount: shoes.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(ShoesScreen(shoes: shoes[index]));
                  },
                  child: Container(
                    width: Get.width / 2.5,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin: const EdgeInsets.only(left: 15),
                    decoration: ShapeDecoration(
                        shadows: const <BoxShadow>[
                          BoxShadow(blurRadius: 5.0, offset: Offset(0, 5)),
                        ],
                        image: DecorationImage(
                            image: AssetImage(shoes[index].shoesImage)),
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(15))),
                  ),
                );
              },
            ),
          ),
          SizedBoxHeight.twentySizedBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "T Shirts",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      const Text(
                        "SEE ALL",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: ColorPalette.textButtonColor),
                      ),
                      Image.asset(Assets.caretRight)
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBoxHeight.tenSizedBox,
          SizedBox(
            height: Get.height / 5,
            child: ListView.builder(
              itemCount: tshirts.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  width: Get.width / 2.5,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin: const EdgeInsets.only(left: 15),
                  decoration: ShapeDecoration(
                      shadows: const <BoxShadow>[
                        BoxShadow(blurRadius: 5.0, offset: Offset(0, 5)),
                      ],
                      image: DecorationImage(
                          image: AssetImage(tshirts[index].tshirtsImage)),
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(15))),
                );
              },
            ),
          ),
        ]),
      ),
    );
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
                      GestureDetector(
                          onTap: () {
                            Get.to(const ViewCartScreen());
                          },
                          child: Image.asset(Assets.wearagainscart,
                              color: Colors.black))
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
