import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'CalculatorFragment.dart';

void main() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]); //Locks device to portrait mode
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  new MaterialApp(
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: new CalculatorFragment(),
      );
  }  
}