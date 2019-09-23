import 'package:flutter/material.dart';



//void main() => runApp(MyApp());
/*
void main()
{
  runApp(MaterialApp(
    title:"Androidmonks",
    home: Scaffold(
      body: PageView(),
    ),
  ));
}
*/
/*
void main()
{
  runApp(MaterialApp(
    title:"Androidmonks",
    home: Scaffold(
      body: PageView.builder(
          itemBuilder: (context, position)
          {

          },
          itemCount: 10,
      ),
    ),
  ));
}
*/
/*
void main()
{
  runApp(MaterialApp(
    title:"Androidmonks",
    home: Scaffold(
        body: PageView.custom(
            childrenDelegate: SliverChildListDelegate([
              ListTile()
            ])),
    ),
  ));
}
*/

void main()
{
  runApp(MaterialApp(
    title:"Androidmonks",
    home: Scaffold(
      body: PageView(
        children: <Widget>[
          Container(
            child: Center(child:Text("Page 1")),
            color: Colors.red,
          ),
          Container(
            child: Center(child:Text("Page 2")),
            color: Colors.blueAccent,
          ),
          Container(
            child: Center(child:Text("Page 3")),
            color: Colors.amber,
          ),
        ],
        scrollDirection: Axis.horizontal, // scrollDirection: Axis.vertical,
        pageSnapping: true,
        physics: ClampingScrollPhysics(), //physics: BouncingScrollPhysics(),
      ),
    ),
  ));
}

//TODO: PageController ->  https://androidmonks.com/pageview-flutter/
