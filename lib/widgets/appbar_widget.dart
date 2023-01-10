import 'package:flutter/cupertino.dart';
import 'package:tab_bar/controllers/main_controller.dart';
import 'package:tab_bar/widgets/base_widgets.dart';
import 'package:flutter/material.dart';

class AppbarWidget extends BaseWidget<MainController> implements PreferredSizeWidget {

  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
            title: const Text("AppBar with Tabs",textAlign: TextAlign.center,),
            bottom: TabBar (
              controller: controller.getTabController(),
              isScrollable: true,
              tabs: const <Widget> [
                Text("First Tab"),
                Tab(
                  icon: Icon(CupertinoIcons.shield),
                  text: ("Second Tab"),
                ),
                Tab(
                  icon: Icon(CupertinoIcons.train_style_one),
                  text: ("Third Tab"),
                ),
                Tab(
                  text: ("Fourth Tab"),
                ),
                Tab(
                  text: ("Fifth Tab"),
                ),
                Tab(
                  icon: Icon(CupertinoIcons.hourglass),
                  //text: ("Sixth Tab"),
                ),
              ]
            ),
          ),
    );
  }

  @override
  Size get preferredSize {
    return const Size.fromHeight(120);
  }
}