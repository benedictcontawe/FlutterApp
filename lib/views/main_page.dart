import 'package:navigation_drawer/models/navigation_drawer_model.dart';
import 'package:navigation_drawer/widgets/first_widget.dart';
import 'package:navigation_drawer/widgets/second_widget.dart';
import 'package:navigation_drawer/widgets/third_widget.dart';
import "package:flutter/material.dart";

class MainPage extends StatefulWidget {
  final drawerModels = [
    new NavigationDrawerModel("Fragment 1", Icons.rss_feed),
    new NavigationDrawerModel("Fragment 2", Icons.local_pizza),
    new NavigationDrawerModel("Fragment 3", Icons.info)
  ];

  @override
  State<StatefulWidget> createState() {
    return new MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new FirstWidget();
      case 1:
        return new SecondWidget();
      case 2:
        return new ThirdWidget();
      default:
        return new Text("Error");
    }
  }
  
  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerModels.length; i++) {
      var d = widget.drawerModels[i];
      drawerOptions.add(
        new ListTile(
          leading: new Icon(d.icon),
          title: new Text(d.title),
          selected: i == _selectedDrawerIndex,
          onTap: () => _onSelectItem(i),
        )
      );
    }

    return new Scaffold(
      appBar: new AppBar(
        // here we display the title corresponding to the fragment
        // you can instead choose to have a static title
        title: new Text(widget.drawerModels[_selectedDrawerIndex].title),
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("John Doe"), accountEmail: null),
            new Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}