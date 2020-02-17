import 'package:flutter/material.dart';
import 'package:parallax_card/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Container(
          child: HomePage(),
        ),
        backgroundColor: Color.fromRGBO(253, 253, 235, 1),
      ),
    );
  }
}
