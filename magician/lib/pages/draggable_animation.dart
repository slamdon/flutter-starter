import 'package:flutter/material.dart';
import 'package:magician/components/draggable_card.dart';

class DraggableAnimationPage extends StatelessWidget {
  @override
  build(BuildContext context) {
    return Align(
      child: DraggableCard(
        child:
            Image(image: AssetImage('assets/don.png'), width: 100, height: 100),
        originAlignment: Alignment.centerRight,
      ),
      alignment: Alignment.centerRight,
    );
  }
}
