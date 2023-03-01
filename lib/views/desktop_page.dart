import 'package:dart_media_query/controllers/main_controller.dart';
import 'package:dart_media_query/views/base_view.dart';
import 'package:dart_media_query/widgets/app_bar_widget.dart';
import 'package:dart_media_query/widgets/desktop_body_widget.dart';
import 'package:flutter/material.dart';

class DesktopPage extends BaseView<MainController> {

  const DesktopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold ( 
      appBar: AppBarWidget(height: controller.getAppBarHeight(),),
      body: const DesktopBodyWidget(),
      drawer: null,
      endDrawer: null,
    );
  }
}