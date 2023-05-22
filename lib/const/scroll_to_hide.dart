import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScrollToHideWidget extends StatefulWidget {
  final Widget child;
  final ScrollController controller;
  final Duration duration;
  const ScrollToHideWidget(
      {required this.child,
      required this.controller,
      this.duration = const Duration(milliseconds: 200),
      super.key});

  @override
  State<ScrollToHideWidget> createState() => _ScrollToHideWidgetState();
}

class _ScrollToHideWidgetState extends State<ScrollToHideWidget> {
  bool isVisible = true;
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {});
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.removeListener(() {});
  }

  void listen() {
    final direction = widget.controller.position.userScrollDirection;
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

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: widget.duration,
        height: isVisible ? kBottomNavigationBarHeight : 0,
        child: Wrap(
          children: [widget.child],
        ));
  }
}
