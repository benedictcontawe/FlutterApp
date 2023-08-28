import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getx_storage/util/constants.dart';

class PrimitiveModel {

  PrimitiveModel ( {
    this.id,
    this.data,
    this.type,
  } );

  final String? id;
  final dynamic? data;
  final String? type;

  factory PrimitiveModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String,dynamic>;
      if (data [Constants.BOOLEAN] != null) {
        return PrimitiveModel (
          id : snapshot.id.toString(),
          data : data [Constants.BOOLEAN],
          type : Constants.BOOLEAN,
        );
      } else if (data [Constants.STRING] != null) {
        return PrimitiveModel (
          id : snapshot.id.toString(),
          data : data [Constants.STRING],
          type : Constants.STRING,
        );
      } else if (data [Constants.INTEGER] != null) {
        return PrimitiveModel (
          id : snapshot.id.toString(),
          data : data [Constants.INTEGER],
          type : Constants.INTEGER,
        );
      } else if (data [Constants.DOUBLE] != null) {
        return PrimitiveModel (
          id : snapshot.id.toString(),
          data : data [Constants.DOUBLE],
          type : Constants.DOUBLE,
        );
      } else {
        return PrimitiveModel (
          id : null,
          data : null,
        );
      }
  }

  Map<String, dynamic> toMap() {
    if (this.type == Constants.BOOLEAN) {
        return {
          Constants.BOOLEAN: data
        };
      } else if (this.type == Constants.STRING) {
        return {
          Constants.STRING: data
        };
      } else if (this.type == Constants.INTEGER) {
        return {
          Constants.INTEGER: data
        };
      } else if (this.type == Constants.DOUBLE) {
        return {
          Constants.DOUBLE: data
        };
      } else {
        throw Exception("PrimitiveModel cannot map");
      }  
  }

  @override
  String toString() {
    return "PrimitiveModel id $id data $data type $type" ?? super.toString();
  }
}