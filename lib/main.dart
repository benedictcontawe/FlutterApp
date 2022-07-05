import 'package:flutter/material.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3, //lenght must be equal to the number of tab bar provided
        child: Scaffold(
          appBar: AppBar(
            title: const Text("AppBar with Tabs",textAlign: TextAlign.center,),
            bottom: const TabBar(
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
              const AndroidAction(),
              const Text("Third Tab Selected"),
            ],
          ),
        )
      ),
    );
  }
}

class AndroidAction extends StatefulWidget {
  const AndroidAction({Key? key}) : super(key : key);

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
              checkTick = newTick!;
            });
          }
        )
      ],
    );
  }
}