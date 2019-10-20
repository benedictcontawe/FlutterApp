import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'DrawerPage.dart';

void main() => runApp(new MainApp());

class MainApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drawer Layout with Tabs',
      theme: new ThemeData(
        primaryColor: Colors.green,
      ),
      home: new DrawerPage(),
    );
  }
}