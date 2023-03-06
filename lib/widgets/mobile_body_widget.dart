import 'package:dart_media_query/widgets/base_widgets.dart';
import 'package:dart_media_query/widgets/fractionally_scroll_view_widget.dart';
import 'package:flutter/material.dart';

class MobileBodyWidget extends BaseWidget {

  const MobileBodyWidget( {
    super.key 
  } );

  @override
  Widget build(BuildContext context) {
    /*
    return Column(
      children: const <Widget> [
        Flexible (
          child: FractionallyScrollViewWidget (
            widthFactor: 1,
            heightFactor: 1,
            isScrollable: true,
          ),
        ),
      ],
    );
    */
    return FractionallyScrollViewWidget (
      widthFactor: 1,
      heightFactor: 1,
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
    );
  }
}