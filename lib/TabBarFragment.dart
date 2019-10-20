import 'package:flutter/material.dart';

class TabBarFragment extends StatelessWidget {
  //final String title;

  TabBarFragment({Key key}) : super(key: key);
  //TabBarFragment({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: new AppBar(title: Text(title),),
      body: new DefaultTabController(
        length: 3,
        child: new Scaffold(
          appBar: new AppBar(
            actions: <Widget>[],
            title: new TabBar(
              onTap: (index) {
                //your currently selected index
                print("TabBarFragment onTap(): " + index.toString());
              },
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
      )
    );
  }
}