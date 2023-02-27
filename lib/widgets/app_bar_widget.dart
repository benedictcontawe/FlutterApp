import 'package:dart_media_query/controllers/main_controller.dart';
import 'package:dart_media_query/widgets/base_widgets.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends BaseWidget<MainController> with PreferredSizeWidget {

  const AppBarWidget( {
    super.key,
    required this.height,
  } );

  final double height;

  @override
  Widget build(BuildContext context) {
    if (controller.isDesktop()) {
      return const SizedBox();
    } else if (controller.isMobile()) {
      return PreferredSize(
        preferredSize: preferredSize,
        child: AppBar (
          elevation: 0,
          title: const Text (
            "Flutter App",
            style: TextStyle(
              fontFamily: "avenir",
              fontSize: 32,
              fontWeight: FontWeight.w900
            ),
          ),
        ),
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
  
  @override
  Size get preferredSize {
    return Size.fromHeight(height);
  }
}