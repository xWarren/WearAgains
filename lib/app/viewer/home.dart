import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wear_agains/app/viewer/carousel.dart';
import 'package:wear_agains/const/color.dart';
import 'package:wear_agains/const/data_builder.dart';
import 'package:wear_agains/const/image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  int _currentIndex = 1;
// Define your navigation items
  final List<BottomNavigationBarItem> _navigationItems = [
    BottomNavigationBarItem(
      icon: Image.asset(Assets.navigationsMyOrders),
      label: 'My Orders',
    ),
    BottomNavigationBarItem(
      icon: Container(
          width: 50,
          decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  side:
                      const BorderSide(color: ColorPalette.formFieldSideColor),
                  borderRadius: BorderRadius.circular(30))),
          child: Image.asset(Assets.navigationsHome)),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Image.asset(Assets.navigationsProfile),
      label: 'Profile',
    ),
  ];
  // Handle navigation item tap
  void _onNavigationTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: ColorPalette.elevatedButtonColor,
          automaticallyImplyLeading: false,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          bottom: PreferredSize(
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
                            const SizedBox(width: 10),
                            Image.asset(Assets.wearagainscart)
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                    fillColor: ColorPalette.formFieldColor,
                    filled: true,
                    hintText: "What are you looking for?",
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: ColorPalette.formFieldSideColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: ColorPalette.formFieldSideColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20)
            ]),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                alignment: Alignment.center,
                height: Get.height / 2.5,
                child: const CarouselScreen()),
            const SizedBox(height: 10),
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
            const SizedBox(height: 10),
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
            const SizedBox(height: 20),
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
            const SizedBox(height: 10),
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            backgroundColor: ColorPalette.formFieldColor,
            elevation: 0,
            currentIndex: _currentIndex,
            onTap: _onNavigationTapped,
            items: _navigationItems,
          ),
        ),
      ),
    );
  }
}
