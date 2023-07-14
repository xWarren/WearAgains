import 'dart:async';
import 'package:flutter/material.dart';

import '../../const/screens.dart';
import '../../const/data_builder.dart';

class CarouselScreen extends StatefulWidget {
  const CarouselScreen({super.key});

  @override
  State<CarouselScreen> createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
  PageController controller =
      PageController(initialPage: 0, viewportFraction: 0.8);

  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPageIndex < 2) {
        _currentPageIndex++;
      } else {
        _currentPageIndex = 0;
      }

      if (controller.hasClients) {
        controller.animateToPage(
          _currentPageIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter, children: [
      _buildCarousel(),
      _buildIndicator(context),
    ]);
  }

  PageView _buildCarousel() {
    return PageView.builder(
        itemCount: bannerdata.length,
        onPageChanged: (int page) {
          setState(() {
            _currentPageIndex = page;
          });
        },
        controller: controller,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
              child: bannerdata[index].bannerImage);
        });
  }

  Padding _buildIndicator(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          bannerdata.length,
          (index) => dot(index, context),
        ),
      ),
    );
  }

  Container dot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: _currentPageIndex == index ? 10 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: _currentPageIndex == index
            ? ColorPalette.formFieldSideColor
            : Colors.grey,
      ),
    );
  }
}
