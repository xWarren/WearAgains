import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:wear_agains/app/items/tshirts_description.dart';
import 'package:wear_agains/const/data_builder.dart';

import '../../const/appbar.dart';
import '../../const/color.dart';

class TShirtViewAllScreen extends StatefulWidget {
  const TShirtViewAllScreen({super.key});

  @override
  State<TShirtViewAllScreen> createState() => _TShirtViewAllScreenState();
}

class _TShirtViewAllScreenState extends State<TShirtViewAllScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget.tshirt,
        body: MasonryGridView.builder(
            itemCount: tshirts.length,
            crossAxisSpacing: 2,
            mainAxisSpacing: 14,
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(
                        TShirtsScreen(tshirts: tshirts[index]),
                        transition: Transition.fadeIn,
                      );
                    },
                    child: Container(
                        decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2),
                                side: const BorderSide(
                                    color: ColorPalette.elevatedButtonColor,
                                    width: 2))),
                        child: Image.asset(tshirts[index].tshirtsImage)),
                  ));
            }));
  }
}
