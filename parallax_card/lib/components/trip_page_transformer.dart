import 'package:flutter/material.dart';
import 'package:parallax_card/components/trip_page_visibility_resolver.dart';

typedef PageView TripPageViewBuilder(
    BuildContext context, TripPageVisibilityResolver visibilityResolver);

class TripPageTransformer extends StatefulWidget {
  final TripPageViewBuilder pageViewBuilder;

  TripPageTransformer({this.pageViewBuilder});

  @override
  _TripPageTransformerState createState() => _TripPageTransformerState();
}

class _TripPageTransformerState extends State<TripPageTransformer> {
  TripPageVisibilityResolver _visibilityResolver;

  @override
  Widget build(BuildContext context) {
    final pageView = this.widget.pageViewBuilder(
          context,
          _visibilityResolver ?? TripPageVisibilityResolver(),
        );

    return NotificationListener<ScrollNotification>(
      child: pageView,
      onNotification: (ScrollNotification notification) {
        setState(() {
          _visibilityResolver = TripPageVisibilityResolver(
            scrollMetrics: notification.metrics,
            viewPortFraction: pageView.controller.viewportFraction,
          );
        });
        return null;
      },
    );
  }
}
