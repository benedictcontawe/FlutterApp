import 'package:flutter/material.dart';

//void main() => runApp(MyApp());

void main()
{ 
  //#region Constructor()
  /*
  runApp(MaterialApp(
    title:"PageView",
    home: Scaffold(
      body: PageView(),
    ),
  ));
  */
  //#endregion
  //#region PageView.Builder Method
  /*
  runApp(MaterialApp(
    title:"PageView",
    home: Scaffold(
      body: PageView.builder(
          itemBuilder: (context, position)
          {

          },
          itemCount: 10,
      ),
    ),
  ));
  */
  //#endregion
  //#region PageView.Custom
  /*
  runApp(MaterialApp(
    title:"PageView",
    home: Scaffold(
        body: PageView.custom(
            childrenDelegate: SliverChildListDelegate([
              ListTile()
            ])),
    ),
  ));
  */
  //#endregion
  PageController controller = PageController();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: true,
    title:"PageView",
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
          Container(
            child: Center(child:Text("Page 4")),
            color: Colors.greenAccent,
          )
        ],
        controller: controller,
        onPageChanged: (num){
          //controller.jumpToPage(2);
          print("Change: " + controller.position.toString());
        },
        scrollDirection: Axis.horizontal, // scrollDirection: Axis.vertical,
        pageSnapping: true,
        physics: ClampingScrollPhysics(), //physics: BouncingScrollPhysics(),
      ),
    ),
  ));
}

//Reference: https://androidmonks.com/pageview-flutter/