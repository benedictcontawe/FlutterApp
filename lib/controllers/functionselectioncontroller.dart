import 'package:get_x/controllers/BaseController.dart';
import 'package:get_x/routes/app_pages.dart';
import 'package:get/get.dart';

class FunctionSelectionController extends BaseController {

  @override
  void onInit() {
    super.onInit();
    logDebug( "FunctionSelectionController onInit");
  }

  @override
  void onReady() {
    super.onReady();
    logDebug("FunctionSelectionController onReady");
  }

  void launchLoading() {
    logDebug("FunctionSelectionController launcLoading");
    Get.toNamed(Routes.LOADING);
  }

  void launchBalanceCheck() {
    logDebug("FunctionSelectionController launchBalanceCheck");
    Get.toNamed(Routes.BALANCECHECK);
  }

  void launchRetailSale() {
    logDebug("FunctionSelectionController launchRetailSale");
    Get.toNamed(Routes.RETAILSALE);
  }
  @override
  void onClose() {
    logDebug("FunctionSelectionController onClose");
    super.onClose();
  }
}