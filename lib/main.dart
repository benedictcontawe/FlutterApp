import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'app_localizations.dart';

void main() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]); //Locks device to portrait mode
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  new MaterialApp(
      title: 'Scroll View',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(primarySwatch: Colors.teal),
      supportedLocales: [ //List all of the app's supported locales here
        Locale('en', 'US'),
        Locale('ja', 'JP'),
        Locale('ru', 'RU'),
      ],
      localizationsDelegates: [ //These delegates make sure that the localization data for the proper language is loaded
        AppLocalizations.delegate, //A class which loads the translations from JSON files
        GlobalMaterialLocalizations.delegate, //Buiilt-in localization of basic text for material widgets
        GlobalWidgetsLocalizations.delegate, //Buiilt-in localization for text direction LTR/RTL
      ],
      localeResolutionCallback: (locale, supportedLocales) { // Returns a locale which will be used by the app
        for (var supportedLocale in supportedLocales) { // Check if the current device locale is supported
          if (supportedLocale.languageCode == locale.languageCode && supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        // If the locale of the device is not supported, use the first one
        // from the list (English, in this case).
        return supportedLocales.first;
      },
      home: new ScrollViewWidget(),
    );
  }  
}
      
class ScrollViewWidget extends StatefulWidget {
  ScrollViewState createState() => ScrollViewState();
}

class ScrollViewState extends State<ScrollViewWidget> {
bool chckSwitch = false ?? false; //With null default value of false

Widget customCheckBox() {
  return FractionallySizedBox( //To use the percentage screen layout
    widthFactor: 1, //match screen parent
    heightFactor: 0.1, //accumulate 10% of the screen
    child: Row( //Like Linearlayout orientation horizontal
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Checkbox(
          value: chckSwitch, //Initial value of the check box
          onChanged: (bool value) { //On check change of the check box
            setState(() {
              chckSwitch = value;
            });
          },
        ),
        Text(AppLocalizations.of(context).translate('checkBox')),
      ],
    ),
  );
}

Widget customScrollView() {
  return FractionallySizedBox(
    widthFactor: 1,
    heightFactor: 0.9,
    child: SingleChildScrollView(
      physics: chckSwitch ? const  NeverScrollableScrollPhysics() : const AlwaysScrollableScrollPhysics(), //Conditional statement for enable and disable scrollview
      child: Column(
        children: <Widget>[
          Text(
            AppLocalizations.of(context).translate('lorem'),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('appBar')),
      ),
      backgroundColor: Colors.white,
      body:  Stack (            
          fit: StackFit.expand,
          children: <Widget>[
            //Container(color: Colors.white,),
            Align(
              alignment: Alignment.topCenter,
              child: customCheckBox(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: customScrollView(),
            )
          ],
      ),
    );
  }
}

/*
Reference
https://flutter.dev/docs/development/accessibility-and-localization/internationalization
https://www.youtube.com/watch?v=lDfbbTvq4qM
https://resocoder.com/2019/06/01/flutter-localization-the-easy-way-internationalization-with-json/
https://api.flutter.dev/flutter/flutter_localizations/GlobalMaterialLocalizations-class.html
*/
