import 'package:aic_planner/shared/data/constants.dart';
import 'package:flutter/material.dart';

class FacilityDetailPainter extends CustomPainter {

  const FacilityDetailPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppCustomColors.secondaryUI.withValues(alpha: 0.7)
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = Colors.white54.withValues(alpha: 0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final path = Path();

    // Slanted wedge style like the back button
    path.moveTo(53, -2); // start after corner back
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 53);
    path.lineTo(37, 53); // slant start
    path.close();

    canvas.drawPath(path, paint);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
