import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localilocalizations/app_localizations.dart';

class Constants {
  static const BLANK = " ";
  /*
  These delegates make sure that the localization data for the proper language is loaded
  A class which loads the translations from JSON files
  Buiilt-in localization of basic text for material widgets
  Buiilt-in localization for text direction LTR/RTL
  */
  static const localizationsDelegates = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
  //List all of the app's supported locales here
  static const supportedLocales = [ 
    Locale('en', 'US'),
    Locale('ja', 'JP'),
    Locale('ru', 'RU'),
  ];
}