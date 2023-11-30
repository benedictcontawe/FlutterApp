import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseWidget<S extends GetLifeCycleBase> extends GetWidget<S> {
  const BaseWidget({Key? key}) : super(key: key);
}