import 'package:flutter/material.dart';

class LinearProgress extends StatefulWidget {
  @override
  _LinearProgressState createState() => _LinearProgressState();
}

class _LinearProgressState extends State<LinearProgress>
    with SingleTickerProviderStateMixin {
  double percentage = 0.2;
  double width = 300;
  int durationLine = 3500;

  AnimationController _controller;

  Animation<double> fill;

  @override
  void initState() {
    _controller = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: durationLine),
    );

    fill = Tween(begin: 0.0, end: 240.0).animate(_controller);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();

    return CustomLinear(
      percentage: percentage,
      controller: _controller,
      fill: fill,
      width: width,
    );
  }
}

class CustomLinear extends StatelessWidget {
  final double percentage;
  final controller;
  final fill;
  final double width;

  const CustomLinear({
    Key key,
    @required this.percentage,
    @required this.controller,
    @required this.fill,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: width,
          height: 10,
          color: Colors.grey,
          child: AnimatedBuilder(
            animation: controller,
            child: CustomPaint(painter: _LinearProgressPainter(percentage)),
            builder: (BuildContext context, Widget child) {
              return Transform.translate(
                offset: Offset(fill.value, 0),
                child: child,
              );
            },
          ),
        ),
      ),
    );
  }
}

class _LinearProgressPainter extends CustomPainter {
  final percentage;

  _LinearProgressPainter(this.percentage);

  @override
  void paint(Canvas canvas, Size size) {
    final initial = new Offset(size.width * 0, size.height / 2);
    final paintLine = new Paint()
      ..strokeWidth = 10
      ..color = Colors.yellow
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final lineFill =
        new Offset(size.width * this.percentage, size.height * 0.5);

    canvas.drawLine(initial, lineFill, paintLine);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
