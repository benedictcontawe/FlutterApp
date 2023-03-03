import 'package:flutter/material.dart';
import 'package:page_view/controllers/main_controller.dart';
import 'package:page_view/widgets/base_widget.dart';

class PageViewWidget extends BaseWidget<MainController> {
  
  PageViewWidget( { super.key } );

  @override
  Widget build(BuildContext context) {      
    return PageView.builder (
      controller: controller.getPageController(),
      itemBuilder: (BuildContext context, int index) { 
        return controller.getPage(index);
      },
      itemCount: controller.getPageLenght(),
      onPageChanged: (value) {
        controller.setCurrentPage(value);
        //return print("PageViewWidget onPageChanged: " + value.toString());
      },
      pageSnapping: controller.isPageSnapping(),
      physics: controller.getScrollPhysics(),
      reverse: controller.isReverese(),
      scrollDirection: controller.getPageAxis(),
    );
  }
}