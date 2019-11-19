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
      debugShowCheckedModeBanner: false,
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
  return FractionallySizedBox(
    widthFactor: 1,
    heightFactor: 0.1,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Checkbox(
          value: chckSwitch,
          onChanged: (bool value) {
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
  //TODO Create SingleChildScrollView, put all the long text inside
  return FractionallySizedBox(
    widthFactor: 1,
    heightFactor: 0.9,
    child: SingleChildScrollView(
      physics: chckSwitch ? const  NeverScrollableScrollPhysics() : const AlwaysScrollableScrollPhysics(), //Conditional statement for enable and disable scrollview
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