import 'package:flutter/widgets.dart';

class CustomModel {

  static const int defaultViewType = 0;
  static const int iconViewType = 1;
  static const int nameViewType = 2;

  CustomModel ( {
    this.id,
    this.name,
    this.icon,
    this.viewType,
  } );

  final int? id;
  final String? name;
  final IconData? icon;
  final int? viewType;

  factory CustomModel.fromJson(Map<String, dynamic> json) {
    return CustomModel (
      id : json["id"],
      name : json["name"].toString(),
      icon : json["icon"],
      viewType : json["viewType"],
    );
  }

  Map<String, dynamic> toJson() {
    /*
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['icon'] = icon;
    data['viewType'] = viewType;
    return data;
    */
    return {
      "id" : id,
      "name" : name,
      "icon" : icon,
      "viewType" : viewType,
    };
  }

  @override
  String toString() {
    return "CustomModel id $id name $name icon $icon viewType $viewType" ?? super.toString();
  }
}