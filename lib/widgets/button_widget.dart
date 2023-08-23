import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {

  const ButtonWidget ( {
    super.key, 
    required this.text,
    required this.onPressed, 
    //this.highlightElevation,
    this.textColor, 
    this.fillColor, 
    this.splashColor,
    //this.fontSize,
    //this.fontWeight,
    //this.style,
  } );
  
  final String text;
  final GestureTapCallback onPressed;
  //final double? highlightElevation;
  final Color? textColor;
  final Color? fillColor;
  final Color? splashColor;
  //final double? fontSize;
  //final FontWeight? fontWeight;
  //final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: new Text(
        text,
        style: TextStyle(
          color: textColor ?? Colors.white
        ),
      ),
      fillColor: fillColor ?? Colors.indigo,
      onPressed: onPressed,
      //shape: StadiumBorder(),
      splashColor: splashColor ?? Colors.indigoAccent,
      );
  }
}