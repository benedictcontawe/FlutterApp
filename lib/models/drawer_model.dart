import 'package:get/get.dart';

class DrawerModel {

  DrawerModel( { 
    this.text,
    this.isDrawerHeader = false,
    this.isHeader,
    this.isExpand,
  } );
  
  final String? text;
  final bool? isDrawerHeader, isHeader;
  final RxBool? isExpand;

  @override
  String toString() {
    return "DrawerModel text $text isDrawerHeader $isDrawerHeader isHeader $isHeader isExpand ${isExpand?.value}" ?? super.toString();
  }
}