import 'package:dart_hive/util/environment.dart';
import 'package:dart_hive/util/hex_color.dart';
import 'package:flutter/material.dart';

class Constants {
  static final API_DOMAIN = Environment.apiUrl;
  static final API_GET = Environment.apiGet;
  static final API_KEY = Environment.apiKey;
  static const TIMEOUT = 3000;
  static const BLANK = " ";
  static const Hive = "hiveBox";
  static const HivePrimitive = "hivePrimitiveBox";
  Color kBackgroundColor = HexColor('FFFFFF');
  Color kSolidButtonColor = HexColor('F38E36');
  Color kPrimaryTextColor = HexColor('000000');
  Color kSecondaryTextColor = HexColor('FFFFFF');
}