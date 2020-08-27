import 'dart:math';
import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final percentage;
  final Color color;
  final Color colorSecundary;
  final double stroke;

  RadialProgress({
    @required this.percentage,
    this.color = Colors.blue,
    this.colorSecundary = Colors.blueAccent,
    this.stroke,
  });

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  double oldPercentage;

  @override
  void initState() {
    oldPercentage = widget.percentage;

    controller = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);
    // widget.percentage = 10 = 20
    // oldPercentage = 0 = 10
    // differenceAnimation = 0 = 10
    final differenceAnimation = widget.percentage - oldPercentage;

    oldPercentage = widget.percentage; // 10 = 20

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _RadialProgressPainter(
              // (10 - 0) + (0 * 1)
              // (20 - 10) + (10 * 1)
              (widget.percentage - differenceAnimation) +
                  (differenceAnimation * controller.value),
              widget.color,
              widget.colorSecundary,
              widget.stroke,
            ),
          ),
        );
      },
    );
  }
}

class _RadialProgressPainter extends CustomPainter {
  final percentage;
  final Color color;
  final Color colorSecundary;
  final double stroke;

  _RadialProgressPainter(
    this.percentage,
    this.color,
    this.colorSecundary,
    this.stroke,
  );

  @override
  void paint(Canvas canvas, Size size) {
    final Gradient gradient = new LinearGradient(
      colors: [
        Color(0xffC012FF),
        Color(0xff6D05E8),
        Colors.red,
      ],
    );

    final paint = new Paint()
      ..strokeWidth = stroke
      ..color = colorSecundary
      ..style = PaintingStyle.stroke;

    final center = new Offset(size.width * 0.5, size.height / 2);
    final radius = min(size.width * 0.5, size.height * 0.5);

    final Rect rect = new Rect.fromCircle(center: Offset(0, 0), radius: 180);

    canvas.drawCircle(center, radius, paint);

    final arcPaint = new Paint()
      ..strokeWidth = 10
      //..color = color
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    double arcAngle = 2 * pi * (percentage / 100);

    canvas.drawArc(
      Rect.fromCircle(
        center: center,
        radius: radius,
      ),
      -pi / 2,
      arcAngle,
      false,
      arcPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
