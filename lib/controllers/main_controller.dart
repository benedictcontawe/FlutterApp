import 'package:dart_http/controllers/base_controller.dart';
import 'package:dart_http/dio/api_method.dart';
import 'package:dart_http/dio/dio_service.dart';
import 'package:dart_http/models/nasa_holder_model.dart';
import 'package:dart_http/util/constants.dart';
import 'package:dart_http/util/convert_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends BaseController {

  MainController(DioService this.dioService) {
    debugPrint("MainController Constructor");
  }

  final RxBool _isLoading = true.obs;
  final RxList<NasaHolderModel> _list = <NasaHolderModel>[].obs;
  final DioService dioService;
  final ScrollController _scrollController = new ScrollController();

  @override
  void onInit() {
    dioService.initialize(null, null, null);
    dioService.initInterceptors();
    _scrollController.addListener(_scrollListener);
    fetchAPOD(10);
    super.onInit();
  }

  void _scrollListener() {
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent && !_scrollController.position.outOfRange) {
      debugPrint("MainController statusCode reach the bottom");
    } else if (_scrollController.offset <= _scrollController.position.minScrollExtent && !_scrollController.position.outOfRange) {
      debugPrint("MainController statusCode reach the top");
    }
  }

  void scrollUp(int itemSize, ) {
    _scrollController.animateTo(
      _scrollController.offset - itemSize,
      curve: Curves.linear, 
      duration: Duration(milliseconds: 500)
    );
  }

  void scrollDown(int itemSize, ) {
    //_controller.jumpTo(pixelsToMove);
    _scrollController.animateTo(
      _scrollController.offset + itemSize,
      curve: Curves.linear, 
      duration: Duration( milliseconds: 500 )
    );
  }

  ScrollController getScrollController() {
    return _scrollController;
  }

  Future<void> fetchAPOD(int count) async {
    try {
      _isLoading(true);
      var response = await dioService.request(url: Constants.API_GET, method: ApiMethod.GET, params: {
        'api_key': Constants.API_KEY,
        'count': getLength() + count ?? 5,
      });      
      debugPrint("MainController statusCode ${response.statusCode}");
      if (response.statusCode == 200) {
        _list.value = ConvertList.toHolderList( ConvertList.toResponseList( response.data ) );
      }
      debugPrint("MainController list ${_list.value}");
    } on RangeError {
      debugPrint("MainController RangeError");
    } catch (exception) {
      debugPrint("MainController exception $exception");
    } finally {
      _isLoading(false);
    }
  }

  bool isLoading() {
    return _isLoading.value;
  }

  int getLength() {
    return _list?.length ?? 0;
  }

  String getImage(int index) {
    return _list?.value[index].image ?? "Nil";
  }

  String getTitle(int index) {
    return _list?.value[index].title ?? "Nil";
  }

   String getExplanation(int index) {
    return _list?.value[index].explanation ?? "Nil";
  }

  String getDate(int index) {
    return _list?.value[index].date ?? "Nil";
  }

  String getCopyright(int index) {
    return _list?.value[index].copyright ?? "Nil";
  }

  @override
  void onClose() {
    debugPrint("MainController onClose");
    super.onClose();
  }
}