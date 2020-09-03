import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:circle_wheel_scroll/circle_wheel_scroll_view.dart';
import 'widgets/LateralMenu.dart';
import 'widgets/buildItem.dart';

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
        backgroundColor: Color.fromARGB(255, 28, 28, 30),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularPercentIndicator(
              radius: 200.0,
              animation: true,
              animationDuration: 1200,
              lineWidth: 15.0,
              percent: 0.65,
              center: Wrap(children: <Widget>[
                Column(
                  children: [
                    Text(
                      "65%",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 40.0),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Exposure",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )
              ]),
              circularStrokeCap: CircularStrokeCap.butt,
              backgroundColor: Colors.grey,
              progressColor: Theme.of(context).primaryColor,
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
                        _numOfBubles, (i) => BuildItem(i, _numOfBubles)),
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
}
