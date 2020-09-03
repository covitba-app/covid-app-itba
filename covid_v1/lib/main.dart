import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:circle_wheel_scroll/circle_wheel_scroll_view.dart';
import 'widgets/LateralMenu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COVITBA',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.greenAccent,
        errorColor: Colors.blueGrey[800],
        fontFamily: 'Quicksand',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          color: Color.fromARGB(255, 28, 28, 30),
        ),
      ),
      home: MyHomePage(title: 'COVITBA'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _counter = 0;
  var _numOfBubles = 20;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        )),
        centerTitle: true,
      ),
      drawer: LateralMenu(),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularPercentIndicator(
              radius: 200.0,
              animation: true,
              animationDuration: 1200,
              lineWidth: 15.0,
              percent: 0.8,
              center: Text(
                "High Exposure",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
              circularStrokeCap: CircularStrokeCap.butt,
              backgroundColor: Colors.grey,
              progressColor: Color.fromARGB(255, 150, 2, 10),
            ),
            SafeArea(
              child: Center(
                child: Container(
                  height: 484,
                  width: 350,
                  child: CircleListScrollView(
                    physics: CircleFixedExtentScrollPhysics(),
                    axis: Axis.horizontal,
                    itemExtent: 80,
                    children: List.generate(
                        _numOfBubles, (i) => _buildItem(i, _numOfBubles)),
                    radius: MediaQuery.of(context).size.width * 0.4,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(int i, int total) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Container(
          width: 80,
          padding: EdgeInsets.all(20),
          color: Theme.of(context)
              .primaryColor
              .withAlpha((255 / total).truncate().toInt() * (i % total)),
          child: Center(
            child: Text(
              i.toString(),
            ),
          ),
        ),
      ),
    );
  }
}
