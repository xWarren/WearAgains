import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../../const/screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  final ScrollController _scrollBottomBarController = ScrollController();

  bool isScrollingDown = false;
  bool _show = true;
  double bottomBarHeight = 75;
  @override
  void initState() {
    super.initState();
    myScroll();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollBottomBarController.removeListener(() {});
  }

  void showBottomBar() {
    setState(() {
      _show = true;
    });
  }

  void hideBottomBar() {
    setState(() {
      _show = false;
    });
  }

  void myScroll() async {
    _scrollBottomBarController.addListener(() {
      if (_scrollBottomBarController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          hideBottomBar();
        }
      }
      if (_scrollBottomBarController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          showBottomBar();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        controller: _scrollBottomBarController,
        child: Column(
          children: [
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
                  return Container(
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
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
          height: bottomBarHeight,
          width: MediaQuery.of(context).size.width,
          child: _show
              ? BottomNavigationBar(
                  backgroundColor: ColorPalette.formFieldColor,
                  unselectedItemColor: Colors.grey,
                  selectedItemColor: ColorPalette.elevatedButtonColor,
                  items: [
                    BottomNavigationBarItem(
                        icon: Image.asset(Assets.navigationsHome),
                        label: "Home"),
                    BottomNavigationBarItem(
                        icon: Image.asset(Assets.navigationsChat),
                        label: "Chat"),
                    BottomNavigationBarItem(
                        icon: Image.asset(Assets.navigationsProfile),
                        label: "Profile"),
                  ],
                )
              : null),
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
                      Image.asset(Assets.wearagainsnotification),
                      SizedBoxWidth.tenSizedBox,
                      Image.asset(Assets.wearagainscart)
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
