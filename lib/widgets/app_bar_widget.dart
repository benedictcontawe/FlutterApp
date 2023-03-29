import 'package:dart_http/controllers/main_controller.dart';
import 'package:dart_http/widgets/title_bar_widget.dart';
import 'package:dart_http/widgets/base_widgets.dart';
import 'package:dart_http/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarWidget extends BaseWidget<MainController> with PreferredSizeWidget {
  
  const AppBarWidget( {
    super.key,
    required this.height,
    required this.title,
  } );

  final double height;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Obx( () {
        if (controller.observeSearchEnabled().value) {
          return SearchBarWidget (
            height: height, 
            title: title,
            onTapSearch: () {
              controller.toogleSearch();
            },
            observeVisibility: controller.observeSearchVisible(),
            editingController: controller.getSearchController(),
          );
        } else {
          return TitleBarWidget (
            height: height, 
            title: title,
          );
        }
      }, 
    );
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(height);
  }
}