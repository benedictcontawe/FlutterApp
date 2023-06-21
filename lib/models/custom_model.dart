import 'package:dart_sqflite/util/constants.dart';

class CustomModel {

  CustomModel ( {
    this.id,
    this.name,
    //this.icon,
  } );

  final int? id;
  final String? name;
  //final Icon? icon;

  factory CustomModel.toHolder(/*HiveModel model*/) => CustomModel (
    //id : model.id,
    //name : model.name,
    //icon : model.icon,
  );

  factory CustomModel.fromJson(Map<String, dynamic> json) {
    return CustomModel (
      id: json[Constants.COLUMN_ID], 
      name: json[Constants.COLUMN_NAME],
      //icon: json['icon'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      Constants.COLUMN_ID: id,
      Constants.COLUMN_NAME: name,
       //"icon" : icon
    };
  }

  @override
  String toString() {
    return "CustomModel id $id, name $name" ?? super.toString();
  }
}