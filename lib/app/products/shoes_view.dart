import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wear_agains/app/sample/sample_view.dart';
import 'package:wear_agains/const/appbar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wear_agains/const/color.dart';
import 'package:wear_agains/const/data_builder.dart';

class ShoesViewAllScreen extends StatefulWidget {
  const ShoesViewAllScreen({super.key});

  @override
  State<ShoesViewAllScreen> createState() => _ShoesViewAllScreenState();
}

class _ShoesViewAllScreenState extends State<ShoesViewAllScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget.shoes,
        body: MasonryGridView.builder(
            itemCount: shoes.length,
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
                        SampleView(shoes: shoes[index]),
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
                        child: Image.asset(shoes[index].shoesImage)),
                  ));
            }));
  }
}
