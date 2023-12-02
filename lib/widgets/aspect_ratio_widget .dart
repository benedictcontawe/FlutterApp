import 'package:flutter/material.dart';
import 'package:navigation_drawer/widgets/base_widgets.dart';

class AspectRatioWidget extends BaseWidget {

  const AspectRatioWidget( { super.key, required this.aspectRatio, required this.child } );

  final double aspectRatio;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AspectRatio (
      aspectRatio: aspectRatio,
      child: child,
    );
  }
}
