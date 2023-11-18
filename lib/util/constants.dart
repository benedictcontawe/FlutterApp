import 'package:getx_storage/util/environment.dart';
import 'package:getx_storage/util/hex_color.dart';
import 'package:flutter/material.dart';

class Constants {
  static final API_DOMAIN = Environment.apiUrl;
  static final API_GET = Environment.apiGet;
  static final API_KEY = Environment.apiKey;
  static const TIMEOUT = 3000;
  static const BLANK = " ";
  static const NIL = "Nil";
  static const BOOLEAN = "boolean";
  static const STRING = "string";
  static const INTEGER = "integer";
  static const DOUBLE = "double";
  static const ID = "id";
  static const NAME = "name";
  static const ICON = "icon";
  static const IMAGE_URL = "image_url";
  static const IMAGE_NAME = "image_name";
  static Color kBackgroundColor = HexColor('FFFFFF');
  static Color transparentColor = HexColor('00ffffff').withOpacity(0.00) ?? Colors.transparent;
  static Color kSolidButtonColor = HexColor('F38E36');
  static Color kPrimaryTextColor = HexColor('000000');
  static Color kSecondaryTextColor = HexColor('FFFFFF');
}