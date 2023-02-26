import 'package:dart_media_query/controllers/main_controller.dart';
import 'package:dart_media_query/widgets/base_widgets.dart';
import 'package:flutter/material.dart';

class DrawerCellWidget extends BaseWidget<MainController> {

  const DrawerCellWidget({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
  });

  final IconData icon;
  final String text;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(text),
        )
      ],
    ),
    onTap: onTap,
  );
  }
}