import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(new MainApp());

class MainApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drawer Layout with Tabs',
      theme: new ThemeData(
        primaryColor: Colors.green,
      ),
      home: HomePage(title: "Drawer Layout with Tabs"),
    );
  }
}

class HomePage extends StatelessWidget {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text(title),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Text(
                  "Hello Flutter!!",
                  textAlign: TextAlign.justify,
                  textScaleFactor: 2.0,
                ),
                decoration: BoxDecoration(color: Colors.green),
              ),
              ListTile(
                title: Text("First"),
                onTap: () {
                  Navigator.pop(context); // close the drawer
                },
              ),
              ListTile(
                title: Text("Second"),
                onTap: () {
                  Navigator.pop(context); // close the drawer
                },
              )
            ],
          ),
        ),
        body: new DefaultTabController(
          length: 3,
          child: new Scaffold(
            appBar: new AppBar(
              actions: <Widget>[],
              title: new TabBar(
                tabs: [
                  new Tab(icon: new Icon(Icons.directions_walk)),
                  new Tab(icon: new Icon(Icons.directions_railway)),
                  new Tab(icon: new Icon(Icons.directions_subway)),
                ],
                indicatorColor: Colors.white,
              ),
            ),
            body: new TabBarView(
              children: [
                new Icon(Icons.directions_walk,size: 50.0,),
                new Icon(Icons.directions_railway,size: 50.0,),
                new Icon(Icons.directions_subway,size: 50.0,),
              ],
            ),
          ),
        ));
  }
}