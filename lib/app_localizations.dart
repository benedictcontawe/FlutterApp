import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localilocalizations/constants.dart';
//region AppLocalizations
class AppLocalizations {
  
  AppLocalizations(this.locale) {
    
  }

  final Locale locale;

  //Helper method to keep the code in the widgets concise
  // Localizations are accessed using an InheritedWidget "of" syntax
  static AppLocalizations of(BuildContext context) {
    return Localizations.of(context, AppLocalizations);
  }

  //Static member to have a simple access to the delegate from the MaterialApp
  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  late Map<String, String> _localizedString;

  Future<bool> load() async { //Load the language JSON file from the "lang" folder
    String jsonString = await rootBundle.loadString('lang/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedString = jsonMap.map((key, value){
      return MapEntry(key, value.toString());
    });

    return true;
  }

  //This method will be called from every widget which needs a localized text
  String translate(String key) {
    return _localizedString[key] ?? Constants.BLANK;
  }
}
//endregion
//region _AppLocalizationsDelegate
class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {

  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) { //Include all of your supported language codes here
    return ['en'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async { //AppLocalizations class is where the JSON loading actually runs
    AppLocalizations localizations = new AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) {
    return false;
    
  }
}
//endregion