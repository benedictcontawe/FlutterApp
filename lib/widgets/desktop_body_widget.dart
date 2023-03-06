import 'package:dart_media_query/widgets/base_widgets.dart';
import 'package:dart_media_query/widgets/fractionally_navigation_bar_widget.dart';
import 'package:dart_media_query/widgets/fractionally_scroll_view_widget.dart';
import 'package:flutter/material.dart';

class DesktopBodyWidget extends BaseWidget {

  const DesktopBodyWidget( {
    super.key
  } );

  @override
  Widget build(BuildContext context) {
    return Stack (            
      fit: StackFit.expand,
      children: <Widget> [ 
        const Align (
          alignment: Alignment.topCenter,
          child: FractionallyNavigationBarWidget (
            widthFactor: 1,
            heightFactor: 0.10,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: FractionallyScrollViewWidget (
            widthFactor: 1,
            heightFactor: 0.90,
            isScrollable: true,
            scrollContoller: ScrollController(initialScrollOffset: 0.00),
            children: [
              Container(color: Colors.red, height: 50.0),
              Container(color: Colors.orange, height: 50.0),
              Container(color: Colors.yellow, height: 50.0),
              Container(color: Colors.green, height: 50.0),
              Container(color: Colors.blue, height: 50.0),
              Container(color: Colors.indigo, height: 50.0),
              Container(color: Colors.purple, height: 50.0),
              
              Container(color: Colors.red, height: 50.0),
              Container(color: Colors.orange, height: 50.0),
              Container(color: Colors.yellow, height: 50.0),
              Container(color: Colors.green, height: 50.0),
              Container(color: Colors.blue, height: 50.0),
              Container(color: Colors.indigo, height: 50.0),
              Container(color: Colors.purple, height: 50.0),

              Container(color: Colors.red, height: 50.0),
              Container(color: Colors.orange, height: 50.0),
              Container(color: Colors.yellow, height: 50.0),
              Container(color: Colors.green, height: 50.0),
              Container(color: Colors.blue, height: 50.0),
              Container(color: Colors.indigo, height: 50.0),
              Container(color: Colors.purple, height: 50.0),

              Container(color: Colors.red, height: 50.0),
              Container(color: Colors.orange, height: 50.0),
              Container(color: Colors.yellow, height: 50.0),
              Container(color: Colors.green, height: 50.0),
              Container(color: Colors.blue, height: 50.0),
              Container(color: Colors.indigo, height: 50.0),
              Container(color: Colors.purple, height: 50.0),
            ],
          ),
        )
      ],
    );
  }
}