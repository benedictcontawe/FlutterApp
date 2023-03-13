import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class IframeWidget extends StatefulWidget {

  const IframeWidget( {
    super.key, 
    required this.height, 
    required this.width, 
    required this.src, 
    required this.border,
    required this.mediaQueryHeight,
    required this.mediaQueryWidth,
  } );

  final String height, width, src, border;
  final double mediaQueryHeight, mediaQueryWidth;

  @override
  State<IframeWidget> createState() {
    return new _IframeWidgetState();
  }
}

class _IframeWidgetState extends State<IframeWidget> {
  
  final IFrameElement _iFrameElement = IFrameElement();

  @override
  void initState() {
     _iFrameElement.allowFullscreen = true;
    _iFrameElement.src = widget.src;
    _iFrameElement.style.border = widget.border;
    _iFrameElement.style.borderColor = "initial";
    _iFrameElement.style.borderImage = "initial";
    _iFrameElement.style.borderWidth = "2px";
    _iFrameElement.style.height = widget.height;
    _iFrameElement.style.overflow = "clip !important";
    _iFrameElement.style.width = widget.width;
    //ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) {
        return _iFrameElement;
      },
    );
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return SizedBox (
      height: widget.mediaQueryHeight,
      width: widget.mediaQueryWidth,
      child: HtmlElementView (
        viewType: 'iframeElement',
        key: UniqueKey(),
      ),
    );
  }
}