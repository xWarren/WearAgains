import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wear_agains/app/chat/chat_view.dart';
import 'package:wear_agains/const/data_builder.dart';
import 'package:wear_agains/const/screens.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: 100),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Message",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Container(
            height: Get.height / 10,
            decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.grey.shade400))),
            child: ListView.builder(
              itemCount: chatdata.length,
              padding: const EdgeInsets.only(top: 20),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(ChatViewScreen(chatData: chatdata[index]));
                  },
                  child: Row(
                    children: [
                      SizedBoxWidth.fiveSizedBox,
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          chatdata[index].imageData,
                          scale: 1.5,
                        ),
                      ),
                      SizedBoxWidth.fiveSizedBox,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(chatdata[index].nameData,
                                style: TextStyleData.chatNameStyle),
                            SizedBoxHeight.tenSizedBox,
                            Row(
                              children: [
                                Text(chatdata[index].messageData,
                                    style: TextStyleData.chatStyle),
                                SizedBoxWidth.fiveSizedBox,
                                Container(
                                  width: 5,
                                  height: 5,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade500,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                SizedBoxWidth.fiveSizedBox,
                                Text(
                                  chatdata[index].timeData,
                                  style: const TextStyle(
                                      fontSize: 7, fontWeight: FontWeight.w300),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        )
      ]),
    );
  }
}
