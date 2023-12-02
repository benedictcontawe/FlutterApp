import 'package:flutter/material.dart';
import 'package:navigation_drawer/widgets/base_widgets.dart';

class MainWidget extends BaseWidget {
  
  const MainWidget( { 
    super.key,
    required this.title,
  } );

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center (
      child: Text(title),
    );
  }
}