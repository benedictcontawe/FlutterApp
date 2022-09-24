import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseView<T> extends GetView<T> {
  const BaseView({Key? key}) : super(key: key); 
}