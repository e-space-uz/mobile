import 'package:flutter/material.dart';

class ProfileCustomPaint extends CustomPainter {
  final Color fillColor;

  const ProfileCustomPaint(this.fillColor);

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.5000000, size.height * 0.1250000);
    path_0.cubicTo(
        size.width * 0.5647059,
        size.height * 0.1250000,
        size.width * 0.6176471,
        size.height * 0.1812500,
        size.width * 0.6176471,
        size.height * 0.2500000);
    path_0.cubicTo(
        size.width * 0.6176471,
        size.height * 0.3187500,
        size.width * 0.5647059,
        size.height * 0.3750000,
        size.width * 0.5000000,
        size.height * 0.3750000);
    path_0.cubicTo(
        size.width * 0.4352941,
        size.height * 0.3750000,
        size.width * 0.3823529,
        size.height * 0.3187500,
        size.width * 0.3823529,
        size.height * 0.2500000);
    path_0.cubicTo(
        size.width * 0.3823529,
        size.height * 0.1812500,
        size.width * 0.4352941,
        size.height * 0.1250000,
        size.width * 0.5000000,
        size.height * 0.1250000);
    path_0.close();
    path_0.moveTo(size.width * 0.5000000, size.height * 0.7500000);
    path_0.cubicTo(
        size.width * 0.6588235,
        size.height * 0.7500000,
        size.width * 0.8411765,
        size.height * 0.8306250,
        size.width * 0.8529412,
        size.height * 0.8750000);
    path_0.lineTo(size.width * 0.1470588, size.height * 0.8750000);
    path_0.cubicTo(
        size.width * 0.1605882,
        size.height * 0.8300000,
        size.width * 0.3417647,
        size.height * 0.7500000,
        size.width * 0.5000000,
        size.height * 0.7500000);
    path_0.close();
    path_0.moveTo(size.width * 0.5000000, 0);
    path_0.cubicTo(
        size.width * 0.3700000,
        0,
        size.width * 0.2647059,
        size.height * 0.1118750,
        size.width * 0.2647059,
        size.height * 0.2500000);
    path_0.cubicTo(
        size.width * 0.2647059,
        size.height * 0.3881250,
        size.width * 0.3700000,
        size.height * 0.5000000,
        size.width * 0.5000000,
        size.height * 0.5000000);
    path_0.cubicTo(
        size.width * 0.6300000,
        size.height * 0.5000000,
        size.width * 0.7352941,
        size.height * 0.3881250,
        size.width * 0.7352941,
        size.height * 0.2500000);
    path_0.cubicTo(size.width * 0.7352941, size.height * 0.1118750,
        size.width * 0.6300000, 0, size.width * 0.5000000, 0);
    path_0.close();
    path_0.moveTo(size.width * 0.5000000, size.height * 0.6250000);
    path_0.cubicTo(
        size.width * 0.3429412,
        size.height * 0.6250000,
        size.width * 0.02941176,
        size.height * 0.7087500,
        size.width * 0.02941176,
        size.height * 0.8750000);
    path_0.lineTo(size.width * 0.02941176, size.height);
    path_0.lineTo(size.width * 0.9705882, size.height);
    path_0.lineTo(size.width * 0.9705882, size.height * 0.8750000);
    path_0.cubicTo(
        size.width * 0.9705882,
        size.height * 0.7087500,
        size.width * 0.6570588,
        size.height * 0.6250000,
        size.width * 0.5000000,
        size.height * 0.6250000);
    path_0.close();

    Paint painFill = Paint()..style = PaintingStyle.fill;
    painFill.color = fillColor.withOpacity(1.0);
    canvas.drawPath(path_0, painFill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
