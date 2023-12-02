import 'package:flutter/material.dart';
import 'package:navigation_drawer/views/base_view.dart';
import 'package:navigation_drawer/widgets/app_bar_widget.dart';
import 'package:navigation_drawer/widgets/drawer_widet.dart';
import 'package:navigation_drawer/widgets/main_widget.dart';

class MainPage extends BaseView {
  
  const MainPage ( { 
    super.key
  } );

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBarWidget(MediaQuery.of(context).size.height),
      drawer: const DrawerWidget(),
      body: const MainWidget(title: "Hello"),
    );
  }
}