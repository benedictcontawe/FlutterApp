import 'package:dart_media_query/controllers/main_controller.dart';
import 'package:dart_media_query/views/base_view.dart';
import 'package:dart_media_query/widgets/desktop_body_widget.dart';
import 'package:dart_media_query/widgets/drawer_wiget.dart';
import 'package:dart_media_query/widgets/main_widget.dart';
import 'package:dart_media_query/widgets/mobile_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends BaseView<MainController> {

  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("MainPage build");
    debugPrint("MainPage initialized ${controller.initialized}");
    debugPrint("MainPage isClosed ${controller.isClosed}");
    /*
    return Obx( (() {
      return Scaffold (
        appBar: AppBar (
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
        body: const MainWidget(),
        drawer: const DrawerWidget(),
      );
    }));
    */
    /*
    return Obx(() {
      return NotificationListener<SizeChangedLayoutNotification> (
        onNotification: (SizeChangedLayoutNotification notification) {
          return controller.setWidth(notification);
        },
        child: SizeChangedLayoutNotifier(
          child: Scaffold (
          appBar: AppBar (
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
          body: const MainWidget(),
          drawer: const DrawerWidget(),
        ),
        ),
      );
    });
    */
    /*
    return NotificationListener<SizeChangedLayoutNotification>(
      onNotification: (SizeChangedLayoutNotification notification) {
        return controller.setWidth(notification);
      },
      child: SizeChangedLayoutNotifier (
        child: Obx(() {
          if (controller.isDesktop()) {
            return const DesktopBodyWidget();
          } else if (controller.isMobile()) {
            return const MobileBodyWidget();
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },)
      ),
    );
    */
    return NotificationListener<SizeChangedLayoutNotification>(
      onNotification: (SizeChangedLayoutNotification notification) {
        return controller.setWidth(notification);
      },
      child: SizeChangedLayoutNotifier (
        child: controller.isDesktop() ? DesktopBodyWidget() : MobileBodyWidget()
      ),
    );
  }
}