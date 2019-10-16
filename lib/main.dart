import 'package:flutter/material.dart';
import 'package:bottom_navigation/home_widget.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     title: 'My Flutter App',
     home: Home(),
   );
 }
}