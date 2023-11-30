import 'package:flutter/material.dart';
import 'package:list_view/controllers/splash_controller.dart';
import 'package:list_view/widgets/base_widget.dart';

class CellDefaultWidget extends BaseWidget<SplashController> {
  
  const CellDefaultWidget ( { 
    super.key,
    required this.name,
    required this.icon,
    required this.onTap
  } );

  final String name;
  final IconData icon;
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
              leading: Icon(this.icon),
              dense: true,
              title: Text("${this.name}", maxLines: 1, overflow: TextOverflow.ellipsis,),      
            )
          ],
        ),
      )
    );
  }
}