import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]); //Locks device to portrait mode
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  new MaterialApp(
      title: 'Scroll View',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: new ScrollViewWidget(),
            );
  }  
}
      
class ScrollViewWidget extends StatefulWidget {
  ScrollViewState createState() => ScrollViewState();
}

class ScrollViewState extends State<ScrollViewWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: null,
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            //TODO Follow this https://github.com/benedictcontawe/ScrollViewApp
          ],
        ),
      )
    );
  }

}