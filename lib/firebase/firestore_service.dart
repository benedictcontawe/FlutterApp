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