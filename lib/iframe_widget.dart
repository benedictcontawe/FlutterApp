import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class IframeWidget extends StatefulWidget {

  IframeWidget( {
    super.key, 
    required this.height, 
    required this.width, 
    required this.src, 
    required this.border,
  } );

  String height, width, src, border;

  @override
  State<IframeWidget> createState() {
    return new _IframeWidgetState();
  }
}

class _IframeWidgetState extends State<IframeWidget> {
  
  final IFrameElement _iFrameElement = IFrameElement();

  @override
  void initState() {
    _iFrameElement.style.height = widget.height;
    _iFrameElement.style.width = widget.width;
    _iFrameElement.src = widget.src;
    _iFrameElement.style.border = widget.border;

    //ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) {
        return _iFrameElement;
      },
    );

    super.initState();
  }

  final Widget _iframeWidget = HtmlElementView(
    viewType: 'iframeElement',
    key: UniqueKey(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: Column (
        children: [
          SizedBox (
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: _iframeWidget,
          )
        ],
      ),
    );
  }
}