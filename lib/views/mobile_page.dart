import 'package:dart_media_query/views/base_view.dart';
import 'package:dart_media_query/widgets/drawer_wiget.dart';
import 'package:dart_media_query/widgets/mobile_body_widget.dart';
import 'package:flutter/material.dart';

class MobilePage extends BaseView {

  const MobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar (
        elevation: 0,
        title: const Text (
          "Flutter App",
          style: TextStyle(
            fontFamily: "avenir",
            fontSize: 32,
            fontWeight: FontWeight.w900
          ),
        ),
      ),
      body: const MobileBodyWidget(),
      drawer: const DrawerWidget(),
    );
  }
}