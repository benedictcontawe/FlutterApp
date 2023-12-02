import 'package:flutter/material.dart';
import 'package:navigation_drawer/widgets/base_widgets.dart';

class AppBarWidget extends BaseWidget implements PreferredSizeWidget {

  const AppBarWidget(this.height,  { Key? key } ) : super(key: key);

  final double? height;

  @override
  Widget build(BuildContext context) {
    return AppBar (
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Text (
        "Flutter App",
        style: TextStyle (
          fontFamily: "avenir",
          fontSize: 32,
          fontWeight: FontWeight.w900
        ),
      ),
    );
  }
  
   @override
  Size get preferredSize {
    return height!= null ? Size.fromHeight(height! * 0.10) : const Size.fromHeight(125);
  }
}