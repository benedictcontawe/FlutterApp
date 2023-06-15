import 'package:flutter/material.dart';
import 'package:getx_storage/widgets/base_widgets.dart';

class AppBarWidget extends BaseWidget implements PreferredSizeWidget {
  
  const AppBarWidget( {
    super.key,
  } );

@override
  Widget build(BuildContext context) {
    return AppBar (
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
    return const Size.fromHeight(kToolbarHeight);
  }
}