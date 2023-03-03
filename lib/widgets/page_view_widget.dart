import 'package:flutter/material.dart';
import 'package:page_view/controllers/main_controller.dart';
import 'package:page_view/widgets/base_widget.dart';

class PageViewWidget extends BaseWidget<MainController> {
  
  PageViewWidget( { super.key } );

  final List<Widget> _pages = [
    Container(
      child: Center(child:Text("Page 1")),
      color: Colors.redAccent,
    ),
    Container(
      child: Center(child:Text("Page 2")),
      color: Colors.blueAccent,
    ),
    Container(
      child: Center(child:Text("Page 3")),
      color: Colors.amberAccent,
    ),
    Container(
      child: Center(child:Text("Page 4")),
      color: Colors.greenAccent,
    ),
    Container(
      child: Center(child:Text("Page 5")),
      color: Colors.purpleAccent,
    )
  ];

  @override
  Widget build(BuildContext context) {      
    return PageView.builder (
      controller: controller.getPageController(),
      itemBuilder: (BuildContext context, int index) { 
        return _pages[index];
      },
      itemCount: _pages.length,
      onPageChanged: (value) {
        return print("PageViewWidget onPageChanged: " + value.toString());
      },
      pageSnapping: controller.isPageSnapping(),
      physics: controller.getScrollPhysics(),
      reverse: controller.isReverese(),
      scrollDirection: controller.getPageAxis(),
    );
  }
}