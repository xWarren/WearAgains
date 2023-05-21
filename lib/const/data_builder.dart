import 'package:wear_agains/const/image.dart';

class ShoesData {
  final String shoesImage;
  final String shoesName;
  final String sizeText;
  final String conditionText;
  final String authenticity;
  final double priceText;

  ShoesData(
      {required this.shoesImage,
      required this.shoesName,
      required this.sizeText,
      required this.conditionText,
      required this.authenticity,
      required this.priceText});
}

List<ShoesData> shoes = [
  ShoesData(
      shoesImage: Assets.shoesConverse,
      shoesName: "Nike X Converse Classic",
      sizeText: "EUR42",
      conditionText: "8/10",
      authenticity: "Authenticity not guaranteed",
      priceText: 1500.00),
  ShoesData(
      shoesImage: Assets.shoesZoom,
      shoesName: "Nike Zoom 2k Trainers",
      sizeText: "EUR45",
      conditionText: "9/10",
      authenticity: "Authenticity not guaranteed",
      priceText: 1500.00),
  ShoesData(
      shoesImage: Assets.shoesYeezy,
      shoesName: "Yeezy 700",
      sizeText: "EUR42",
      conditionText: "8/10",
      authenticity: "Authenticity not guaranteed",
      priceText: 1500.00)
];

class TShirtsData {
  final String tshirtsImage;
  final String tshirtsName;
  final String sizeText;
  final String conditionText;
  final double priceText;

  TShirtsData(
      {required this.tshirtsImage,
      required this.tshirtsName,
      required this.sizeText,
      required this.conditionText,
      required this.priceText});
}

List<TShirtsData> tshirts = [
  TShirtsData(
      tshirtsImage: Assets.tshirtsBench,
      tshirtsName: "Bench T-Shirt",
      sizeText: "Extra Large",
      conditionText: "8/10",
      priceText: 120.00),
  TShirtsData(
      tshirtsImage: Assets.tshirtsFervent,
      tshirtsName: "Fervent T-Shirt",
      sizeText: "Medium",
      conditionText: "9/10",
      priceText: 100.00),
  TShirtsData(
      tshirtsImage: Assets.tshirtsGiordano,
      tshirtsName: "Giordano T-Shirt",
      sizeText: "Medium",
      conditionText: "8/10",
      priceText: 150.00)
];
