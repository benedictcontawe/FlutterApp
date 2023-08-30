import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getx_storage/util/constants.dart';

class CustomModel {

  CustomModel ( {
    this.id,
    this.name,
    this.icon,
  } );

  final String? id;
  String? name;
  String? icon;

  factory CustomModel.fromJson(Map<String, dynamic> json) {
    return CustomModel (
      id : json[Constants.ID],
      name : json[Constants.NAME].toString(),
      icon : json[Constants.ICON].toString(),
    );
  }

  factory CustomModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String,dynamic>;
    return CustomModel (
      id : snapshot.id.toString(),
      name : data [Constants.NAME],
      icon : data [Constants.IMAGE],
    );
  }

  Map<String, dynamic> toMap() => {
    Constants.NAME: name,
    Constants.IMAGE: icon
  };

  Map<String, dynamic> toJson() {
    /*
    final data = <String, dynamic>{};
    data[Constants.ID] = id;
    data[Constants.NAME] = name;
    data[Constants.ICON] = icon;
    return data;
    */
    return {
      Constants.ID : id,
      Constants.NAME : name,
      Constants.ICON : icon,
    };
  }

  bool isSameName(CustomModel newModel) {
    if (id != newModel.id) throw Exception("Custom Model id are not the same");
    return id == newModel.id && name == newModel.name;
  }

  bool isSameIcon(CustomModel newModel) {
    if (id != newModel.id) throw Exception("Custom Model id are not the same");
    return id == newModel.id && icon == newModel.icon;
  }

  bool isSameContent(CustomModel newModel) {
    if (id != newModel.id) throw Exception("Custom Model id are not the same");
    return isSameName(newModel) || isSameIcon(newModel);
  }

  bool isNotSameContent(CustomModel newModel) {
    if (id != newModel.id) throw Exception("Custom Model id are not the same");
    return !isSameContent(newModel);
  }

  @override
  String toString() {
    return "CustomModel id $id name $name icon $icon" ?? super.toString();
  }
}