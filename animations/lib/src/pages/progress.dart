import 'package:flutter/material.dart';
import 'package:animations/src/widgets/radialProgress.dart';

class Progress extends StatefulWidget {
  @override
  _ProgressState createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  double percentage = 0.0;
  Color color;
  Color colorSecundary;
  double stroke;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              percentage += 10;
              if (percentage > 100) {
                percentage = 0;
              }
            });
          },
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadialProgress(percentage: percentage),
                CustomRadialProgress(percentage: percentage),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadialProgress(percentage: percentage),
                CustomRadialProgress(percentage: percentage),
              ],
            ),
          ],
        ));
  }
}

class CustomRadialProgress extends StatelessWidget {
  CustomRadialProgress({
    @required this.percentage,
  });

  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      child: RadialProgress(
        percentage: percentage,
        color: Colors.green,
        colorSecundary: Colors.redAccent,
        stroke: 2,
      ),
    );
  }
}
