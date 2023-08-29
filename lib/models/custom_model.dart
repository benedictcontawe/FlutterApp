import 'package:cloud_firestore/cloud_firestore.dart';

class CustomModel {

  CustomModel ( {
    this.id,
    this.name,
    this.image_url,
  } );

  final String? id;
  String? name;
  final String? image_url;

  factory CustomModel.fromJson(Map<String, dynamic> json) {
    return CustomModel (
      id : json["id"],
      name : json["name"].toString(),
      image_url : json["icon"].toString(),
    );
  }

  factory CustomModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String,dynamic>;
    return CustomModel (
      id : snapshot.id.toString(),
      name : data ['name'],
      image_url : data ['image_url'],
    );
  }

  Map<String, dynamic> toMap() => {
    "name": name,
    "image_url": image_url
  };

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
      "image_url" : image_url,
    };
  }

  @override
  String toString() {
    return "CustomModel id $id name $name icon $image_url" ?? super.toString();
  }
}