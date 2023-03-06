import 'package:dart_media_query/widgets/base_widgets.dart';
import 'package:flutter/material.dart';

class ScrollViewWidget extends BaseWidget {

  const ScrollViewWidget( {
    super.key,
    required this.children,
    required this.isScrollable,
    required this.mainAxisAlignment,
    required this.mainAxisSize,
    this.padding,
    required this.scrollContoller,
  } );

  final List<Widget> children;
  final bool isScrollable;
  final MainAxisAlignment? mainAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final EdgeInsetsGeometry? padding;
  final ScrollController? scrollContoller;

   @override
  Widget build(BuildContext context) {
    return Expanded (
      child: Scrollbar (
        controller: scrollContoller,
        thickness: 10,
        trackVisibility: true, //showTrackOnHover: true,
        thumbVisibility: true, //isAlwaysShown: true,
        child: SingleChildScrollView (
          physics: isScrollable ? const AlwaysScrollableScrollPhysics() : const NeverScrollableScrollPhysics(),
          child: Padding (
            padding: padding ?? EdgeInsets.zero,
            child: Column (
              mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
              mainAxisSize: mainAxisSize ?? MainAxisSize.max,
              children: children,
            ),
          ),
        )
      )
    );
  } 
}