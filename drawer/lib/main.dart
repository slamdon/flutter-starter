import 'package:drawer/menu.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Drawer',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Menu(),
        initialRoute: '/member',
        
    );
  }
}

