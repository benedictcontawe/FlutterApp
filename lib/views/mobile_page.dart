import 'package:dart_media_query/controllers/main_controller.dart';
import 'package:dart_media_query/views/base_view.dart';
import 'package:dart_media_query/widgets/app_bar_widget.dart';
import 'package:dart_media_query/widgets/drawer_wiget.dart';
import 'package:dart_media_query/widgets/mobile_body_widget.dart';
import 'package:flutter/material.dart';

class MobilePage extends BaseView<MainController> {

  const MobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBarWidget(height: controller.getAppBarHeight(),),
      body: const MobileBodyWidget(),
      drawer: null,
      endDrawer: const DrawerWidget(),
    );
  }
}