import "package:flutter/material.dart";
import 'package:x/models/navigation_drawer_model.dart';
import 'package:x/widgets/PageViewFragment.dart';
import 'package:x/widgets/TabBarFragment.dart';
import '../widgets/container_widget.dart';

class DrawerPage extends StatefulWidget {
  final _drawerModels = [
    new NavigationDrawerModel ("Tab Bar Fragment", Icons.tab),
    new NavigationDrawerModel ("Page View Fragment", Icons.pageview),
    new NavigationDrawerModel ("Contaier Fragment", Icons.info)
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
        return new TabBarWidget(); //return new TabBarFragment(title: "Drawer Layout with Tabs");
      case 1:
        return new PageViewWidget();
      case 2:
        return new ContainerWidget();
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
    for (var i = 0; i < widget._drawerModels.length; i++) {
      var d = widget._drawerModels[i];
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
        title: new Text(widget._drawerModels[_selectedDrawerIndex].title),
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