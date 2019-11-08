import 'dart:async';
import 'calculator_event.dart';
//TODO: Modifiy this class
class CalculatorBloc {
  int _counter = 0;

  final _counterStateController = StreamController<int>();
  StreamSink<int> get _inCounter => _counterStateController.sink;
  // For state, exposing only a stream which outputs data
  Stream<int> get counter => _counterStateController.stream;

  final _CalculatorEventController = StreamController<CalculatorEvent>();
  // For events, exposing only a sink which is an input
  Sink<CalculatorEvent> get CalculatorEventSink => _CalculatorEventController.sink;

  CounterBloc() {
    // Whenever there is a new event, we want to map it to a new state
    _CalculatorEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CalculatorEvent event) {
    if(event is IncrementEvent) {
      _counter++;
    }
    else {
     _counter--;
    }

     _inCounter.add(_counter);
  }

  void dispose() {
    _counterStateController.close();
    _CalculatorEventController.close();
  }
}