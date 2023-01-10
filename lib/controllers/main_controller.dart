import 'package:tab_bar/controllers/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends BaseController with GetSingleTickerProviderStateMixin {
  
  MainController() { debugPrint("MainController Constructor");
    
  }

  late TabController _tabController;

  @override
  void onInit() { debugPrint("MainController onInit");
    super.onInit();
    _tabController = TabController(length: 6, vsync: this);
    _tabController.addListener(() {
      debugPrint("TabController index ${_tabController.index}");
      
    });
  }

  TabController getTabController() {
    return _tabController;
  }

  @override
  void onClose() {
    _tabController.dispose();
    super.onClose();
  }
}