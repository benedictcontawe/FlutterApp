
import 'package:dart_media_query/widgets/base_widgets.dart';
import 'package:dart_media_query/widgets/scroll_view_widget.dart';
import 'package:flutter/material.dart';

class FractionallyScrollViewWidget extends BaseWidget {

  const FractionallyScrollViewWidget( {
    super.key,
    required this.widthFactor,
    required this.heightFactor,
    required this.isScrollable,
  } );

  final double widthFactor;
  final double heightFactor;
  final bool isScrollable;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox (
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: ScrollViewWidget (
        isScrollable: isScrollable,
      ),
    );
  }
}