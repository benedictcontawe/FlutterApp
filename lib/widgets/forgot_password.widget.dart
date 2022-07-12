import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordWidget extends GetWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                color: Colors.black,
              )
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: const Center(child:Text("Login")),
              )
            ),
            Expanded(
              child: Container(
                color: Colors.black,
              )
            ),
          ],
        );
  }
}