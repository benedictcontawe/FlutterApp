import 'package:dart_http/controllers/base_controller.dart';
import 'package:dart_http/http/http_service.dart';
import 'package:dart_http/models/nasa_holder_model.dart';
import 'package:dart_http/util/convert_list.dart';
import 'package:dart_http/util/environment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends BaseController {

  MainController() {
    debugPrint("MainController Constructor");
  }

  final RxBool _isLoading = true.obs;
  final RxList<NasaHolderModel> _list = new List<NasaHolderModel>.empty().obs;
  final ScrollController _scrollController = new ScrollController();

  @override
  void onInit() {
    _scrollController.addListener(_scrollListener);
    fetchAPOD(10);
    super.onInit();
  }

  void _scrollListener() {
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent && !_scrollController.position.outOfRange) {
      debugPrint("MainController ListView reach the bottom");
    } else if (_scrollController.offset <= _scrollController.position.minScrollExtent && !_scrollController.position.outOfRange) {
      debugPrint("MainController ListView reach the top");
    }
  }

  ///Method for ListView will Scroll up 
  void scrollUp(int itemSize, ) {
    _scrollController.animateTo(
      _scrollController.offset - itemSize,
      curve: Curves.linear, 
      duration: Duration(milliseconds: 500)
    );
  }

  ///Method for ListView will Scroll down
  void scrollDown(int itemSize, ) {
    //_controller.jumpTo(pixelsToMove);
    _scrollController.animateTo(
      _scrollController.offset + itemSize,
      curve: Curves.linear, 
      duration: Duration( milliseconds: 500 )
    );
  }

  /// NotificationListenerCallback
  /// Return true to cancel the notification bubbling. Return false to
  /// allow the notification to continue to be dispatched to further ancestors.
  bool onCheckScroll(ScrollNotification scrollNotification) {
    if (scrollNotification is ScrollStartNotification) {
      debugPrint("MainController onStartScroll Scroll Start");

    } else if (scrollNotification is ScrollUpdateNotification) {
      debugPrint("MainController onUpdateScroll Scroll Update");

    } else if (scrollNotification is ScrollEndNotification) {
      debugPrint("MainController onEndScroll Scroll End");

    }
    return false;
  }

  ScrollController getScrollController() {
    return _scrollController;
  }

  Future<void> fetchAPOD(int count) async {
    try {
      _isLoading(true);
      final apod = await HttpService.getAstronomyPictureOfTheDay(Environment.apiKey, getLength() + count);
      if (apod != null) {
        _list.value = ConvertList.toHolderList(apod);
        _list.value.reversed;
      }
      debugPrint("MainController list ${_list.value}");
      debugPrint("MainController list lenght ${_list.value.length}");
    } on RangeError {
      debugPrint("MainController RangeError");
    } catch (exception) {
      debugPrint("MainController exception ${exception}");
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
    super.onClose();
  }
}