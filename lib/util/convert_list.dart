import 'package:dart_hive/models/custom_model.dart';

class ConvertList {
  static List<CustomModel> toModelList(List<Map<String, Object?>>? data) {
    List<CustomModel> value = new List<CustomModel>.empty(growable: true);
    data?.forEach((element) {
      value.add(CustomModel.fromJson(element));
     } );
    return value;
  }
}