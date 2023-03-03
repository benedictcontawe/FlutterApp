import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_view/controllers/main_controller.dart';
import 'package:page_view/widgets/base_widget.dart';

class CircleIndicatorWidget extends BaseWidget<MainController> {
  
  const CircleIndicatorWidget( { super.key } );

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Positioned (
        left: 0,
        right: 0,
        bottom: 0,
        height: 40,
        child: Container (
          color: Colors.black12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate (
              controller.getPageLenght(),
              (index) => Padding (
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: InkWell (
                  onTap: () {
                    controller.animateToPage(
                      index, 
                      300, 
                      Curves.easeIn,
                    );
                  },
                  child: CircleAvatar (
                    radius: 5,
                    backgroundColor: controller.getCurrentPage() == index ? Colors.greenAccent : Colors.white30,
                  ),
                ),
              )
            ),
          ),
        ),
      );
    } );
  }
}