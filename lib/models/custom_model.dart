import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'custom_model.g.dart';

@HiveType(typeId: 0, adapterName: "CustomModelAdapter")
class CustomModel extends HiveObject {

  CustomModel ( {
    //this.id,
    this.name,
    //this.icon,
  } );

  //@HiveField(0)
  //final int? id;

  @HiveField(0)
  final String? name;

  //@HiveField(1)
  //final Icon? icon;

  factory CustomModel.toHolder(/*HiveModel model*/) => CustomModel (
    //id : model.id,
    //name : model.name,
    //icon : model.icon,
  );

  @override
  String toString() {
    return "CustomModel name $name" ?? super.toString();
  }
}