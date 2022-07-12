import 'package:get_x/bindings/base_binding.dart';
import 'package:get/get.dart';
import 'package:get_x/controllers/functionselectioncontroller.dart';

class FunctionSelectionBinding extends BaseBinding {

  @override
  void dependencies() {
    logDebug("FunctionSelectionBinding dependencies");
    super.dependencies();
    Get.lazyPut<FunctionSelectionController> ( () => FunctionSelectionController());
  }
}