import 'package:dart_media_query/widgets/base_widgets.dart';
import 'package:flutter/material.dart';

class AppBarTitleWidget extends BaseWidget {

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