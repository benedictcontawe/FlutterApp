import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_storage/controllers/base_controller.dart';
import 'package:getx_storage/firebase/firestore_service.dart';
import 'package:getx_storage/models/primitive_model.dart';
import 'package:getx_storage/util/constants.dart';
import 'package:getx_storage/util/get_storage_manager_.dart';
import 'package:getx_storage/views/custom_dialog.dart';

class PrimitiveController extends BaseController {

  PrimitiveController(GetStorageManager this._getStorageManager, FirestoreService this._service,) {
    debugPrint("PrimitiveController constructor");
  }
  
  final GetStorageManager _getStorageManager;
  final FirestoreService _service;
  final TextEditingController _stringController = TextEditingController();
  final TextEditingController _integerController = TextEditingController();
  final TextEditingController _doubleController = TextEditingController();
  final _primitives = <PrimitiveModel>[];
  final RxBool _liveChecked = false.obs;
  final RxString _liveBoolean = "Nil".obs;
  final RxString _liveString = "Nil".obs;
  final RxInt _liveInteger = 0.obs;
  final RxDouble _liveDouble = 0.00.obs;
  
  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("PrimitiveController onInit");
    _liveBoolean( ( _getStorageManager.getBoolean(Constants.BOOLEAN) ?? false ).toString() );
    _liveString( _getStorageManager.getString(Constants.STRING) ?? 'Nil' );
    _liveInteger( _getStorageManager.getInteger(Constants.INTEGER) ?? 0 );
    _liveDouble( _getStorageManager.getDouble(Constants.DOUBLE) ?? 0.00 );
  }

  @override
  void onReady() {
    super.onReady();
    debugPrint("PrimitiveController onReady");
    fetchData();
  }

  Future<void> fetchData() async {
    debugPrint("PrimitiveController fetchData");
    try {
      _primitives.clear();
      CustomDialog.loadingDialog();
      final snapshot = await _service.getPrimitive();
      for (final newModel in snapshot) {
        _primitives.add( newModel );
        switch(newModel.type) { 
          case Constants.BOOLEAN: {
            debugPrint("PrimitiveController snapshot BOOLEAN ${newModel.id} ${newModel.data}");
            if (newModel?.data != _liveBoolean.value) {
              _postBoolean(newModel);
            }
          }
          break; 
          case Constants.STRING: { 
            debugPrint("PrimitiveController snapshot STRING ${newModel.id} ${newModel.data}");
            if (newModel?.data != _liveString.value) {
              _postString(newModel);
            }
          } 
          break; 
          case Constants.INTEGER: { 
            debugPrint("PrimitiveController snapshot INTEGER ${newModel.id} ${newModel.data}");
            if (newModel?.data != _liveInteger.value) {
              _postInteger(newModel);
            }
          } 
          break;
          case Constants.DOUBLE: { 
            debugPrint("PrimitiveController snapshot DOUBLE ${newModel.id} ${newModel.data}");
             if (newModel?.data != _liveDouble.value) {
              _postDouble(newModel);
            }
          } 
          break; 
          default: { 
            debugPrint("PrimitiveController Unknown ID ${newModel.id} Data ${newModel.data}");
            onShowAlert('Error', "Unknown ID ${newModel.id} Data ${newModel.data}");
          }
          break; 
        } 
      }
    } catch (exception) {
      debugPrint("Error Can't Fetch Data from Firebase FireStore Database $exception");
      onShowAlert("Error", "Can't Fetch Data from Firebase FireStore Database $exception");
    } finally {
      debugPrint("PrimitiveController 0 isDialogOpen ${Get.isDialogOpen}");
      if (Get.isDialogOpen == true) {
        Get.back();
      }
    }
  }
  
  void setBoolean(bool? value) {
    _liveChecked(value ?? false);
  }

  bool isChecked() {
    return _liveChecked.value;
  }

  TextEditingController getStringController() {
    return _stringController;
  }

  TextEditingController getIntegerController() {
    return _integerController;
  }

  TextEditingController getDoubleController() {
    return _doubleController;
  }

  void postBoolean() {
    debugPrint("PrimitiveController postBoolean()");
    try {
      final model = _primitives.where( (oldModel) => oldModel.type == Constants.BOOLEAN).firstOrNull;
      _service.updatePrimitive (
        PrimitiveModel (
          id : model?.id,
          data : _liveChecked.value,
          type : model?.type,
        )
      );
      _saveBoolean(_liveChecked.value);
    } catch (exception) {
      onShowAlert("Error", "Invalid post for Boolean $exception");
    }
  }

  void _postBoolean(PrimitiveModel? model) {
    debugPrint("PrimitiveController _postBoolean($model)");
    try {
      _service.updatePrimitive(model);
      _saveBoolean(model?.data);
    } catch (exception) {
      onShowAlert("Error", "Invalid post for Boolean $exception");
    }
  }

  void _saveBoolean(bool? value) {
    debugPrint("PrimitiveController _saveBoolean($value)");
    try {
      _getStorageManager.setBoolean(Constants.BOOLEAN, value!);
    } catch (exception) {
      onShowAlert("Error", "Invalid save for Boolean $exception");
    } finally {
      _liveBoolean(_getStorageManager.getBoolean(Constants.BOOLEAN).toString());
    }
  }

  String getBoolean() {
    return _liveBoolean.value;
  }

  void postString() {
    debugPrint("PrimitiveController postString()");
    try {
      final model = _primitives.where( (oldModel) => oldModel.type == Constants.STRING).firstOrNull;
      _service.updatePrimitive (
        PrimitiveModel (
          id : model?.id,
          data : _stringController.text,
          type : model?.type,
        )
      );
      _saveString(_stringController.text);
    } catch (exception) {
      onShowAlert("Error", "Invalid post for String $exception");
    }
  }

  void _postString(PrimitiveModel? model) {
    debugPrint("PrimitiveController _postString($model)");
    try {
      _service.updatePrimitive(model);
      _saveString(model?.data);
    } catch (exception) {
      onShowAlert("Error", "Invalid post for String $exception");
    }
  }

  void _saveString(String value) {
    debugPrint("PrimitiveController _saveString($value)");
     try {
      _getStorageManager.setString(Constants.STRING, value);
    } catch (exception) {
      onShowAlert("Error", "Invalid save for String $exception");
    } finally {
      _liveString(_getStorageManager.getString(Constants.STRING));
    }
  }

  String getString() {
    return _liveString.value;
  }

  void postInteger() {
    debugPrint("PrimitiveController postInteger()");
    try {
      final model = _primitives.where( (oldModel) => oldModel.type == Constants.INTEGER).firstOrNull;
      _service.updatePrimitive (
        PrimitiveModel (
          id : model?.id,
          data : int.parse(_integerController.text),
          type : model?.type,
        )
      );
      _saveInteger(int.parse(_integerController.text));
    } catch (exception) {
      debugPrint("Error Invalid post for Integer $exception");
      onShowAlert("Error", "Invalid post for Integer $exception");
    }
  }

  void _postInteger(PrimitiveModel? model) {
    debugPrint("PrimitiveController _postInteger($model)");
    try {
      _service.updatePrimitive(model);
      if (model?.data is int) {
        _saveInteger(model?.data);
      } else {
        _saveInteger(int.parse(model?.data));
      }
    } catch (exception) {
      debugPrint("Error Invalid post for Integer $exception");
      onShowAlert("Error", "Invalid post for Integer $exception");
    }
  }

  void _saveInteger(int value) {
    debugPrint("PrimitiveController _saveInteger(${value.toString()})");
    try {
      _getStorageManager.setInteger(Constants.INTEGER, value);
    } catch (exception) {
      debugPrint("Invalid save for Integer $exception");
      onShowAlert("Error", "Invalid save for Integer $exception");
    } finally {
      _liveInteger(_getStorageManager.getInteger(Constants.INTEGER));
    }
  }

  int getInteger() {
    return _liveInteger.value;
  }

  void postDouble() {
    debugPrint("PrimitiveController postDouble()");
    try {
      final model = _primitives.where( (oldModel) => oldModel.type == Constants.DOUBLE).firstOrNull;
      _service.updatePrimitive (
        PrimitiveModel (
          id : model?.id,
          data : _doubleController.text,
          type : model?.type,
        )
      );
      _saveDouble(double.parse(_doubleController.text));
    } catch (exception) {
      onShowAlert("Error", "Invalid post for Integer $exception");
    }
  }

  void _postDouble(PrimitiveModel? model) {
    debugPrint("PrimitiveController _postDouble($model)");
    try {
      _service.updatePrimitive(model);
      _saveDouble(double.parse(model?.data));
    } catch (exception) {
      onShowAlert("Error", "Invalid post for Double $exception");
    }
  }

  void _saveDouble(double value) {
    debugPrint("PrimitiveController _saveDouble(${value.toString()})");
    try {
      _getStorageManager.setDouble(Constants.DOUBLE, value);
    } catch (exception) {
      onShowAlert("Error", "Invalid save for Double $exception");
    } finally {
      _liveDouble(_getStorageManager.getDouble(Constants.DOUBLE));
    }
  }

  double getDouble() {
    return _liveDouble.value;
  }
  
  @override
  void onClose() {
    super.onClose();
    debugPrint("PrimitiveController onClose");
  }
}