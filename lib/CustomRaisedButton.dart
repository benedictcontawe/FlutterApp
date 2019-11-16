import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget{
    CustomRaisedButton({this.text, this.backGroundColor, this.onPressed , this.flex = 1 , this.aspectRatio = 1 });

    String text;
    Color backGroundColor;
    VoidCallback onPressed;
    int flex;
    double aspectRatio;
    
      Widget build(BuildContext context) {
        return Expanded(
          child: AspectRatio(
            aspectRatio: aspectRatio, //Dimens Ratio to make square or rectangle view
            child: FractionallySizedBox ( //A widget that sizes its child to a fraction of the total available space
              widthFactor: 0.85, //Will Acumulate percentage of the width for Parent Widget
              heightFactor: 0.85, //Will Acumulate percentage of the height for Parent Widget
              child: new RaisedButton (
                child: FittedBox( // To auto size the child text widget.
                  fit: BoxFit.fitWidth,
                  child: Text (
                    text,
                    style: TextStyle (
                      fontSize:  30,
                      color: Colors.white //Text Color
                    ),
                  ),
                ),
                onPressed: onPressed, //On click listener event
                color: backGroundColor, //Text Background Color
                shape: StadiumBorder(),//shape: CircleBorder(), //To make all widget corner curve
              ),
            )
          ),
          flex: flex, //Weight
        );
    }
}