import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get mode {
    if(kReleaseMode) {
      return '.emv.production';
    } else {
      return '.emv.development';
    }
  }

  static String get apiUrl {
    return dotenv.env['API_DOMAIN'] ?? 'API url not found';
  }

  static String get apiKey {
    return dotenv.env['API_KEY'] ?? 'Key not found';
  }

  static String get apiGet {
    return dotenv.env['API_GET'] ?? 'Get not found';
  }
}