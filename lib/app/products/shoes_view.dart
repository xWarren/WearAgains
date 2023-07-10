import 'package:flutter/material.dart';
import 'package:wear_agains/const/appbar.dart';

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
      body: Column(children: []),
    );
  }
}
