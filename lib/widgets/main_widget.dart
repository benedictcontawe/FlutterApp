import 'package:flutter/material.dart';
import 'package:page_view/widgets/base_widget.dart';
import 'package:page_view/widgets/circle_indicator_widget.dart';
import 'package:page_view/widgets/page_view_widget.dart';

class MainWidget extends BaseWidget {
  
  const MainWidget( { super.key } );

  @override
  Widget build(BuildContext context) {      
    return Stack(
      children: <Widget> [
        PageViewWidget(),
        const CircleIndicatorWidget(),
      ],
    );
  }
}