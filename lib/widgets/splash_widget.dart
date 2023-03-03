import 'package:page_view/controllers/splash_controller.dart';
import 'package:page_view/widgets/base_widget.dart';
import 'package:flutter/material.dart';

class SplashWidget extends BaseWidget<SplashController> {
  
  const SplashWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
      color: Colors.white,
      child: Align(alignment: Alignment.center,
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          const FlutterLogo(
            size: 100,
            style: FlutterLogoStyle.markOnly,
          ),
          const Text(
            'Flutter App', 
            style: TextStyle (
              fontSize: 20, 
              fontWeight: FontWeight.bold, 
              color: Colors.indigo
            ),
            )
        ],
      ),),
    ),
    );
  } 
}