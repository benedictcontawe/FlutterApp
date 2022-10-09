import 'package:getx_storage/controllers/splash_controller.dart';
import 'package:getx_storage/widgets/base_widgets.dart';
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
            'assets/flutter.webp',
            fit: BoxFit.cover,
            height: 100,
            width: 100,
            alignment: Alignment.center,
          ),
          const Text(
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