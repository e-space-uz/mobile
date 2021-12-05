import 'package:flutter/material.dart';

class HomeCustomPaint extends CustomPainter {
  final Color fillColor;

  const HomeCustomPaint(this.fillColor);

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.8888889, 0);
    path_0.lineTo(size.width * 0.1111111, 0);
    path_0.cubicTo(size.width * 0.05000000, 0, 0, size.height * 0.05000000, 0,
        size.height * 0.1111111);
    path_0.lineTo(0, size.height * 0.8888889);
    path_0.cubicTo(0, size.height * 0.9500000, size.width * 0.05000000,
        size.height, size.width * 0.1111111, size.height);
    path_0.lineTo(size.width * 0.8888889, size.height);
    path_0.cubicTo(size.width * 0.9500000, size.height, size.width,
        size.height * 0.9500000, size.width, size.height * 0.8888889);
    path_0.lineTo(size.width, size.height * 0.1111111);
    path_0.cubicTo(size.width, size.height * 0.05000000, size.width * 0.9500000,
        0, size.width * 0.8888889, 0);
    path_0.close();
    path_0.moveTo(size.width * 0.8888889, size.height * 0.8888889);
    path_0.lineTo(size.width * 0.1111111, size.height * 0.8888889);
    path_0.lineTo(size.width * 0.1111111, size.height * 0.1111111);
    path_0.lineTo(size.width * 0.8888889, size.height * 0.1111111);
    path_0.lineTo(size.width * 0.8888889, size.height * 0.8888889);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = fillColor.withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.3333333, size.height * 0.5000000);
    path_1.lineTo(size.width * 0.2222222, size.height * 0.5000000);
    path_1.lineTo(size.width * 0.2222222, size.height * 0.7777778);
    path_1.lineTo(size.width * 0.3333333, size.height * 0.7777778);
    path_1.lineTo(size.width * 0.3333333, size.height * 0.5000000);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = fillColor.withOpacity(1.0);
    canvas.drawPath(path_1, paint1Fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.7777778, size.height * 0.2222222);
    path_2.lineTo(size.width * 0.6666667, size.height * 0.2222222);
    path_2.lineTo(size.width * 0.6666667, size.height * 0.7777778);
    path_2.lineTo(size.width * 0.7777778, size.height * 0.7777778);
    path_2.lineTo(size.width * 0.7777778, size.height * 0.2222222);
    path_2.close();

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = fillColor.withOpacity(1.0);
    canvas.drawPath(path_2, paint2Fill);

    Path path_3 = Path();
    path_3.moveTo(size.width * 0.5555556, size.height * 0.6111111);
    path_3.lineTo(size.width * 0.4444444, size.height * 0.6111111);
    path_3.lineTo(size.width * 0.4444444, size.height * 0.7777778);
    path_3.lineTo(size.width * 0.5555556, size.height * 0.7777778);
    path_3.lineTo(size.width * 0.5555556, size.height * 0.6111111);
    path_3.close();

    Paint paint3Fill = Paint()..style = PaintingStyle.fill;
    paint3Fill.color = fillColor.withOpacity(1.0);
    canvas.drawPath(path_3, paint3Fill);

    Path path_4 = Path();
    path_4.moveTo(size.width * 0.5555556, size.height * 0.3888889);
    path_4.lineTo(size.width * 0.4444444, size.height * 0.3888889);
    path_4.lineTo(size.width * 0.4444444, size.height * 0.5000000);
    path_4.lineTo(size.width * 0.5555556, size.height * 0.5000000);
    path_4.lineTo(size.width * 0.5555556, size.height * 0.3888889);
    path_4.close();

    Paint paint4Fill = Paint()..style = PaintingStyle.fill;
    paint4Fill.color = fillColor.withOpacity(1.0);
    canvas.drawPath(path_4, paint4Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
