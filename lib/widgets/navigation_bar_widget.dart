import 'package:dart_media_query/widgets/base_widgets.dart';
import 'package:dart_media_query/widgets/navigation_cell_widget.dart';
import 'package:flutter/material.dart';

class NavigationBarWidget extends BaseWidget {
  
  const NavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      height: 100.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          NavigationCellWidget(text: 'Home'),
          NavigationCellWidget(text: 'About'),
          NavigationCellWidget(text: 'Contacts',),
          NavigationCellWidget(text: 'Events',),
          NavigationCellWidget(text: 'Notes',),
          const Divider(),
          NavigationCellWidget(text: 'Steps'),
          NavigationCellWidget(text: 'Authors'),
          NavigationCellWidget(text: 'Flutter Documentation'),
          NavigationCellWidget(text: 'Useful Links'),
          const Divider(),
          NavigationCellWidget(text: 'Report an issue'),
        ],
      ),
    );
  }
}