import 'package:aic_planner/pages/database/bloc/database_bloc.dart';
import 'package:aic_planner/pages/database/bloc/database_state.dart';
import 'package:aic_planner/shared/data/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FacilityDetailView extends StatelessWidget {
  const FacilityDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatabaseBloc, DatabaseState>(
      builder: (context, state) {
        final facility = state.selectedFacility;

        if (facility == null) {
          return const SizedBox(); // Nothing selected
        }

        return Positioned(
          top: -2,
          left: 57,
          right: 137,
          bottom: -2,
          child: CustomPaint(
            painter: _FacilityDetailPainter(alphaValue: 0.5),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(60, 20, 20, 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _FacilityDetailPainter extends CustomPainter {
  final double alphaValue;

  _FacilityDetailPainter({this.alphaValue = 0.5});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppCustomColors.secondaryUI.withValues(alpha: alphaValue)
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
