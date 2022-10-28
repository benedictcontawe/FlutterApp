import 'package:flutter/material.dart';
import 'package:x/views/DrawerPage.dart';

class MaterialWidget extends StatelessWidget {

  const MaterialWidget ( {super.key} );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Drawer Layout with Tabs',
      theme: new ThemeData(
        primaryColor: Colors.green,
      ),
      home: new DrawerPage(),
    );
  }
}