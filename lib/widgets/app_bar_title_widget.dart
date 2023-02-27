import 'package:dart_media_query/views/base_view.dart';
import 'package:flutter/material.dart';

class AppBarTitleWidget extends BaseView {

  const AppBarTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text (
      "Flutter App",
      style: TextStyle(
        fontFamily: "avenir",
        fontSize: 32,
        fontWeight: FontWeight.w900
      ),
    );
  }
}