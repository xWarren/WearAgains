import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wear_agains/app/viewer/chat.dart';
import 'package:wear_agains/app/viewer/home.dart';
import 'package:wear_agains/app/viewer/profile.dart';
import 'package:wear_agains/const/color.dart';
import 'package:wear_agains/const/image.dart';
import 'package:wear_agains/const/scroll_to_hide.dart';

class NavigatorScreen extends StatefulWidget {
  const NavigatorScreen({super.key});

  @override
  State<NavigatorScreen> createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  final ScrollController _scrollBottomBarController = ScrollController();

  bool isVisible = true;
  @override
  void initState() {
    super.initState();
    _scrollBottomBarController.addListener(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _scrollBottomBarController.removeListener(() {});
  }

  void listen() {
    final direction = _scrollBottomBarController.position.userScrollDirection;
    if (direction == ScrollDirection.forward) {
      show();
    } else if (direction == ScrollDirection.reverse) {
      hide();
    }
  }

  void show() {
    if (!isVisible) {
      setState(() {
        isVisible = true;
      });
    }
  }

  void hide() {
    if (isVisible) {
      setState(() {
        isVisible = false;
      });
    }
  }

  List pages = [const HomeScreen(), const ChatScreen(), const ProfileScreen()];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomeScreen();
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: PageStorage(
          bucket: bucket,
          child: currentScreen,
        ),
        bottomNavigationBar: ScrollToHideWidget(
            controller: _scrollBottomBarController,
            child: BottomAppBar(
              notchMargin: 5.0,
              color: ColorPalette.formFieldColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                currentScreen = const HomeScreen();
                                currentIndex = 0;
                              });
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  Assets.navigationsHome,
                                  width: 20,
                                  height: 24,
                                  color: currentIndex == 0
                                      ? Colors.blue
                                      : ColorPalette.elevatedButtonColor,
                                ),
                                Text(
                                  "Home",
                                  style: TextStyle(
                                    color: currentIndex == 0
                                        ? Colors.blue
                                        : ColorPalette.elevatedButtonColor,
                                    fontSize: 10,
                                  ),
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, top: 10.0, bottom: 10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                currentScreen = const ChatScreen();
                                currentIndex = 1;
                              });
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  Assets.navigationsChat,
                                  width: 24,
                                  height: 24,
                                  color: currentIndex == 1
                                      ? Colors.blue
                                      : ColorPalette.elevatedButtonColor,
                                ),
                                Text(
                                  "ChatScreen",
                                  style: TextStyle(
                                    color: currentIndex == 1
                                        ? Colors.blue
                                        : ColorPalette.elevatedButtonColor,
                                    fontSize: 10,
                                  ),
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 40.0, top: 10.0, bottom: 10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                currentScreen = const ProfileScreen();
                                currentIndex = 2;
                              });
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  Assets.navigationsProfile,
                                  width: 24,
                                  height: 24,
                                  color: currentIndex == 2
                                      ? Colors.blue
                                      : ColorPalette.elevatedButtonColor,
                                ),
                                Text(
                                  "Profile",
                                  style: TextStyle(
                                    color: currentIndex == 2
                                        ? Colors.blue
                                        : ColorPalette.elevatedButtonColor,
                                    fontSize: 10,
                                  ),
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
