import 'package:flutter/material.dart';

class GamePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var _paint = Paint()
      ..color = Colors.teal
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
