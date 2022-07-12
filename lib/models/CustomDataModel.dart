import 'dart:convert';
import 'package:meta/meta.dart';

@immutable
class CustomDataModel {
  final int id;
  final String name;

  
  const CustomDataModel({
    required this.id,
    required this.name,
  });

  CustomDataModel copyWith({
    int? id,
    String? name,
  }) {
    return CustomDataModel(id: id ?? this.id, name: name ?? this.name);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name, 
    };
  }

  factory CustomDataModel.fromMap(Map<String, dynamic> map) {
    return CustomDataModel(
      id: map['id'], 
      name: map['name']
      );
  }

  //factory CustomDataModel.fromJson(String source) => CustomDataModel.fromMap(json.decode(source));
  factory CustomDataModel.fromJson(String source) {
    return CustomDataModel.fromMap(json.decode(source));
  }

  @override
  //String toString() => 'CustomDataModel(id: $id, name: $name)';
  String toString() {
    return 'CustomDataModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    if(identical(this, other)) return true;
    return other is CustomDataModel && other.id == this.id && other.name == this.name;
  }

  @override
  //int get hashCode => id.hashCode ^ name.hashCode;
  int get hashCode {
    return id.hashCode ^ name.hashCode;
  }
}