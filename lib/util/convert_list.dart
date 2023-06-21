import 'package:dart_sqflite/models/custom_model.dart';
import 'package:flutter/foundation.dart';

class ConvertList {

  static List<CustomModel> toModelList(List<Map<String, Object?>>? data) {
    debugPrint("ConvertList toModelList $data");
    final List<CustomModel> value = new List<CustomModel>.empty(growable: true);
    data?.forEach( (element) { 
      debugPrint("ConvertList forEach $element");
      value.add(CustomModel.fromJson(element));
     } );
     debugPrint("ConvertList value $value");
    return value;
  }
  
}