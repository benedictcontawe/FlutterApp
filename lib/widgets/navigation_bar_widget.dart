import 'package:dart_media_query/widgets/base_widgets.dart';
import 'package:dart_media_query/widgets/navigation_cell_widget.dart';
import 'package:flutter/material.dart';

class NavigationBarWidget extends BaseWidget {
  
  const NavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          NavigationCellWidget(text: 'Home'),
          NavigationCellWidget(text: 'About'),
          NavigationCellWidget(text: 'Contact'),
        ],
      ),
    );
  }
}