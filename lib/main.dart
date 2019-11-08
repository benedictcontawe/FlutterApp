import 'package:flutter/material.dart';
import 'calculator_bloc.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  new MaterialApp(
      title: 'Calculator',
      home: new CalculatorFragment(),
      );
  }  
}

class CalculatorFragment extends StatefulWidget {
CalculatorState createState() => CalculatorState();
}

class CalculatorState extends State<CalculatorFragment> {
  final _bloc = CalculatorBloc();

  Widget customRaisedButton(String text, Color backGroundColor, int flex, double aspectRatio) {
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
              onPressed: () {},
              color: backGroundColor, //Text Background Color
              shape: StadiumBorder(),//shape: CircleBorder(), //To make all widget corner curve
            ),
          )
        ),
        flex: flex, //Weight
      );
  }

  Widget customCalculatorResult(String text) {
    return Expanded( //To avoid overflowed pixels in your widget
      child: FittedBox( //Auto Size feture
        child: Text (
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60.0,
                  ),
                  textAlign: TextAlign.end,
        )
      )
    );
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: null,
      backgroundColor: Colors.black,
      body: new Column (
        mainAxisAlignment: MainAxisAlignment.end,//mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
            customCalculatorResult('1234567890'),
            ],
          ),
          SizedBox(height: 10,), //Spacer
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
            customRaisedButton('C', const Color(0xFFA5A5A5),1,1),
            customRaisedButton('Del', const Color(0xFFA5A5A5),1,1),
            customRaisedButton('%', const Color(0xFFA5A5A5),1,1),
            customRaisedButton('/', Colors.orange,1,1),
            ],
          ),
          Row(
            children: <Widget>[
            customRaisedButton('7', const Color(0xFF333333),1,1),
            customRaisedButton('8', const Color(0xFF333333),1,1),
            customRaisedButton('9', const Color(0xFF333333),1,1),
            customRaisedButton('X', Colors.orange,1,1),
            ],
          ),
          Row(
            children: <Widget>[
            customRaisedButton('4', const Color(0xFF333333),1,1),
            customRaisedButton('5', const Color(0xFF333333),1,1),
            customRaisedButton('6', const Color(0xFF333333),1,1),
            customRaisedButton('-', Colors.orange,1,1),
            ],
          ),
          Row(
            children: <Widget>[
            customRaisedButton('1', const Color(0xFF333333),1,1),
            customRaisedButton('2', const Color(0xFF333333),1,1),
            customRaisedButton('3', const Color(0xFF333333),1,1),
            customRaisedButton('+', Colors.orange,1,1),
            ],
          ),
          Row(
            children: <Widget>[
            customRaisedButton('0', const Color(0xFF333333),2,2),
            customRaisedButton('.', const Color(0xFF333333),1,1),
            customRaisedButton('=', Colors.orange,1,1),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose(); // to avoid memory leaks
  }
}