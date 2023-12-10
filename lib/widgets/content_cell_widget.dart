import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navigation_drawer/widgets/aspect_ratio_widget%20.dart';
import 'package:navigation_drawer/widgets/base_widgets.dart';

class ContentCellWidget extends BaseWidget {

  const ContentCellWidget (
    this.text, this.isExpand, this.onTap, { super.key } 
  );

  final String? text;
  final RxBool isExpand;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Obx( () {
      if (isExpand.isTrue) {
        return AspectRatioWidget (
          aspectRatio: 1/0.13, 
          child: ListTile (
            leading: const Icon( Icons.star, color: Colors.red, ),
            title: Center( child: Text("ContentCellWidget $text"),),
            onTap: onTap,
          ),
        );
      } else {
        return const SizedBox();
      }
    } );
  }
}