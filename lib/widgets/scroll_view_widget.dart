import 'package:dart_media_query/widgets/base_widgets.dart';
import 'package:flutter/material.dart';

class ScrollViewWidget extends BaseWidget {

  const ScrollViewWidget( {
    super.key,
    required this.isScrollable,
  } );

  final bool isScrollable;

   @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thickness: 10,
      //isAlwaysShown: true,
      child: SingleChildScrollView (
        physics: isScrollable ? const AlwaysScrollableScrollPhysics() : const NeverScrollableScrollPhysics(),
        child: Column(
          children: <Widget>[
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
    );
  } 
}