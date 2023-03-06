import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:localilocalizations/constants.dart';
import 'app_localizations.dart';

void main() async {
  //await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]); //Locks device to portrait mode
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Scroll View - Localization',
      debugShowCheckedModeBanner: true,
      home: new ScrollViewWidget(),
      localizationsDelegates: Constants.localizationsDelegates,
      localeResolutionCallback: (deviceLocale, supportedLocales) { // Returns a locale which will be used by the app
        for (var locale in supportedLocales) {
          if (locale.languageCode == deviceLocale!.languageCode && locale.countryCode == deviceLocale.countryCode) {
            return deviceLocale;
          }
        }
        // If the locale of the device is not supported, use the first one
        // from the list (English, in this case).
        return supportedLocales.first;
      },
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch, PointerDeviceKind.stylus, PointerDeviceKind.unknown},
      ),
      supportedLocales: Constants.supportedLocales,
      theme: ThemeData(primarySwatch: Colors.teal),
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
          onChanged: (bool? value) { //On check change of the check box
            setState(() {
              chckSwitch = value ?? false;
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