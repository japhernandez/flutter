import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615AAB),
    );
  }
}

class HeaderBordesRedondeados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
          color: Color(0xff615AAB),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50))),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    /** Propiedades del lapiz */
    final paint = new Paint();
    /** PaintingStyle.stroke = hace una linea */
    /** PaintingStyle.fill = hace un relleno */
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;
    paint.color = Color(0xff615AAB);

    /** Movimientos del lapiz */
    final path = new Path();
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderTriangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderTrianguloPainter(),
      ),
    );
  }
}

class _HeaderTrianguloPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    /** Propiedades del lapiz */
    final paint = new Paint();
    /** PaintingStyle.stroke = hace una linea */
    /** PaintingStyle.fill = hace un relleno */
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;
    paint.color = Color(0xff615AAB);

    /** Movimientos del lapiz */
    final path = new Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderPentagono extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderPentagonoPainter(),
      ),
    );
  }
}

class _HeaderPentagonoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    /** Propiedades del lapiz */
    final paint = new Paint();
    /** PaintingStyle.stroke = hace una linea */
    /** PaintingStyle.fill = hace un relleno */
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;
    paint.color = Color(0xff615AAB);

    /** Movimientos del lapiz */
    final path = new Path();
    path.lineTo(0, size.height * 0.20);
    path.lineTo(size.width * 0.5, size.height * 0.30);
    path.lineTo(size.width, size.height * 0.20);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderCurve extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvePainter(),
      ),
    );
  }
}

class _HeaderCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    /** Propiedades del lapiz */
    final paint = new Paint();
    /** PaintingStyle.stroke = hace una linea */
    /** PaintingStyle.fill = hace un relleno */
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;
    paint.color = Color(0xff615AAB);

    /** Movimientos del lapiz */
    final path = new Path();
    path.lineTo(0, size.height * 0.20);
    path.quadraticBezierTo(
        size.width * 0.50, size.height * 0.40, size.width, size.height * 0.20);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWaveDouble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWavePainter(),
      ),
    );
  }
}

class _HeaderWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    /** Propiedades del lapiz */
    final paint = new Paint();
    /** PaintingStyle.stroke = hace una linea */
    /** PaintingStyle.fill = hace un relleno */
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;
    paint.color = Color(0xff615AAB);

    /** Movimientos del lapiz */
    final path = new Path();
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30,
        size.width * 0.50, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.20, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWaveGradient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurveWaveGradientPainter(),
      ),
    );
  }
}

class _HeaderCurveWaveGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect =
        new Rect.fromCircle(center: Offset(205.0, 55.0), radius: 180);

    final Gradient gradient = new LinearGradient(
        /** Propiedades para gradiente horizontal */
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          Color(0xff6D05E8),
          Color(0xffC012FF),
          Color(0xff6D05FA),
        ]);

    /** Propiedades del lapiz */
    final paint = new Paint()..shader = gradient.createShader(rect);
    /** PaintingStyle.stroke = hace una linea */
    /** PaintingStyle.fill = hace un relleno */
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    /** Movimientos del lapiz */
    final path = new Path();
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30,
        size.width * 0.50, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.20, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
