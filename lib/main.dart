import 'package:flutter/material.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3, //lenght must be equal to the number of tab bar provided
        child: Scaffold(
          appBar: AppBar(
            title: Text("AppBar with Tabs",textAlign: TextAlign.center,),
            bottom: TabBar(
              isScrollable: true,
              tabs: <Widget>[
                Text("First Tab"),
                Tab(icon: Icon(Icons.android),),
                Text("Third Tab"),
              ]
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Container(
                child: Center(child:Text("First Tab Selected")),
                color: Colors.white,
              ),
              AndroidAction(),
              Text("Third Tab Selected"),
            ],
          ),
        )
      ),
    );
  }
}

class AndroidAction extends StatefulWidget {
  @override
  AndroidActionApp createState() {
    return AndroidActionApp();
  }
}

class AndroidActionApp extends State<AndroidAction> {
  int counter = 0 ;
  bool checkTick = false;
  @override
  Widget build(BuildContext context) {
    return Column (
      children: <Widget>[
        Text("Counter Value => $counter"),
        Checkbox (
          value: checkTick,
          onChanged: (newTick) {
            setState(() {
              counter++;
              checkTick = newTick;
            });
          }
        )
      ],
    );
  }
}