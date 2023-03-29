import 'package:dart_http/controllers/base_controller.dart';
import 'package:dart_http/dio/api_method.dart';
import 'package:dart_http/dio/dio_service.dart';
import 'package:dart_http/models/nasa_holder_model.dart';
import 'package:dart_http/routes/app_pages.dart';
import 'package:dart_http/util/constants.dart';
import 'package:dart_http/util/convert_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends BaseController {

  MainController(DioService this.dioService) {
    debugPrint("MainController Constructor");
  }

  final RxBool _isLoading = true.obs, _isSearchEnabled = false.obs, _isSearchVisible = false.obs;
  final RxList<NasaHolderModel> _list = <NasaHolderModel>[].obs;
  final DioService dioService;
  final ScrollController _scrollController = new ScrollController();
  final TextEditingController _searchController = new TextEditingController();

  @override
  void onInit() {
    dioService.initialize(null, null, null);
    dioService.initInterceptors();
    _scrollController.addListener(_scrollListener);
    fetchAPOD(10);
    //enableSearch();
    //addSeachListener();
    super.onInit();
  }
  //#region Scroll Methods
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
  //#endregion
  Future<void> fetchAPOD(int count) async { 
    debugPrint("MainController fetchAPOD ${count}");
    try {
      _isLoading(true);
      var response = await dioService.request(url: Constants.API_GET, method: ApiMethod.GET, params: {
        'api_key': Constants.API_KEY,
        'count': getLength() + count,
      });      
      debugPrint("MainController statusCode ${response.statusCode}");
      if (response.statusCode == 200) {
        //_list.value = ConvertList.toHolderList( ConvertList.toResponseList( response.data ) );
        _list.value.clear();
        _list.value.addAll(
          ConvertList.toHolderList( 
            ConvertList.toResponseList( 
              response.data 
            ) 
          )
        );
        _list.value.reversed;
      }
      debugPrint("MainController list ${_list.value}");
      debugPrint("MainController list lenght ${_list.value.length}");
    } on RangeError {
      debugPrint("MainController RangeError");
    } catch (exception) {
      debugPrint("MainController exception $exception");
      Get.snackbar("Error", exception.toString());
    } finally {
      _isLoading(false);
    }
  }

  bool isLoading() {
    return _isLoading.value;
  }
  //#region Search Methods
  bool isSearchEnabled() {
    return _isSearchEnabled.value;
  }

  RxBool isSearchVisible() {
    return _isSearchVisible;
  }

  void toogleSearch() {
    debugPrint("MainController toogleSearch");
    _isSearchVisible.toggle();
    if(_isSearchEnabled.value && _isSearchVisible.value == false) {
      _searchController.clear();
    }
  }

  void resetSearch() {
    debugPrint("MainController resetSearch");
    _isSearchVisible(false);
    _searchController.clear();
  }

  TextEditingController getSearchController() {
    return _searchController;
  }

  void enableSearch() {
    debugPrint("MainController enableSearch");
    _isSearchEnabled(true);
  }

  void addSeachListener() {
    debugPrint("MainController addSeachListener");
    _searchController.addListener(() {
      //TODO Search Filter Code Still On going
      filterAPOD(_searchController.text.toString());
    });
  }

  Future<void> filterAPOD(String filter) async {
    debugPrint("MainController filterAPOD $filter");
    try {
      _isLoading(true);
      if (filter.isEmpty) {
        debugPrint("MainController search text isEmpty");
        //fetchAPOD(10);
        //_list.clear();
        //_list.value.reversed;
      } else {
        debugPrint("MainController search text not Empty");
        List<NasaHolderModel> filtered = _list.value.where(
          (model) => model.title!.contains(_searchController.text.toString())
        ).toList();
        debugPrint("MainController filtered ${filtered.length}");
        debugPrint("MainController _list ${_list.length}");
        _list.value.clear();
        _list.value.addAll(filtered);
        //_list.value.reversed;
        debugPrint("MainController filtered added");
      }
    } on RangeError {
      debugPrint("MainController RangeError");
    } catch (exception) {
      debugPrint("MainController exception $exception");
      Get.snackbar("Error", exception.toString());
    } finally {
      _isLoading(false);
    } 
  }
  //#endregion
  //#region List Getter Methods
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
  //#endregion
  void launchDetails(int index) {
    debugPrint("MainController launchDetails ${index}");
    Get.toNamed(
      Routes.DETAIL, 
      arguments: _list[index]
    );
  }

  @override
  void onClose() {
    debugPrint("MainController onClose");
    super.onClose();
  }
}