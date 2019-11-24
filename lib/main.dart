import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]); //Locks device to portrait mode
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  new MaterialApp(
      title: 'Web View',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(primarySwatch: Colors.teal),
      home: new WebViewWidget(),
    );
  }  
}
      
class WebViewWidget extends StatefulWidget {
  WebViewState createState() => WebViewState();
}

class WebViewState extends State<WebViewWidget> {
WebViewController _webViewController;
String filePath = 'html/lorem.html';

_loadHtmlFromAssets() async {
  String fileHtmlContents = await rootBundle.loadString(filePath);
  _webViewController.loadUrl(Uri.dataFromString(fileHtmlContents, mimeType: 'text/html', encoding: Encoding.getByName('utf-8')).toString());
}

Widget customWebView() {
  return WebView(
          initialUrl: '', //initialUrl: 'https://flutter.dev',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _webViewController = webViewController;
            _loadHtmlFromAssets();
          },
  );
}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: const Text('WebViewApp'),
      ),
      backgroundColor: Colors.white,
      body: customWebView(),
    );
  }
}