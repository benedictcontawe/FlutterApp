import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() async {
  //await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]); //Locks device to portrait mode
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Action Sheet',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const Home(),
    );
  }  
}

class Home extends StatelessWidget {
  const Home({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('ActionSheetApp'),
      ),
      child: Center(
        child: CupertinoButton(
          child: const Text('Show Action Sheet'),
          onPressed: () => _showActionSheet(context),
        ),
      ),
    );
  }

  void _showActionSheet(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => customActionSheet(context)
    );
  }

  Widget customActionSheet(BuildContext context) {
    return CupertinoActionSheet(
      title: const Text('Choose frankly 😊'),
      message: const Text('Your options are'),
      actions: [
        CupertinoActionSheetAction(
          child: const Text('🙋 Yes'),
          onPressed: () {
            debugPrint('CupertinoActionSheetAction 🙋 Yes');
            Navigator.pop(context, '🙋 Yes');
          },
        ),
        CupertinoActionSheetAction(
          child: const Text('🙋 No'),
          onPressed: () {
            debugPrint('CupertinoActionSheetAction 🙋 No');
            Navigator.pop(context, '🙋 No');
          },
        ),
        CupertinoActionSheetAction(
          child: const Text("🙋 Can't say"),
          onPressed: () {
            debugPrint("CupertinoActionSheetAction 🙋 Can't say");
            Navigator.pop(context, "🙋 Can't say");
          },
        ),
        CupertinoActionSheetAction(
          child: const Text("🙋 Decide in next post"),
          onPressed: () {
            debugPrint('CupertinoActionSheetAction 🙋 Decide in next post');
            Navigator.pop(context, "🙋 Decide in next post");
          },
        ),
      ],
      cancelButton : CupertinoActionSheetAction(
        child: const Text('Cancel'),
        isDefaultAction: true,
        onPressed: () {
          debugPrint('CupertinoActionSheetAction 🙋 Decide in next post');
          Navigator.pop(context, 'Cancel');
        },
      )
    );
  }
}