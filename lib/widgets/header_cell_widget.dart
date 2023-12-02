import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navigation_drawer/widgets/base_widgets.dart';

import 'aspect_ratio_widget .dart';

class HeaderCellWidget extends BaseWidget {

  const HeaderCellWidget(this.text, this.isExpand, this.onTap, { super.key } );

  final String? text;
  final RxBool isExpand;
  final GestureLongPressCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AspectRatioWidget (
      aspectRatio: 1/0.13, 
      child: ListTile (
        leading: Obx ( () {
          if (isExpand.isTrue) {
            return const Icon ( 
              Icons.arrow_drop_up, 
              color: Colors.red, 
            );
          } else {
            return const Icon ( 
              Icons.arrow_drop_down, 
              color: Colors.red, 
            );
          }
        } ),
        title: Center( child: Text("HeaderCellWidget $text"),),
        onTap: onTap,
      ),
    );
  }
}