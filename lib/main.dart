import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp( {super.key } );

  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = false;
    return MaterialApp(
      title: 'Flutter Chips',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Chips'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool isFilterSelected = false, isChoiceSelected = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar (
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center (
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            const Text('You have pushed the button this many times:',),
            Text('$_counter', style: Theme.of(context).textTheme.headlineMedium,),
            Chip (
              avatar: CircleAvatar (
                backgroundColor: Colors.blue[400],
                backgroundImage: AssetImage('assets/flutter.webp'),
              ),
              label: Text("Basic Chip"),
            ),
            FilterChip (
              label: Text("Filter Chip"), 
              onSelected: (value) => setState(() {
                isFilterSelected = value;
              }),
              selected: isFilterSelected,
              checkmarkColor: Colors.red,
              selectedColor: Colors.green,
            ),
            InputChip (
              avatar: CircleAvatar ( backgroundImage: AssetImage('assets/flutter.webp'), ),
              label: Text("Input Chip"),
              //onPressed: () { },
              //onSelected: (value) { },
              //onDeleted: () { },
            ),
            ActionChip (
              avatar: Icon(
                Icons.search,
                color: Colors.blue,
              ),
              label: Text("Action Chip"),
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              onPressed: () {
                
              }
            ),
            ChoiceChip(
              label: Text("Choice Chip"),
              //onSelected: (value) => setState(() { isChoiceSelected = value; }),
              selected: isChoiceSelected
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}