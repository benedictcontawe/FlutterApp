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
    return const FractionallyScrollViewWidget (
      widthFactor: 1,
      heightFactor: 1,
      isScrollable: true,
    );
  }
}