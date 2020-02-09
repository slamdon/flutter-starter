import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        child: Text(
          "Home Page",
          style: TextStyle(fontSize: 30),
        ),
      ),
    ));
  }
}
