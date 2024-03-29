import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counterEven = 0;
  int _counterOdd = 1;
  int _counterNRP = 1;
  int _counterPyramid = 0;
  String _fullNRP = '3122600002';
  var _nrp = '';
  var _pyramid = '';


  void _incrementCounter() {
    setState(() {
      if(_counterEven >= 20){
        _counterOdd = 1;
        _counterEven = 0;
      } else {
        _counterOdd += 2;
        _counterEven += 2;
      }
      _setNRP();
      _setPyramid();
    });
  }

  void _setNRP(){
      _nrp = _fullNRP.substring(0, _counterNRP);
    if(_counterNRP >= 10){
      _counterNRP = 1;      
    } else {
        _counterNRP += 1;
    }
  }
  void _setPyramid(){
    var pyramidRow ='';
    if(_counterPyramid >=5){
      _counterPyramid = 0;
      _pyramid = '';
    } else {
      _counterPyramid += 1;
    }

    for (var i=0; i<_counterPyramid; i++){
      pyramidRow += 'o';
    }
    _pyramid += '$pyramidRow\n';
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Ini Bilangan Ganjil:',
            ),
            Text(
              '$_counterOdd',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Text(
              'Ini Bilangan Genap:',
            ),
            Text(
              '$_counterEven',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Text(
              'NRP:',
            ),
            Text(
              _nrp,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              _pyramid,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
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
