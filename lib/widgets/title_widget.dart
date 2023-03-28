import 'package:dart_http/widgets/base_widgets.dart';
import 'package:flutter/material.dart';

class TitleWidget extends BaseWidget {
  
  const TitleWidget( {
    super.key,
    required this.title,
  } );

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text (
      title,
      style: TextStyle(
        fontFamily: "avenir",
        fontSize: 32,
        fontWeight: FontWeight.w900
      ),
    );
  }

}