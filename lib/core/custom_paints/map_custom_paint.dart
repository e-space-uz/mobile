import 'package:flutter/material.dart';

class MapCustomPaint extends CustomPainter {
  final Color fillColor;

  const MapCustomPaint(this.fillColor);

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.9722222, 0);
    path_0.lineTo(size.width * 0.9633333, size.height * 0.001666667);
    path_0.lineTo(size.width * 0.6666667, size.height * 0.1166667);
    path_0.lineTo(size.width * 0.3333333, 0);
    path_0.lineTo(size.width * 0.02000000, size.height * 0.1055556);
    path_0.cubicTo(size.width * 0.008333333, size.height * 0.1094444, 0,
        size.height * 0.1194444, 0, size.height * 0.1322222);
    path_0.lineTo(0, size.height * 0.9722222);
    path_0.cubicTo(0, size.height * 0.9877778, size.width * 0.01222222,
        size.height, size.width * 0.02777778, size.height);
    path_0.lineTo(size.width * 0.03666667, size.height * 0.9983333);
    path_0.lineTo(size.width * 0.3333333, size.height * 0.8833333);
    path_0.lineTo(size.width * 0.6666667, size.height);
    path_0.lineTo(size.width * 0.9800000, size.height * 0.8944444);
    path_0.cubicTo(size.width * 0.9916667, size.height * 0.8905556, size.width,
        size.height * 0.8805556, size.width, size.height * 0.8677778);
    path_0.lineTo(size.width, size.height * 0.02777778);
    path_0.cubicTo(size.width, size.height * 0.01222222, size.width * 0.9877778,
        0, size.width * 0.9722222, 0);
    path_0.close();
    path_0.moveTo(size.width * 0.3888889, size.height * 0.1372222);
    path_0.lineTo(size.width * 0.6111111, size.height * 0.2150000);
    path_0.lineTo(size.width * 0.6111111, size.height * 0.8627778);
    path_0.lineTo(size.width * 0.3888889, size.height * 0.7850000);
    path_0.lineTo(size.width * 0.3888889, size.height * 0.1372222);
    path_0.close();
    path_0.moveTo(size.width * 0.1111111, size.height * 0.1922222);
    path_0.lineTo(size.width * 0.2777778, size.height * 0.1361111);
    path_0.lineTo(size.width * 0.2777778, size.height * 0.7861111);
    path_0.lineTo(size.width * 0.1111111, size.height * 0.8505556);
    path_0.lineTo(size.width * 0.1111111, size.height * 0.1922222);
    path_0.close();
    path_0.moveTo(size.width * 0.8888889, size.height * 0.8077778);
    path_0.lineTo(size.width * 0.7222222, size.height * 0.8638889);
    path_0.lineTo(size.width * 0.7222222, size.height * 0.2144444);
    path_0.lineTo(size.width * 0.8888889, size.height * 0.1500000);
    path_0.lineTo(size.width * 0.8888889, size.height * 0.8077778);
    path_0.close();

    Paint paintFill = Paint()..style = PaintingStyle.fill;
    paintFill.color = fillColor.withOpacity(1.0);
    canvas.drawPath(path_0, paintFill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
