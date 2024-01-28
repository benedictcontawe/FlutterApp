import 'package:flutter/material.dart';

class MediaSizeClipper extends CustomClipper<Rect> {
  
  final Size _mediaSize;
  const MediaSizeClipper(this._mediaSize);
  
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, _mediaSize.width, _mediaSize.height);
  }
  
  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}