import "package:flutter/material.dart";
import 'package:navigation_drawer_tab_bar/ContainerFragment.dart';
import 'package:navigation_drawer_tab_bar/PageViewFragment.dart';
import 'TabBarFragment.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class DrawerPage extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Tab Bar Fragment", Icons.tab),
    new DrawerItem("Page View Fragment", Icons.pageview),
    new DrawerItem("Contaier Fragment", Icons.info)
  ];

  @override
  State<StatefulWidget> createState() {
    return new DrawerPageState();
  }
}

class DrawerPageState extends State<DrawerPage> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        //return new TabBarFragment(title: "Drawer Layout with Tabs");
        return new TabBarFragment();
      case 1:
        return new PageViewFragment();
      case 2:
        return new ContainerFragment();

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
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
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
        title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            //new UserAccountsDrawerHeader( accountName: new Text("Hello World Flutter!"), accountEmail: null),
            new DrawerHeader(
              child: Text(
                  "Hello World Flutter!",
                  textAlign: TextAlign.center,
                  textScaleFactor: 2.0,
              ),
                //decoration: BoxDecoration(color: Colors.green),
            ),
            new Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}