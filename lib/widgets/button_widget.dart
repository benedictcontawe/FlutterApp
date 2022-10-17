import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {

  const ButtonWidget ( {
    super.key, 
    required this.text,
    required this.onPressed, 
    this.textColor, 
    this.fillColor, 
    this.splashColor
  } );
  
  final String text;
  final GestureTapCallback onPressed;
  final Color? textColor;
  final Color? fillColor;
  final Color? splashColor;

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