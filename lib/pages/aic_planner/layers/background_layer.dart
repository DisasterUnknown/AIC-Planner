import 'dart:math';
import 'package:flutter/material.dart';

class BackgroundLayer extends StatelessWidget {
  const BackgroundLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF444545), // base dark grey ground
      child: CustomPaint(
        size: Size.infinite,
        painter: AicGroundPainter(),
      ),
    );
  }
}

class AicGroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.withOpacity(0.05)
      ..strokeWidth = 1;

    final rand = Random();

    // subtle scattered noise for texture
    for (int i = 0; i < 2000; i++) {
      canvas.drawCircle(
        Offset(rand.nextDouble() * size.width, rand.nextDouble() * size.height),
        0.5,
        paint,
      );
    }

    // optional: very subtle diagonal lines to mimic floor panels
    final linePaint = Paint()
      ..color = Colors.grey.withOpacity(0.03)
      ..strokeWidth = 1;

    const step = 40.0;
    for (double y = 0; y < size.height + size.width; y += step) {
      canvas.drawLine(Offset(0, y), Offset(y, 0), linePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
