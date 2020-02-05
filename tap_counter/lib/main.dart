import 'dart:io';

import 'package:flutter/material.dart';

void main() => runApp(TapCounter());

class TapCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(title: 'Tap Counter'),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;

  void _incrementCounter() {
    // build() will be called when we call setState()
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('Tapped: $_counter',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.grey,
                )),
            FlatButton(
              onPressed: _incrementCounter,
              color: Colors.blueAccent,
              textColor: Colors.white,
              child: Text("TAP"),
            )
          ],
        ),
      ),
    );
  }
}