import 'package:flutter/cupertino.dart';
import 'package:tab_bar/controllers/main_controller.dart';
import 'package:tab_bar/widgets/base_widgets.dart';
import 'package:flutter/material.dart';
import 'package:tab_bar/widgets/main_widget.dart';

class TabBarViewWidget extends BaseWidget<MainController> {
  const TabBarViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView (
      controller: controller.getTabController(),
      children: <Widget> [
        MainWidget(),
        Icon(CupertinoIcons.add),
        Icon(CupertinoIcons.zzz),
        Icon(Icons.food_bank),
        Icon(Icons.fastfood),
        Icon(Icons.icecream),
      ],
    );
  }
}