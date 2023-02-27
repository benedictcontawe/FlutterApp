import 'package:dart_media_query/controllers/main_controller.dart';
import 'package:dart_media_query/widgets/base_widgets.dart';
import 'package:flutter/material.dart';

class DrawerHeaderWidget extends BaseWidget<MainController> {

  const DrawerHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image:  AssetImage('assets/flutter.webp')
        )
      ),
      child: Stack(children: const <Widget>[
        Positioned(
          bottom: 12.0,
          left: 16.0,
          child: Text(
            "Flutter Step-by-Step",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20.0,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
      ] ),
    );
  }
}