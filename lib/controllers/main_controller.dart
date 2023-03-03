import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_view/controllers/base_controller.dart';

class MainController extends BaseController {

  MainController() {
    debugPrint("MainController Constructor");
  }

  PageController _pageController = new PageController(initialPage: 0, keepPage: true, viewportFraction: 1);
  final List<Widget> _pages = [
    Container(
      child: Center(child:Text("Page 1")),
      color: Colors.redAccent,
    ),
    Container(
      child: Center(child:Text("Page 2")),
      color: Colors.blueAccent,
    ),
    Container(
      child: Center(child:Text("Page 3")),
      color: Colors.amberAccent,
    ),
    Container(
      child: Center(child:Text("Page 4")),
      color: Colors.greenAccent,
    ),
    Container(
      child: Center(child:Text("Page 5")),
      color: Colors.purpleAccent,
    )
  ];
  RxInt _currentPage = 0.obs;
  
  @override
  void onInit() {
    //controller.jumpToPage(2);
    super.onInit();
  }

  PageController getPageController() {
    return _pageController;
  }

  void setCurrentPage(int current) {
    _currentPage(current);
  }

  // check if a dot is connected to the current page
  // if true, give it a different color
  int getCurrentPage() {
    return _currentPage.value;
  }

  Widget getPage(int index) {
    return _pages[index];
  }

  List<Widget> getPages() {
    return _pages;
  }

  int getPageLenght() {
    return _pages.length;
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

  void animateToPage(int page, int milliseconds, Curve curve) {
    _pageController.animateToPage (
      page, 
      duration: Duration(milliseconds: milliseconds), 
      curve: curve,
    );
  }

  void onNextPage(int milliseconds) {
    _pageController.nextPage (
      duration: Duration(milliseconds: milliseconds), 
      curve: Curves.easeInOut,
    );
  }

   void onPreviousPage(int milliseconds) {
    _pageController.previousPage (
      duration: Duration(milliseconds: milliseconds), 
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