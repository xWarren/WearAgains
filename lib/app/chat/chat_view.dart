import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wear_agains/const/data_builder.dart';
import 'package:wear_agains/const/screens.dart';

class ChatViewScreen extends StatefulWidget {
  final ChatData chatData;
  const ChatViewScreen({required this.chatData, super.key});

  @override
  State<ChatViewScreen> createState() => _ChatViewScreenState();
}

class _ChatViewScreenState extends State<ChatViewScreen> {
  final TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorPalette.backgroundColor,
        title: Row(
          children: [
            Image.asset(widget.chatData.imageData, scale: 2),
            SizedBoxWidth.fiveSizedBox,
            Text(widget.chatData.nameData, style: TextStyleData.chatNameStyle),
          ],
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body:
          const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hello",
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ],
        )
      ]),
      bottomSheet: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: TextFormField(
            controller: messageController,
            decoration: InputDecoration(
                fillColor: ColorPalette.elevatedButtonColor,
                filled: false,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                prefixIcon: Image.asset(Assets.addChat),
                suffixIcon: Image.asset(Assets.sendChat),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        width: 0.5, color: ColorPalette.chatColor)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        width: 0.5, color: ColorPalette.chatColor))),
          )),
    );
  }
}
