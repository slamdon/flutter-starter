import 'package:flutter/material.dart';
import 'package:image_carousel/components/carousel/code4Indicator.dart';

class Code4Carousel extends StatefulWidget {
  final List<String> imagePaths;
  final double height;

  Code4Carousel({
    Key key,
    this.imagePaths,
    this.height,
  });

  @override
  _Code4CarouselState createState() => _Code4CarouselState();
}

class _Code4CarouselState extends State<Code4Carousel> {
  PageController pageController = PageController();
  PageView pageView;

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    this.pageView = _getPageView();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            child: pageView,
          ),
          Positioned(
            child: _getIndicator(),
            left: 0,
            bottom: 0,
            right: 0,
          ),
        ],
      ),
      height: this.widget.height,
    );
  }

  Widget _getIndicator() {
    return Code4Indicator(
      dotCount: this.widget.imagePaths.length,
      currentIndex: currentIndex,
      dotColor: Color.fromRGBO(255, 255, 255, 1),
      dotSelectedColor: Color.fromRGBO(255, 255, 255, 0.3),
      dotPadding: 12,
      dotSize: 14,
      onItemTap: (index) {
        pageController.jumpToPage(index);
      },
    );
  }

  Widget _getPageView() {
    return pageView = PageView.builder(
      itemCount: this.widget.imagePaths.length,
      itemBuilder: (BuildContext context, int index) {
        return Image(
          image: AssetImage(this.widget.imagePaths[index]),
          fit: BoxFit.cover,
        );
      },
      onPageChanged: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      controller: pageController,
    );
  }
}
