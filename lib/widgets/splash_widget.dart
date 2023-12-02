import 'package:flutter/material.dart';
import 'package:navigation_drawer/controllers/splash_controller.dart';
import 'package:navigation_drawer/widgets/base_widgets.dart';

class SplashWidget extends BaseWidget<SplashController> {
  
  const SplashWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
      color: Colors.white,
      child: const Align(alignment: Alignment.center,
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlutterLogo(),
          Text(
            'Flutter App', 
            style: TextStyle(
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