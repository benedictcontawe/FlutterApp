import 'package:get/get.dart';

class DrawerModel {

  DrawerModel( { 
    this.text,
    this.isHeader,
    this.isExpand,
  } );
  
  final String? text;
  final bool? isHeader;
  final RxBool? isExpand;

  @override
  String toString() {
    return "DrawerModel text $text isHeader $isHeader isExpand ${isExpand?.value}" ?? super.toString();
  }
}