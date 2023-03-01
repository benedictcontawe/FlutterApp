import 'package:dart_media_query/widgets/navigation_cell_widget.dart';
import 'package:flutter/material.dart';

class NavigationCellTextWidget extends NavigationCellWidget {
  
  NavigationCellTextWidget( {
    super.key,
    required String text
  } ) : super (
  
    child: Text (
      text
    ),
  );
}