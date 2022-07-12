import 'package:get_x/controllers/splash_controller.dart';
import 'package:get_x/widgets/base_widget.dart';
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
        children: [
          Image.asset(
            'assets/flutter.png', 
            height: 100,
            width: 100,
            fit: BoxFit.fitWidth,
          ),
          const Text('Splash App', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigo),)
        ],
      ),),
    ),
    );
  } 
}