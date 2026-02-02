import 'package:aic_planner/shared/data/constants.dart';
import 'package:flutter/material.dart';

class CancelButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final IconData icon;

  const CancelButton({
    super.key,
    required this.onTap,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -2,
      left: -2,
      child: GestureDetector(
        onTap: onTap,
        child: CustomPaint(
          painter: _SideLineButtonPainter(),
          child: SizedBox(
            height: 40,
            width: 125,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Icon(icon, color: Colors.white, size: 16),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SideLineButtonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppCustomColors.secondaryUI
          .withValues(alpha: 0.8) // background color
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = Colors.white54
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // Create path for button shape with top-right sideways line
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width - 15, 0); // top line
    path.lineTo(size.width, 15); // diagonal side line instead of corner
    path.lineTo(size.width, size.height); // right side
    path.lineTo(0, size.height); // bottom
    path.close();

    canvas.drawPath(path, paint);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
