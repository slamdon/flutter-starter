import 'package:flutter/material.dart';

class TransitionDetailPage extends StatelessWidget {
  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transition Detail"),
      ),
      body: Container(
        child: Hero(
          child: Image(
            image: AssetImage('assets/mountain.png')
          ),
          tag: 'mountain',
        ),
      ),
    );
  }
}
