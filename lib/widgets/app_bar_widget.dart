import 'package:dart_media_query/controllers/main_controller.dart';
import 'package:dart_media_query/widgets/base_widgets.dart';
import 'package:dart_media_query/widgets/navigation_cell_image_widget.dart';
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
          backgroundColor: Colors.grey,
          elevation: 0,
          title: NavigationCellImageWidget (
            image: 'assets/flutter.png',
            fit: BoxFit.cover,
            height: height,
            width: height,
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