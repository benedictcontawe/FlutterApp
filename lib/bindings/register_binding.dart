import 'package:get/get.dart';
import 'package:getx_storage/bindings/base_binding.dart';
import 'package:getx_storage/controllers/register_controller.dart';

class RegisterBinding extends BaseBinding {
  
  @override
  void dependencies() {
    Get.lazyPut<RegisterController> ( 
      () => RegisterController(

      )
    );
  }

}