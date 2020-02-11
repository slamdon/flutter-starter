import 'package:flutter/material.dart';

class SizeAnimationPage extends StatefulWidget {
  @override
  _SizeAnimationState createState() => _SizeAnimationState();
}

class _SizeAnimationState extends State<SizeAnimationPage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _setupAnimation();
  }

  _setupAnimation() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation = Tween(begin: 50.0, end: 150.0).animate(animationController);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: animation,
          child: Image(
            image: AssetImage('assets/don.png'),
          ),
          builder: (context, child) => Container(
            width: animation.value,
            height: animation.value,
            child: child,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(animationController.value);
          if (animationController.status == AnimationStatus.reverse ||
              animationController.value == 0) {
            animationController.forward();
          } else {
            animationController.reverse();
          }
        },
        child: Text('GO'),
      ),
    );
  }
}
