import 'dart:async';
import 'calculator_event.dart';
//TODO: Modifiy this class
class CalculatorBloc {
  int _firstNumber = 0;
  int _secondNumber = 0;

  final _CalculatorStateController = StreamController<int>();
  StreamSink<int> get _inCounter => _CalculatorStateController.sink;
  // For state, exposing only a stream which outputs data
  Stream<int> get counter => _CalculatorStateController.stream;

  final _CalculatorEventController = StreamController<CalculatorEvent>();
  // For events, exposing only a sink which is an input
  Sink<CalculatorEvent> get CalculatorEventSink => _CalculatorEventController.sink;

  CounterBloc() {
    // Whenever there is a new event, we want to map it to a new state
    _CalculatorEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CalculatorEvent event) {
    if(event is IncrementEvent) {
      _firstNumber++;
    }
    else {
     _firstNumber--;
    }

     _inCounter.add(_firstNumber);
  }

  String get getResult {
    return '$_firstNumber + $_secondNumber';
  }

  void dispose() {
    _CalculatorStateController.close();
    _CalculatorEventController.close();
  }
}