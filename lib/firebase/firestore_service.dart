import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:getx_storage/models/custom_model.dart';
import 'package:getx_storage/models/primitive_model.dart';

class FirestoreService extends GetxService {
  
  final dbFirestore = FirebaseFirestore.instance;

  Future<void> createObject(Map<String, dynamic> data) async {
    await dbFirestore.collection("object").add(data);
  }

  Future<void> createPrimitive(Map<String, dynamic> data) async {
    await dbFirestore.collection("primitive").add(data);
  }

  Future<List<CustomModel>> getObjects() async {
    final response = await dbFirestore.collection("object").get();
    return response.docs
        .map((doc) => CustomModel.fromSnapshot(doc))
        .toList();
  }

  Future<void> updateObject(CustomModel? model) async {
    if (model != null) {
      await dbFirestore.collection("object").doc(model.id).update(model.toMap());
    } else {
      throw Exception("CustomModel is Null");
    }
  }

  Future<void> deleteObject(CustomModel? model) async {
    // Delete object;
    if(model != null) {
      await dbFirestore.collection("object").doc(model.id).delete();
    } else {
      throw Exception("Error deleting model");
    }
  }

  Future<void> deleteAllObject(CustomModel? model) async {
    // Delete all object;
    if(model != null) {
      await dbFirestore.collection("object").doc(model.id).delete();
    } else {
      throw Exception("Error deleting all models");
    }
  }

  Future<List<PrimitiveModel>> getPrimitive() async {
    final response = await dbFirestore.collection("primitive").get();
    return response.docs.map( (doc) {
      return PrimitiveModel.fromSnapshot(doc);
    } ).toList();
  }

  Future<void> updatePrimitive(PrimitiveModel? model) async {
    if (model != null) {
      await dbFirestore.collection("primitive").doc(model.id).update(model.toMap());
    } else {
      throw Exception("PrimitiveModel is Null");
    }
  }
}