import 'package:dart_media_query/widgets/base_widgets.dart';
import 'package:dart_media_query/widgets/navigation_cell_text_widget.dart';
import 'package:flutter/material.dart';

class FractionallyNavigationBarWidget extends BaseWidget {
  
  const FractionallyNavigationBarWidget( {
    super.key,
    required this.widthFactor,
    required this.heightFactor,
  } );

  final double widthFactor;
  final double heightFactor;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox (
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: Container (
        color: Colors.grey,
        child: Row (
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            NavigationCellTextWidget(text: 'Home'),
            NavigationCellTextWidget(text: 'About'),
            NavigationCellTextWidget(text: 'Contacts',),
            NavigationCellTextWidget(text: 'Events',),
            NavigationCellTextWidget(text: 'Notes',),
            const Divider(),
            NavigationCellTextWidget(text: 'Steps'),
            NavigationCellTextWidget(text: 'Authors'),
            NavigationCellTextWidget(text: 'Flutter Documentation'),
            NavigationCellTextWidget(text: 'Useful Links'),
            const Divider(),
            NavigationCellTextWidget(text: 'Report an issue'),
          ],
        ),
      ),
    );
  }
}