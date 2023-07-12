import 'package:get/get.dart';
import 'package:wear_agains/const/data_builder.dart';
import 'package:wear_agains/const/screens.dart';

class SampleController extends GetxController {
  final _sampleshoes = {}.obs;

  void addSampleShoes(ShoesData shoes) {
    if (_sampleshoes.containsKey(shoes)) {
      Get.snackbar(
        "Item already in cart!",
        "${shoes.shoesName} is already in the cart.",
        backgroundColor: ColorPalette.backgroundColor,
        overlayBlur: 2,
        duration: const Duration(seconds: 1),
      );
    } else {
      _sampleshoes[shoes] = 1;
      Get.snackbar(
        "Item has been added!",
        "Check ${shoes.shoesName} in the cart.",
        backgroundColor: ColorPalette.backgroundColor,
        overlayBlur: 2,
        duration: const Duration(seconds: 1),
      );
    }
  }

  void delete(ShoesData shoes) {
    if (_sampleshoes.containsKey(shoes)) {
      _sampleshoes.removeWhere((key, value) => key == shoes);

      _sampleshoes.remove(shoes);
    }
  }

  get shoes => _sampleshoes;
}
