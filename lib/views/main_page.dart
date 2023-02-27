import 'package:dart_media_query/controllers/main_controller.dart';
import 'package:dart_media_query/views/base_view.dart';
import 'package:dart_media_query/views/desktop_page.dart';
import 'package:dart_media_query/views/mobile_page.dart';
import 'package:flutter/material.dart';

class MainPage extends BaseView<MainController> {

  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("MainPage build");
    debugPrint("MainPage initialized ${controller.initialized}");
    debugPrint("MainPage isClosed ${controller.isClosed}");
    controller.setWidth(MediaQuery.of(context).size.width);
    if (controller.isDesktop()) {
      return const DesktopPage();
    } else if (controller.isMobile()) {
      return const MobilePage();
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}