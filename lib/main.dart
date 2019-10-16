import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stack Banners App',
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
        Container(
        color: Colors.green,
        ),
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
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
          color: Colors.red,
          height: 100,
          width: 100,
        )
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
          color: Colors.green,
          height: 70,
          width: 70,
        )
        ),
        Align(
          alignment: Alignment.center,
          child:Text(
            'Hello Stack',
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.yellow,
            ),
          )
        )
      ],
    );
  }
}