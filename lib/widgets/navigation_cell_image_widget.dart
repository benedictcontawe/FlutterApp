import 'package:dart_media_query/widgets/navigation_cell_widget.dart';
import 'package:flutter/material.dart';

class NavigationCellImageWidget extends NavigationCellWidget {
  
  NavigationCellImageWidget( {
    super.key,
    required String image,
    required BoxFit? fit,
    required double? height,
    required double? width,
  }) : super (
  
    child: Image.asset (
      image,
      fit: fit,
      height: height,
      width: width,
    ),
  );
}