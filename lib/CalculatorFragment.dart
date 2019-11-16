import 'package:flutter/material.dart';
import 'CustomRaisedButton.dart';
import 'calculator_bloc.dart';
import 'calculator_event.dart';

class CalculatorFragment extends StatefulWidget {
  CalculatorState createState() => CalculatorState();
}

class CalculatorState extends State<CalculatorFragment> {
  final _bloc = CalculatorBloc();

  Widget customText(String text) {
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
        mainAxisAlignment: MainAxisAlignment.end, //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded( //To avoid overflowed pixels in your widget
            child: Row(
              children: <Widget>[
                StreamBuilder(
                  stream: _bloc.counter,
                  initialData: _bloc.getResult,
                  builder: (context, snapshot) {
                    return customText(('${snapshot.data}'));
                  }
                ),
              ],
            ),
          ),
          //SizedBox(height: 1,), //Spacer
          Expanded( //To avoid overflowed pixels in your widget
            child: Row (
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CustomRaisedButton(text: 'C', backGroundColor: const Color(0xFFA5A5A5), onPressed: () => {}),
                CustomRaisedButton(text: 'Del', backGroundColor: const Color(0xFFA5A5A5), onPressed: () => {}),
                CustomRaisedButton(text: '%', backGroundColor: const Color(0xFFA5A5A5), onPressed: () => {}),
                CustomRaisedButton(text: '/', backGroundColor: Colors.orange, onPressed: () => {}),
              ],
            ),
          ),
          Expanded( //To avoid overflowed pixels in your widget
            child: Row(
              children: <Widget>[
                CustomRaisedButton(text: '7', backGroundColor: const Color(0xFF333333), onPressed: () => {}),
                CustomRaisedButton(text: '8', backGroundColor: const Color(0xFF333333), onPressed: () => {}),
                CustomRaisedButton(text: '9', backGroundColor: const Color(0xFF333333), onPressed: () => {}),
                CustomRaisedButton(text: 'X', backGroundColor: Colors.orange, onPressed: () => {}),
              ],
            ),
          ),
          Expanded( //To avoid overflowed pixels in your widget
            child: Row(
              children: <Widget>[
                CustomRaisedButton(text: '4', backGroundColor: const Color(0xFF333333), onPressed: () => {}),
                CustomRaisedButton(text: '5', backGroundColor: const Color(0xFF333333), onPressed: () => {}),
                CustomRaisedButton(text: '6', backGroundColor: const Color(0xFF333333), onPressed: () => {}),
                CustomRaisedButton(text: '-', backGroundColor: Colors.orange, onPressed: () => {}),
              ],
            ),
          ),
          Expanded( //To avoid overflowed pixels in your widget
            child: Row(
              children: <Widget>[
                CustomRaisedButton(text: '1', backGroundColor: const Color(0xFF333333), onPressed: () => {}),
                CustomRaisedButton(text: '2', backGroundColor: const Color(0xFF333333), onPressed: () => {}),
                CustomRaisedButton(text: '3', backGroundColor: const Color(0xFF333333), onPressed: () => {}),
                CustomRaisedButton(text: '+', backGroundColor: Colors.orange, onPressed: () => {}),
              ],
            )
          ),
          Expanded( //To avoid overflowed pixels in your widget
            child: Row(
              children: <Widget>[
                CustomRaisedButton(text: '0', backGroundColor: const Color(0xFF333333), flex: 2, aspectRatio: 2.0, onPressed: () => {}),
                CustomRaisedButton(text: '.', backGroundColor: const Color(0xFF333333), onPressed: () => {}),
                CustomRaisedButton(text: '=', backGroundColor: Colors.orange, onPressed: () => print('implement me') ),
              ],
            ),
          )
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