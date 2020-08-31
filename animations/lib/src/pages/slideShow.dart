import 'package:flutter/material.dart';
import 'package:animations/src/widgets/slideShowWidget.dart';

class SlideShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlideShowWidget(
        pointsDirection: true,
        colorPrimary: Colors.red,
        colorSecondary: Colors.black38,
        slides: <Widget>[
          new Image.asset('assets/images/5.png'),
          new Image.asset('assets/images/2.png'),
          new Image.asset('assets/images/5.png'),
          new Image.asset('assets/images/2.png')
        ],
      ),
    );
  }
}
