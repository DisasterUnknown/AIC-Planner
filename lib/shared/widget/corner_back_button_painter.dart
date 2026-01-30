import 'package:aic_planner/shared/data/constants.dart';
import 'package:flutter/material.dart';

class CornerBackButtonPainter extends CustomPainter {
  final double alphaValue;

  const CornerBackButtonPainter({
    this.alphaValue = 0.7,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppCustomColors.secondaryUI.withValues(alpha: alphaValue)
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = Colors.white54
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final path = Path();
    // Draw a slanted rectangle like a "corner wedge"
    path.moveTo(-1, -1);
    path.lineTo(size.width + 10, -1);
    path.lineTo(size.width - 5, size.height);
    path.lineTo(-1, size.height);
    path.close();

    canvas.drawPath(path, paint);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
