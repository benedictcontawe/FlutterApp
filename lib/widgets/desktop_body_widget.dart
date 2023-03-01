import 'package:dart_media_query/controllers/main_controller.dart';
import 'package:dart_media_query/widgets/base_widgets.dart';
import 'package:dart_media_query/widgets/fractionally_navigation_bar_widget.dart';
import 'package:dart_media_query/widgets/fractionally_scroll_view_widget.dart';
import 'package:flutter/material.dart';

class DesktopBodyWidget extends BaseWidget<MainController> {

  const DesktopBodyWidget( {
    super.key});

  @override
  Widget build(BuildContext context) {
    return Stack (            
      fit: StackFit.expand,
      children: const <Widget> [ 
        Align (
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
          ),
        )
      ],
    );
  }
}