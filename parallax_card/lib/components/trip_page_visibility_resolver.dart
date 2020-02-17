
import 'package:flutter/material.dart';

class TripPageVisibility {
  final double pagePosition;
  TripPageVisibility({this.pagePosition});
}

class TripPageVisibilityResolver {
  final ScrollMetrics scrollMetrics;
  final double viewPortFraction;

  TripPageVisibilityResolver({
    this.scrollMetrics,
    this.viewPortFraction,
  });

  double _calculatePagePosition(int index) {
    final viewFraction = this.viewPortFraction ?? 1.0;
    final itemWidth = (this.scrollMetrics?.viewportDimension ?? 1.0) * viewFraction;
    final scrollX = this.scrollMetrics?.pixels ?? 0.0;
    final pageX = itemWidth * index;
    var pagePosition = (scrollX - pageX) / itemWidth;

    if(pagePosition > 1.0){
      pagePosition = 1.0;
    } else if(pagePosition < -1.0){
      pagePosition = -1.0;
    }

    return pagePosition;
  }

  TripPageVisibility resolvePageVisibility(int index) {
    final pagePosition = _calculatePagePosition(index);
    return TripPageVisibility(pagePosition: pagePosition);
  }

}