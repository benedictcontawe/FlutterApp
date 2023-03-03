import 'package:flutter/material.dart';
import 'package:page_view/controllers/base_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class MainController extends BaseController {

  MainController() {
    debugPrint("MainController Constructor");
  }

  PageController _pageController = new PageController(initialPage: 0);
  
  @override
  void onInit() {
    //controller.jumpToPage(2);
    super.onInit();
  }

  PageController getPageController() {
    return _pageController;
  }

  Axis getPageAxis() {
    return Axis.horizontal; //Axis.vertical,
  }

  ScrollPosition getPageScrollPosition() {
    return _pageController.position;
  }

  ScrollPhysics? getScrollPhysics() {
    return const ClampingScrollPhysics();
    //return const NeverScrollableScrollPhysics;
    //return const BouncingScrollPhysics();
  }

  bool isPageSnapping() {
    return true;
  }

  bool isReverese() {
    return false;
  }

  void jumpToPage(int page) {
    _pageController.jumpToPage(page);
  }

  void animateToPage(int page, int seconds) {
    _pageController.animateToPage (
      page, 
      duration: Duration(seconds: seconds), 
      curve: Curves.easeInOut,
    );
  }

  void onNextPage(int seconds) {
    _pageController.nextPage(
      duration: Duration(seconds: seconds), 
      curve: Curves.easeInOut,
    );
  }

   void onPreviousPage(int seconds) {
    _pageController.previousPage(
      duration: Duration(seconds: seconds), 
      curve: Curves.easeInOut,
    );
  }

  @override
  void onClose() {
    debugPrint("MainController onClose");
    _pageController.dispose();
    super.onClose();
  }
}