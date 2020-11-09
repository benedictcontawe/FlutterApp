import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() async {
  //await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]); //Locks device to portrait mode
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  new MaterialApp(
      title: 'Action Sheet',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const Home(),
    );
  }  
}

class Home extends StatelessWidget {
  const Home({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: const Text('ActionSheetApp'),
      ),
      backgroundColor: Colors.white,
      body: Builder(
        builder: (context) => Center(
              child: RaisedButton(
                child: const Text('Show Action Sheet'),
                onPressed: () => _showActionSheet(context),
              ),
            ),
      ),
    );
  }

  void _showActionSheet(BuildContext context) {
    containerForSheet<String>(
      context: context,
      child: customActionSheet(context)
    );
  }

  void containerForSheet<T>({BuildContext context, Widget child}) {
    showCupertinoModalPopup<T>(
      context: context,
      builder: (BuildContext context) => child,
    ).then<void>((T value) {
      Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text('You clicked $value'),
        duration: Duration(milliseconds: 800),
      ));
    });
  }

  Widget customActionSheet(BuildContext context) {
    return CupertinoActionSheet(
      title: const Text('Choose frankly 😊'),
      message: const Text(
        'Your options are'
      ),
      actions: [
        CupertinoActionSheetAction(
          child: const Text('🙋 Yes'),
          onPressed: () {
            Navigator.pop(context, '🙋 Yes');
          },
        ),
        CupertinoActionSheetAction(
          child: const Text('🙋 No'),
          onPressed: () {
            Navigator.pop(context, '🙋 No');
          },
        ),
        CupertinoActionSheetAction(
          child: const Text("🙋 Can't say"),
          onPressed: () {
            Navigator.pop(context, "🙋 Can't say");
          },
        ),
        CupertinoActionSheetAction(
          child: const Text("🙋 Decide in next post"),
          onPressed: () {
            Navigator.pop(context, "🙋 Decide in next post");
          },
        ),
      ],
      cancelButton: 
      CupertinoActionSheetAction(
        child: const Text('Cancel'),
        isDefaultAction: true,
        onPressed: () {
          Navigator.pop(context, 'Cancel');
        },
      )
    );
  }
}