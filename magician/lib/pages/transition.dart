import 'package:flutter/material.dart';
import 'package:magician/pages/transition_detail.dart';

class TransitionPage extends StatelessWidget {
  @override
  build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Hero(
          child: Center(
              child: Container(
                  child: Image(
            image: AssetImage('assets/mountain.png'),
            width: 300,
            height: 150,
          ))),
          tag: 'mountain',
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => TransitionDetailPage()));
        },
      ),
    );
  }
}
