import 'package:dart_http/widgets/base_widgets.dart';
import 'package:dart_http/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBarWidget extends BaseWidget with PreferredSizeWidget {
  
  const SearchBarWidget( {
    super.key,
    required this.height,
    required this.title,
    this.onTapSearch,
    required this.observeVisibility,
    this.editingController,
  } );

  final double height;
  final String title;
  final GestureTapCallback? onTapSearch;
  final Rx<bool> observeVisibility;
  final TextEditingController? editingController;

  @override
  Widget build(BuildContext context) {
    return Obx( () {
      return AppBar (
        centerTitle: true,
        elevation: 0,
        leading: IconButton (
          onPressed: onTapSearch,
          icon: observeVisibility.value ? new Icon(Icons.close) : new Icon(Icons.search),
        ),
        title: observeVisibility.value ? TextField (
          controller: editingController,
          cursorColor: Colors.white,
          decoration: new InputDecoration (
            prefixIcon: new Icon(Icons.search),
            hintText: 'Search...'
          ),
        ) : TitleWidget(title: title,),
      );
    } );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}