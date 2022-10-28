import 'package:flutter/material.dart';
import 'package:navigation_drawer/views/main_page.dart';

class MaterialWidget extends StatelessWidget {

  const MaterialWidget ( {super.key} );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'NavigationDrawer Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MainPage(),
    );
  }
}