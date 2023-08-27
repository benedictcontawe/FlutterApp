import 'package:cloud_firestore/cloud_firestore.dart';

class CustomModel {

  CustomModel ( {
    this.id,
    this.name,
    this.icon,
  } );

  final int? id;
  String? name;
  final String? icon;

  factory CustomModel.fromJson(Map<String, dynamic> json) {
    return CustomModel (
      id : json["id"],
      name : json["name"].toString(),
      icon : json["icon"].toString(),
    );
  }

  factory CustomModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String,dynamic>;
    return CustomModel (
      //id : snapshot.id.toString(),
      name : data ['name'],
      icon : data ['image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    /*
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['icon'] = icon;
    return data;
    */
    return {
      "id" : id,
      "name" : name,
      "icon" : icon,
    };
  }

  @override
  String toString() {
    return "CustomModel id $id name $name icon $icon" ?? super.toString();
  }
}