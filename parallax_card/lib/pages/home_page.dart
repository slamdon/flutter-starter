import 'package:flutter/material.dart';
import 'package:parallax_card/components/trip_page_item.dart';
import 'package:parallax_card/components/trip_page_transformer.dart';
import 'package:parallax_card/model/trip.dart';

class HomePage extends StatelessWidget {
  final trips = [
    Trip(
        title: 'Roma',
        description: 'ENTRY OF COLOSSEUM',
        imageUrl: 'assets/roma-1.jpg'),
    Trip(
        title: 'COLOSSEUM',
        description: 'BUILDING APPEARANCE',
        imageUrl: 'assets/roma-2.jpg'),
    Trip(
        title: 'Roma',
        description: 'FORUM ROMANUM',
        imageUrl: 'assets/roma-3.jpg'),
    Trip(
        title: 'Don',
        description: 'IN THE COLOSSEUM',
        imageUrl: 'assets/roma-4.jpg'),
    Trip(
        title: 'Roma',
        description: 'PANORAMA OF COLOSSEUM',
        imageUrl: 'assets/roma-5.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        size: Size.fromHeight(550),
        child: TripPageTransformer(
          pageViewBuilder: (context, visibilityResolver) {
            return PageView.builder(
              controller: PageController(viewportFraction: 0.85),
              itemCount: trips.length,
              itemBuilder: (context, index) {
                final trip = trips[index];
                final pageVisibility =
                    visibilityResolver.resolvePageVisibility(index);
                return TripPageItem(
                    trip: trip, tripPageVisibility: pageVisibility);
              },
            );
          },
        ),
      ),
    );
  }
}
