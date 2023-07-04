import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wear_agains/app/viewer/chat.dart';
import '../../app/viewer/home.dart';
import '../../app/viewer/profile.dart';
import '../../const/screens.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  late ScrollController _scrollController;
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      setState(() {
        _isVisible = false;
      });
    }
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      setState(() {
        _isVisible = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List pages = [
      HomeScreen(scrollController: _scrollController),
      const ChatScreen(),
      const ProfileScreen(),
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: pages[currentIndex],
      bottomNavigationBar: _buildBottomNavbar(),
    );
  }

  AnimatedContainer _buildBottomNavbar() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: _isVisible ? kBottomNavigationBarHeight : 0.0,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorPalette.backgroundColor,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: ColorPalette.textButtonColor,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: true,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(Assets.navigationsHome), label: "Home"),
          BottomNavigationBarItem(
              icon: Image.asset(Assets.navigationsChat), label: "Chat"),
          BottomNavigationBarItem(
              icon: Image.asset(Assets.navigationsProfile), label: "Profile"),
        ],
      ),
    );
  }
}
