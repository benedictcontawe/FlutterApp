import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Snack Bar App',
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget main = Scaffold(
      appBar: AppBar(title: Text('Stack Banners')),
      
    );

  return Stack (
      fit: StackFit.expand,
      children: <Widget>[
        main,
        Banner(
          message: "Top Start",
          location: BannerLocation.topStart,
        ),
        Banner(
          message: "Top End",
          location: BannerLocation.topEnd,
        ),
        Banner(
          message: "Bottom Start",
          location: BannerLocation.bottomStart,
        ),
        Banner(
          message: "Bottom End",
          location: BannerLocation.bottomEnd,
        ),
      ],
    );
  }
}