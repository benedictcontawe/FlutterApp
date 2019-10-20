import 'package:flutter/material.dart';

class PageViewFragment extends StatelessWidget {
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          children: <Widget>[
            Container(
              child: Center(child:Text("Page 1")),
              color: Colors.white,
            ),
            Container(
              child: Center(child:Text("Page 2")),
              color: Colors.white,
            ),
            Container(
              child: Center(child:Text("Page 3")),
              color: Colors.white,
            ),
            Container(
              child: Center(child:Text("Page 4")),
              color: Colors.white,
            )
          ],
          controller: controller,
          onPageChanged: (num) {
            //controller.jumpToPage(0);
            //print("PageViewFragment onPageChanged(): " + controller.position.toString());
            print("PageViewFragment onPageChanged(): " + num.toString());
          },
          scrollDirection: Axis.horizontal, // scrollDirection: Axis.vertical,
          pageSnapping: true,
          physics: BouncingScrollPhysics(), //physics: ClampingScrollPhysics(),
        ),
      );
  }
}