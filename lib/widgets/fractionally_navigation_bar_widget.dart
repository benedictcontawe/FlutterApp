import 'package:dart_media_query/controllers/main_controller.dart';
import 'package:dart_media_query/widgets/base_widgets.dart';
import 'package:dart_media_query/widgets/navigation_cell_image_widget.dart';
import 'package:dart_media_query/widgets/navigation_cell_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FractionallyNavigationBarWidget extends BaseWidget<MainController> {
  
  const FractionallyNavigationBarWidget( {
    super.key,
    required this.widthFactor,
    required this.heightFactor,
  } );

  final double widthFactor;
  final double heightFactor;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox (
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: Container (
        color: Colors.black,
        child: Obx ( () {
          controller.isLoading();
          return Row (
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              NavigationCellImageWidget (
                image: 'assets/flutter.png',
                fit: BoxFit.cover,
                height: controller.getAppBarHeight(),
                width: controller.getAppBarHeight(),
              ),
              const Divider(),
              NavigationCellTextWidget(text: 'Home'),
              NavigationCellTextWidget(text: 'About'),
              NavigationCellTextWidget(text: 'Contacts',),
              NavigationCellTextWidget(text: 'Events',),
              NavigationCellTextWidget(text: 'Notes',),
              const Divider(),
              NavigationCellTextWidget(text: 'Steps'),
              NavigationCellTextWidget(text: 'Authors'),
              NavigationCellTextWidget(text: 'Flutter Documentation'),
              NavigationCellTextWidget(text: 'Useful Links'),
              const Divider(),
              NavigationCellTextWidget(text: 'Report an issue'),
            ],
          );
        } ),
      ),
    );
  }
}