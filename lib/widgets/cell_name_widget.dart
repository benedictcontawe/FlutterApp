import 'package:flutter/material.dart';
import 'package:list_view/controllers/splash_controller.dart';
import 'package:list_view/widgets/base_widget.dart';

class CellNameWidget extends BaseWidget<SplashController> {
  
  const CellNameWidget( { 
    super.key,
    required this.name,
    required this.onTap
  } );

  final String name;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card (
      child: InkWell (
        splashColor: Colors.blue.withAlpha(30),
        onTap: onTap,
        child: Column (
          children: [
            ListTile (
              dense: true,
              title: Text("${this.name}", maxLines: 1, overflow: TextOverflow.ellipsis,),      
            )
          ],
        ),
      )
    );
  }
}