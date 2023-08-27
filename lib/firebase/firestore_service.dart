import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:getx_storage/models/custom_model.dart';

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

}