import 'package:flutter/material.dart';
import 'package:iframe/iframe_widget.dart';

void main() {
  runApp (
    MaterialApp (
       title: 'Iframe Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainApp(),
    )
  );
}

class MainApp extends StatelessWidget {

  const MainApp( { super.key } );

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: Wrap (
        direction: Axis.horizontal,
        children: [
          IframeWidget (
            height: '100%',
            width: '100%',
            src: 'https://flutter.dev/',
            border: 'inset',//'none'
            mediaQueryHeight: MediaQuery.of(context).size.height * 1.00,
            mediaQueryWidth: MediaQuery.of(context).size.width * 1.00,
          ),
        ],
      ),
    );
  }
}