import 'package:flutter/material.dart';
import 'package:image_carousel/components/carousel/code4carousel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController();
  PageView pageView;
  int currentIndex = 0;

  var images = [
    'assets/ocean-1.png',
    'assets/ocean-2.png',
    'assets/ocean-3.png',
    'assets/ocean-4.png',
    'assets/ocean-5.png'
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  build(BuildContext context) {
    return Container(
      child: Code4Carousel(imagePaths: this.images, height: 320),
      height: 320,
    );
  }

}