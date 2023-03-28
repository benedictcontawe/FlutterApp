import 'package:dart_http/widgets/base_widgets.dart';
import 'package:dart_http/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends BaseWidget with PreferredSizeWidget {

  const AppBarWidget( {
    super.key,
    required this.height,
    required this.title,
  } );

  final double height;
  final String title;

  @override
  Widget build(BuildContext context) {
    return PreferredSize (
      preferredSize: preferredSize,
      child: AppBar (
        elevation: 0,
        title: TitleWidget(title: title,),
      ),
    );
  }
  
  @override
  Size get preferredSize {
    return Size.fromHeight(height);
  }
}