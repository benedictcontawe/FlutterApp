import 'package:dart_media_query/widgets/base_widgets.dart';
import 'package:dart_media_query/widgets/navigation_bar_widget.dart';
import 'package:flutter/material.dart';

class DesktopBodyWidget extends BaseWidget {

  const DesktopBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NavigationBarWidget(),
      ],
    );
  }
}