import 'package:flutter/material.dart';

class CustomAreaPaint extends CustomPainter {
  final Color fillColor;

  const CustomAreaPaint(this.fillColor);

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.5000000, size.height * 0.1582353);
    path_0.lineTo(size.width * 0.7500000, size.height * 0.4229412);
    path_0.lineTo(size.width * 0.7500000, size.height * 0.8823529);
    path_0.lineTo(size.width * 0.6500000, size.height * 0.8823529);
    path_0.lineTo(size.width * 0.6500000, size.height * 0.5294118);
    path_0.lineTo(size.width * 0.3500000, size.height * 0.5294118);
    path_0.lineTo(size.width * 0.3500000, size.height * 0.8823529);
    path_0.lineTo(size.width * 0.2500000, size.height * 0.8823529);
    path_0.lineTo(size.width * 0.2500000, size.height * 0.4229412);
    path_0.lineTo(size.width * 0.5000000, size.height * 0.1582353);
    path_0.close();
    path_0.moveTo(size.width * 0.5000000, 0);
    path_0.lineTo(0, size.height * 0.5294118);
    path_0.lineTo(size.width * 0.1500000, size.height * 0.5294118);
    path_0.lineTo(size.width * 0.1500000, size.height);
    path_0.lineTo(size.width * 0.4500000, size.height);
    path_0.lineTo(size.width * 0.4500000, size.height * 0.6470588);
    path_0.lineTo(size.width * 0.5500000, size.height * 0.6470588);
    path_0.lineTo(size.width * 0.5500000, size.height);
    path_0.lineTo(size.width * 0.8500000, size.height);
    path_0.lineTo(size.width * 0.8500000, size.height * 0.5294118);
    path_0.lineTo(size.width, size.height * 0.5294118);
    path_0.lineTo(size.width * 0.5000000, 0);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = fillColor.withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
