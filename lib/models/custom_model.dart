import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getx_storage/util/constants.dart';

class CustomModel {

  CustomModel ( {
    this.id,
    this.name,
    this.icon,
    this.file,
  } );

  final String? id;
  String? name;
  String? icon;
  String? file;

  factory CustomModel.fromJson(Map<String, dynamic> json) {
    return CustomModel (
      id : json[Constants.ID],
      name : json[Constants.NAME].toString(),
      icon : json[Constants.ICON].toString(),
      file : json[Constants.IMAGE_NAME].toString(),
    );
  }

  factory CustomModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String,dynamic>;
    return CustomModel (
      id : snapshot.id.toString(),
      name : data [Constants.NAME],
      icon : data [Constants.IMAGE_URL],
      file : data [Constants.IMAGE_NAME]
    );
  }

  Map<String, dynamic> toMap() => {
    Constants.NAME: name,
    Constants.IMAGE_URL: icon,
    Constants.IMAGE_NAME: file
  };

  Map<String, dynamic> toJson() {
    /*
    final data = <String, dynamic>{};
    data[Constants.ID] = id;
    data[Constants.NAME] = name;
    data[Constants.ICON] = icon;
    data[Constants.ICON] = file;
    return data;
    */
    return {
      Constants.ID : id,
      Constants.NAME : name,
      Constants.ICON : icon,
      Constants.IMAGE_NAME : file,
    };
  }

  bool _isSameName(CustomModel newModel) {
    return id == newModel.id && name == newModel.name;
  }

  bool isNotSameName(CustomModel newModel) {
    return id == newModel.id && name != newModel.name;
  }

  bool _isSameIcon(CustomModel newModel) {
    return id == newModel.id && icon == newModel.icon;
  }

  bool isNotSameIcon(CustomModel newModel) {
    return id == newModel.id && icon != newModel.icon;
  }

   bool _isSameFile(CustomModel newModel) {
    return id == newModel.id && file == newModel.file;
  }

  bool isNotSameFile(CustomModel newModel) {
    return id == newModel.id && file != newModel.file;
  }

  bool isSameContent(CustomModel newModel) {
    return _isSameName(newModel) && _isSameIcon(newModel) && _isSameFile(newModel);
  }

  bool isNotSameContent(CustomModel newModel) {
    return !isSameContent(newModel);
  }

  @override
  String toString() {
    return "CustomModel id $id name $name icon $icon file $file" ?? super.toString();
  }
}