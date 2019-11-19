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
      debugShowCheckedModeBanner: true,
      theme: ThemeData(primarySwatch: Colors.teal),
      home: new ScrollViewWidget(),
    );
  }  
}
      
class ScrollViewWidget extends StatefulWidget {
  ScrollViewState createState() => ScrollViewState();
}

class ScrollViewState extends State<ScrollViewWidget> {
bool chckSwitch = false ?? false; //With null default value of false

Widget customCheckBox() {
  return FractionallySizedBox( //To use the percentage screen layout
    widthFactor: 1, //match screen parent
    heightFactor: 0.1, //accumulate 10% of the screen
    child: Row( //Like Linearlayout orientation horizontal
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Checkbox(
          value: chckSwitch, //Initial value of the check box
          onChanged: (bool value) { //On check change of the check box
            setState(() {
              chckSwitch = value;
            });
          },
        ),
        Text("Scroll View Switch"),
      ],
    ),
  );
}

Widget customScrollView() {
  return FractionallySizedBox(
    widthFactor: 1,
    heightFactor: 0.9,
    child: SingleChildScrollView(
      physics: chckSwitch ? const  NeverScrollableScrollPhysics() : const AlwaysScrollableScrollPhysics(), //Conditional statement for enable and disable scrollview
      //TODO Put the webview inside SingleChildScrollView for the long text, justify
      child: Column(
        children: <Widget>[
          Container(color: Colors.red, height: 50.0),
          Container(color: Colors.orange, height: 50.0),
          Container(color: Colors.yellow, height: 50.0),
          Container(color: Colors.green, height: 50.0),
          Container(color: Colors.blue, height: 50.0),
          Container(color: Colors.indigo, height: 50.0),
          Container(color: Colors.purple, height: 50.0),
          
          Container(color: Colors.red, height: 50.0),
          Container(color: Colors.orange, height: 50.0),
          Container(color: Colors.yellow, height: 50.0),
          Container(color: Colors.green, height: 50.0),
          Container(color: Colors.blue, height: 50.0),
          Container(color: Colors.indigo, height: 50.0),
          Container(color: Colors.purple, height: 50.0),

          Container(color: Colors.red, height: 50.0),
          Container(color: Colors.orange, height: 50.0),
          Container(color: Colors.yellow, height: 50.0),
          Container(color: Colors.green, height: 50.0),
          Container(color: Colors.blue, height: 50.0),
          Container(color: Colors.indigo, height: 50.0),
          Container(color: Colors.purple, height: 50.0),

          Container(color: Colors.red, height: 50.0),
          Container(color: Colors.orange, height: 50.0),
          Container(color: Colors.yellow, height: 50.0),
          Container(color: Colors.green, height: 50.0),
          Container(color: Colors.blue, height: 50.0),
          Container(color: Colors.indigo, height: 50.0),
          Container(color: Colors.purple, height: 50.0),
        ],
      ),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: const Text('ScrollViewApp'),
      ),
      backgroundColor: Colors.white,
      body:  Stack (            
          fit: StackFit.expand,
          children: <Widget>[
            //Container(color: Colors.white,),
            Align(
              alignment: Alignment.topCenter,
              child: customCheckBox(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: customScrollView(),
            )
          ],
      ),
    );
  }
}