import 'package:flutter/material.dart';
import 'package:iframe/iframe_widget.dart';

void main() {
  runApp(
    MainApp()
  );
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      title: 'Iframe Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IframeWidget (
        height: '80%',
        width: '80%',
        src: 'https://flutter.dev/',
        border: 'none',
      ),
    );
  }
}