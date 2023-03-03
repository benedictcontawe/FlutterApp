import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_view/controllers/main_controller.dart';
import 'package:page_view/widgets/base_widget.dart';

class AppBarWidget extends BaseWidget<MainController> with PreferredSizeWidget {

  const AppBarWidget( {
    super.key,
    required this.height,
  } );

  final double height;

  @override
  Widget build(BuildContext context) {
    return PreferredSize (
      preferredSize: preferredSize,
      child: AppBar (
        backgroundColor: null,
        elevation: 0,
        title: const Text (
          "Flutter App",
          style: TextStyle(
            fontFamily: "avenir",
            fontSize: 32,
            fontWeight: FontWeight.w900
          ),
        ),
        actions: [
          IconButton (
            icon: const Icon(CupertinoIcons.arrow_left),
            onPressed: () {
              controller.onPreviousPage(1);
            },
          ),
          IconButton (
            icon: const Icon(CupertinoIcons.arrow_right),
            onPressed: () {
              controller.onNextPage(1);
            },
          )
        ],
      ),
    );
  }
  
  @override
  Size get preferredSize {
    return Size.fromHeight(height);
  }
}