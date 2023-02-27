import 'package:dart_media_query/views/base_view.dart';
import 'package:dart_media_query/widgets/app_bar_title_widget.dart';
import 'package:dart_media_query/widgets/desktop_body_widget.dart';
import 'package:flutter/material.dart';

class DesktopPage extends BaseView {

  const DesktopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold ( 
      appBar: AppBar (
        elevation: 0,
        title: const AppBarTitleWidget(),
      ),
      body: const DesktopBodyWidget(),
    );
  }
}